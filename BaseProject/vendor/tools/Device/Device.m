//
//  Device.m
//  PinkDiary
//
//  Created by yuan on 13-11-5.
//  Copyright (c) 2013年 Yuan.He. All rights reserved.
//

#import "Device.h"
#include <sys/socket.h> // Per msqr
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>

@implementation Device


/*获取当前设备型号*/
+ (NSString*)getMachine{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *name = malloc(size);
    sysctlbyname("hw.machine", name, &size, NULL, 0);
    NSString *machine = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
    
    free(name);
    if( [machine isEqualToString:@"i386"] || [machine isEqualToString:@"x86_64"] ) machine = @"iPhone Simulator";
    else if( [machine isEqualToString:@"iPhone1,1"] ) machine = @"iPhone1";
    else if( [machine isEqualToString:@"iPhone1,2"] ) machine = @"iPhone3G";
    else if( [machine isEqualToString:@"iPhone2,1"] ) machine = @"iPhone3GS";
    else if( [machine isEqualToString:@"iPhone3,1"] ) machine = @"iPhone4";
    else if( [machine isEqualToString:@"iPhone4,1"] ) machine = @"iPhone4s";
    else if( [machine isEqualToString:@"iPhone5,1"] ) machine = @"iPhone5A&C";
    else if( [machine isEqualToString:@"iPhone5,2"] ) machine = @"iPhone5";
    else if( [machine isEqualToString:@"iPod1,1"] ) machine = @"iPod1";
    else if( [machine isEqualToString:@"iPod2,1"] ) machine = @"iPod2";
    else if( [machine isEqualToString:@"iPod3,1"] ) machine = @"iPod3";
    else if( [machine isEqualToString:@"iPod4,1"] ) machine = @"iPod4";
    else if( [machine isEqualToString:@"iPod5,1"] ) machine = @"iPod5";
    else if( [machine isEqualToString:@"iPad1,1"] ) machine = @"iPad1";
    else if( [machine isEqualToString:@"iPad2,1"] ) machine = @"iPad2_W";
    else if( [machine isEqualToString:@"iPad2,2"] ) machine = @"iPad2_G";
    else if( [machine isEqualToString:@"iPad2,3"] ) machine = @"iPad2_C";
    else if( [machine isEqualToString:@"iPad3,1"] ) machine = @"iPad3_W";
    else if( [machine isEqualToString:@"iPad4,1"] ) machine = @"iPad4";
    return [machine stringByReplacingOccurrencesOfString:@"," withString:@"_"];
}

+ (NSString *)systemVersion{
    return FormatString([[UIDevice currentDevice] systemVersion], @"");
}

/*获取设备信息*/
+(NSString *)deviceInfo{
    NSString *info = [NSString stringWithFormat:@"%@ %@ %@",[Device getMachine], [[UIDevice currentDevice] systemVersion], kAppVersion];
    return info;
}

/*获取设备SN*/

+ (NSString *)deviceUUID{
    return [Setting deviceUUID];
}

/*App信息*/
+ (NSString *)appInfo
{
    return [NSString stringWithFormat:@"BaseProject,%@,IOS,%@,machine:%@,%@,bdpush",kAppVersion,[Device systemVersion],[Device getMachine],[Device deviceUUID]];
}

/*判断是否是iphone*/
+(BOOL)isiPhone
{
    if ([[[[UIDevice currentDevice] model] lowercaseString] rangeOfString:@"iphone"].location == NSNotFound){
        return NO;
    }
    return YES;
}

@end
