//
//  YWNetworkManager.h
//  BaseProject
//
//  Created by ywl-ios2 on 15/7/1.
//  Copyright (c) 2015年 zhupetter. All rights reserved.
//

#import "AFHTTPSessionManager.h"

/**
 *	@brief	web请求成功和失败的Block，返回参数有result(请求返回的内容)，
 *           success(请求是否成功，如果有HTTP层或APP层错误都不算错误）,
 *           task 返回的Task
 */
typedef void (^RequestCallBackBlock)(BOOL success ,id result, NSURLSessionTask *task);

@interface YWNetworkManager : AFHTTPSessionManager

+ (instancetype)shareManager;

- (instancetype)initWithBaseURL:(NSURL *)url;


- (NSURLSessionTask *)requstGETPath:(NSString *)path
            parameter:(NSDictionary *)parameters
        callbackBlock:(RequestCallBackBlock)block;

- (NSURLSessionTask *)requstPOSTPath:(NSString *)path
                          parameter:(NSDictionary *)parameters
                      callbackBlock:(RequestCallBackBlock)block;
@end
