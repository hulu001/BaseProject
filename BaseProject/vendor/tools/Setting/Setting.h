//
//  Setting.h
//
//  Created by Yuan on 13-9-16.
//  Copyright (c) 2013年 Yuan.He. All rights reserved.
//

#import <Foundation/Foundation.h>

//Aes加密的密钥
#define kAesPassword   @"com.xxt.app.aescrypt.c7ce4a7dd2dba74160ebbad82d2cc8db"
//未登陆的默认token
#define kDefaultCryptToken  @"baseProject@app"


static NSString * const kPCServiceDomain                   = @"com.xxtstudio.iosdev";

static NSString * const kDeviceUUID                        = @"kechain.deviceuuid";

static NSString * const kUserToken                         = @"kechain.usertoken";

static NSString * const kUserOriginToken                   = @"kechain.userorigintoken";

static NSString * const kUserID                            = @"kechain.userid";

static NSString * const kUserInfo                          = @"kechain.userinfo";


static NSString * const kDeviceToken                       = @"devicetoken";

static NSString * const kIsShowGuide                       = @"isShowGuide";

static NSString * const kIsPublishCommentWithAppstore      = @"isPublishCommentWithAppstore";

@interface Setting : NSObject

+ (void)storeValue:(id)value forKey:(NSString *)key;

+ (id)getValueForKey:(NSString *)key;

+ (BOOL)isAuthValid;

+ (void)resetIsShowGuide;

+ (BOOL)isPublishCommentWithAppstore;

+ (NSString *)deviceUUID;

+ (NSString *)cryptToken;

+ (NSString *)originToken;

+ (NSString *)userID;


@end
