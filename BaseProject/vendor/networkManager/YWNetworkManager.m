//
//  YWNetworkManager.m
//  BaseProject
//
//  Created by ywl-ios2 on 15/7/1.
//  Copyright (c) 2015年 zhupetter. All rights reserved.
//

#import "YWNetworkManager.h"
#import "AFNetworkActivityIndicatorManager.h"


#define kAppBaseURLString @"https://api.app.net/"
#define HUD_network_minShowTime 1.f //带网络请求的最小显示时间

//base parameters
static NSString *const BaseParameterTime        = @"time";
static NSString *const BaseParameterHostUid     = @"hostUid";
static NSString *const BaseParameterSignature   = @"signature";
static NSString *const BaseParameterAppinfo     = @"appInfo";
//request parameter key
static NSString *const ResquestParameters       = @"param";
static NSString *const ResponseStatus           = @"status";
static NSString *const ResponseMessage          = @"message";
static NSString *const ResponseResult           = @"data";
static NSString *const ResponseSuccessCode      = @"0";



@interface YWNetworkManager ()

@property (strong, nonatomic) NSDictionary *errorList;

@end
@implementation YWNetworkManager

+ (instancetype)shareManager
{
    static YWNetworkManager *_shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
        _shareManager = [[YWNetworkManager alloc] initWithBaseURL:[NSURL URLWithString:kAppBaseURLString]];
        _shareManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    return _shareManager;
}

- (instancetype)initWithBaseURL:(NSURL *)url
{
    
    self = [super initWithBaseURL:url sessionConfiguration:[self urlSessionConfiguration]];
    if (self) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"APIErrorCodeList" ofType:@"plist"];
        _errorList = [[NSMutableDictionary alloc]initWithContentsOfFile:filePath];
    }
    return self;
}

- (NSURLSessionConfiguration *)urlSessionConfiguration
{
    NSURLSessionConfiguration *sessionConfiguation = [NSURLSessionConfiguration defaultSessionConfiguration];
    sessionConfiguation.timeoutIntervalForRequest = 20.0;
    sessionConfiguation.timeoutIntervalForResource = 60.0;
    return sessionConfiguation;
}

- (NSString *)errorDescriptionWithErrorCode:(NSString *)errorCode
{
    if(_errorList != nil && errorCode && [errorCode length]>0){
        NSString *errorDescription = [_errorList objectForKey:errorCode];
        if (errorDescription == nil || [errorDescription length] < 1){
            errorDescription = [_errorList objectForKey:@"-404"];
        }
        return errorDescription;
    }
    return nil;
}


- (NSURLSessionTask *)requstGETPath:(NSString *)path
                           parameter:(NSDictionary *)parameters
                       callbackBlock:(RequestCallBackBlock)block
{
    NSDictionary *formatParameters = [self formatRequestParameters:[NSDictionary dictionaryWithDictionary:parameters] action:path];
    return  [self GET:path parameters:formatParameters success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([self checkServerReturnDataIsCorrect:responseObject]) {
            block(YES, [responseObject objectForKey:ResponseResult], task);
        }else{
            block(NO, nil, task);
            [self showNetworkError:[responseObject objectForKey:ResponseMessage]];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
          block(NO, nil, task);
        [self showNetworkError:[self errorDescriptionWithErrorCode:[NSString stringWithFormat:@"%@",@(error.code)]]];
    }];
}

- (NSURLSessionTask *)requstPOSTPath:(NSString *)path
                           parameter:(NSDictionary *)parameters
                       callbackBlock:(RequestCallBackBlock)block
{
    NSDictionary *formatParameters = [self formatRequestParameters:[NSDictionary dictionaryWithDictionary:parameters] action:path];
    return  [self POST:path parameters:formatParameters success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([self checkServerReturnDataIsCorrect:responseObject]) {
            block(YES, [responseObject objectForKey:ResponseResult], task);
        }else{
            block(NO, nil, task);
            [self showNetworkError:[responseObject objectForKey:ResponseMessage]];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        block(NO, nil, task);
        [self showNetworkError:[self errorDescriptionWithErrorCode:[NSString stringWithFormat:@"%@",@(error.code)]]];
    }];
}

- (NSDictionary *)requestBaseParameters:(NSString *)action
                             parameters:(NSDictionary *)parameters{
    //本地时间戳
    NSString *time = [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]];
    
    //用户token
    NSString *user_token = [Setting cryptToken];
    user_token = isValidString(user_token)?user_token:kDefaultCryptToken;
    
    //用户uid
    NSString *uid = [Setting userID];
    
    //其他参数
    NSString *paramertersJson = (isValidDictionary(parameters))?[parameters toJsonString]:@"";
    
    //签名
    NSString* signature=[[NSString stringWithFormat:@"%@%@%@%@%@",action,uid,paramertersJson,time,user_token] toMD5];
    NSDictionary *baseParameters = @{BaseParameterTime:time,
                                     BaseParameterAppinfo:[Device appInfo],
                                     BaseParameterSignature:signature,
                                     BaseParameterHostUid:uid};
    return baseParameters;
}

- (NSDictionary *)formatRequestParameters:(NSDictionary *)parameters action:(NSString *)methord
{
    NSMutableDictionary *newParameters = [NSMutableDictionary dictionaryWithDictionary:[self requestBaseParameters:methord parameters:parameters]];
    newParameters[ResquestParameters] = (isValidDictionary(parameters))?[parameters toJsonString]:@"";
    HYLog(@"\n参数: %@",newParameters);
    return newParameters;
}



- (void)showNetworkError:(NSString *)message
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(HUD_network_minShowTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [self HUDWithView:[[UIApplication sharedApplication] keyWindow] text:message];
        [hud hide:YES afterDelay:2.0f];
        
    });
}

- (BOOL)checkServerReturnDataIsCorrect:(id)responseObject
{
    NSString *status = [responseObject objectForKey:ResponseStatus];

    if ([status intValue] == [ResponseSuccessCode integerValue]) {
        return YES;
    }
    else {
        return NO;
    }
}

- (MBProgressHUD *)HUDWithView:(UIView *)view text:(NSString *)text
{
    if (text == nil || text.length == 0) {
        return nil;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.opacity = 0.5;
    hud.minShowTime = 1.5;
    hud.labelText = text;
    hud.removeFromSuperViewOnHide = YES;
    return hud;
}

@end
