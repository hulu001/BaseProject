//
//  Setting.m
//
//  Created by Yuan on 13-9-16.
//  Copyright (c) 2013年 Yuan.He. All rights reserved.
//

#import "Setting.h"
#import "SFHFKeychainUtils.h"
#import "AESCrypt.h"

@implementation Setting


#pragma mark Store/Get value to/from NSUserDefaults

+ (void)storeValue:(id)value forKey:(NSString *)key
{
    key = [kAppBundleIdentifier stringByAppendingFormat:@".%@",key];
    HYLog(@"%@---->%@",key,value);
    NSUserDefaults *defaultsSetting = [NSUserDefaults standardUserDefaults];
    if (value==nil)
        [defaultsSetting removeObjectForKey:key];
    else
        [defaultsSetting setValue:value forKey:key];

    [defaultsSetting synchronize];
}

+ (id)getValueForKey:(NSString *)key
{
    if (key == nil)return nil;
    key = [kAppBundleIdentifier stringByAppendingFormat:@".%@",key];
    NSUserDefaults *defaultsSetting = [NSUserDefaults standardUserDefaults];
    return [defaultsSetting valueForKey:key];
}

#pragma mark 保存UserName和Password

+ (void)saveUserName:(NSString *)account
          password:(NSString *)pwd
{
    if ([SFHFKeychainUtils storeUsername:account
                             andPassword:pwd
                          forServiceName:kPCServiceDomain
                          updateExisting:true
                                   error:nil]){
        HYLog(@"保存信息到kechain成功！");
    }else{
        HYLog(@"保存信息到kechain失败！");
    };
}

+ (NSString *)getPasswordForUserName:(NSString *)account
{
    return [SFHFKeychainUtils getPasswordForUsername:account
                                      andServiceName:kPCServiceDomain
                                               error:nil];
}


#pragma 删除账号密码
+ (void)deletePasswordForUserName:(NSString *)username
{
    if ([SFHFKeychainUtils deleteItemForUsername:username andServiceName:kPCServiceDomain error:nil]){
        HYLog(@"删除kechain信息成功！");
    }else{
        HYLog(@"删除kechain信息失败！");
    }
}

/*Device uuid*/
+ (NSString *)deviceUUID{
    NSString *uuid = [Setting getPasswordForUserName:kDeviceUUID];
    if (!isValidString(uuid)) {
        uuid = [NSString createCUID];
        [Setting saveUserName:kDeviceUUID password:uuid];
    }
    return uuid;
}

/*获取token*/
+ (NSString *)cryptToken{
    return [Setting getUserInfoWithIndex:0];;
}

+ (NSString *)originToken
{
    NSString *cryptOriginToken = [Setting getPasswordForUserName:[kUserOriginToken stringByAppendingString:[Setting userID]]];
    if (isValidString(cryptOriginToken)) {
        NSString *originToken = [AESCrypt decrypt:cryptOriginToken password:[kAesPassword toMD5]];
        return originToken;
    }
    return @"";
}

//获取uid
+ (NSString *)userID{
    return [self getUserInfoWithIndex:1];;
}


/*根据index获取token或uid*/
+ (NSString *)getUserInfoWithIndex:(NSInteger)index
{
    NSString *userinfo = [Setting getPasswordForUserName:kUserInfo];
    if (isValidString(userinfo)) {
        NSString *decryptedUserInfo = [AESCrypt decrypt:userinfo password:[kAesPassword toMD5]];
        NSArray *info = [decryptedUserInfo componentsSeparatedByString:@","];
        if (isValidArray(info) && info.count == 2)
            return FormatString(info[index],@"");
    }
    return @"";
}

+ (void)saveOriginToken:(NSString *)token userID:(NSString *)uid
{
    if (isValidString(uid) && isValidString(token)) {
        //Aes encrypted user info
        NSString *encryptedUserInfo = [AESCrypt encrypt:token password:[kAesPassword toMD5]];
        [Setting saveUserName:[kUserOriginToken stringByAppendingString:uid] password:encryptedUserInfo];
    }
}

- (void)saveCryptToken:(NSString *)token userID:(NSString *)uid
{
    if (isValidString(uid) && isValidString(token)) {
        NSString *userinfo = [NSString stringWithFormat:@"%@,%@",token,uid];
        //Aes encrypted user info
        NSString *encryptedUserInfo = [AESCrypt encrypt:userinfo password:[kAesPassword toMD5]];
        [Setting saveUserName:kUserInfo password:encryptedUserInfo];
    }
}

+ (void)resetUserInfo
{
    [Setting deletePasswordForUserName:[kUserOriginToken stringByAppendingString:FormatString([Setting userID],@"")]];
    [Setting deletePasswordForUserName:kUserInfo];
}

//is auth valid
+ (BOOL)isAuthValid
{
    if (isValidString([Setting cryptToken]) && isValidString([Setting userID])) {
        return YES;
    }
    return NO;
}
+ (void)resetIsShowGuide
{
    NSString *key = [kIsShowGuide stringByAppendingString:kAppVersion];
    [Setting storeValue:nil forKey:key];
}

+ (BOOL)isShowGuide
{
    NSString *key = [kIsShowGuide stringByAppendingString:kAppVersion];
    return [Setting isExistedForKey:key];
}

+ (BOOL)isPublishCommentWithAppstore
{
    NSString *key = [kIsPublishCommentWithAppstore stringByAppendingString:kAppVersion];
    return [Setting isExistedForKey:key];
}

+ (BOOL)isExistedForKey:(NSString *)key
{
    if ([Setting getValueForKey:key]) {
        return NO;
    }else{
        [Setting storeValue:@(YES) forKey:key];
        return YES;
    }
}

@end
