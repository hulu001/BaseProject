//
//  Device.h
//
//  Created by yuan on 13-11-5.
//  Copyright (c) 2013年 Yuan.He. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Device : NSObject

+ (NSString *)deviceUUID;

+(NSString *)deviceInfo;

+ (NSString *)appInfo;

/*判断是否是iphone*/
+(BOOL)isiPhone;

@end
