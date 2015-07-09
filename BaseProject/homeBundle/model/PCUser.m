//
//  User.m
//  PinkCommunity
//
//  Created by yuan on 14-1-2.
//  Copyright (c) 2014年 yuan.he. All rights reserved.
//

#import "PCUser.h"
#define SAVEUSERPATH [NSString stringWithFormat:@"user/%@",[Setting sharedSetting].userID]
@implementation PCUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"isVip":@"is_vip",
             @"isAbility":@"is_ability",
             @"maxNumbers":@"max_numbers",
             @"isFollowMe":@"is_followme",
             @"isMeFollow":@"is_mefollow",
             @"tags":@"tag_list",
             @"abilityLevel":@"ability_level"
             };
}

+ (NSValueTransformer *)sexJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *str, BOOL *success, NSError *__autoreleasing *error) {
        return FormatNumber(str, @(0));
    }];
}
//
//+ (NSValueTransformer *)signatureJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSString *str) {
//        if (isValidString(str)) {
//            return str;
//        }else{
//            return @"暂无签名";
//        }
//    }];
//}
//
//+ (NSValueTransformer *)experienceJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSString *str) {
//        return FormatNumber(str, @(0));
//    }];
//}
//
//+ (NSValueTransformer *)levelJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSString *str) {
//        return FormatNumber(str, @(0));
//    }];
//}
//
//+ (NSValueTransformer *)nextLevelExpJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSString *str) {
//        return FormatNumber(str, @(0));
//    }];
//}
//
//+ (NSValueTransformer *)maxNumbersJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSString *str) {
//        return FormatNumber(str, @(0));
//    }];
//}
//
//+ (NSValueTransformer *)isVipJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSString *str) {
//        return FormatNumber(str, @(0));
//    }];
//}
//
//+ (NSValueTransformer *)isAbilityJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSString *str) {
//        return FormatNumber(str, @(0));
//    }];
//}
//
//+ (NSValueTransformer *)abilityLevelJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSString *str) {
//        return FormatNumber(str, @(0));
//    }];
//}
//
//
//+ (NSValueTransformer *)diaryTimesJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSString *str) {
//        return FormatNumber(str, @(0));
//    }];
//}
//
//+ (NSValueTransformer *)secretDiaryTimesJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSString *str) {
//        return FormatNumber(str, @(0));
//    }];
//}
//
//+ (NSValueTransformer *)commentTimesJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSString *str) {
//        return FormatNumber(str, @(0));
//    }];
//}
//
//+ (NSValueTransformer *)followMeTimesJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSString *str) {
//        return FormatNumber(str, @(0));
//    }];
//}
//
//+ (NSValueTransformer *)meFollowTimesJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSString *str) {
//        return FormatNumber(str, @(0));
//    }];
//}
//
//+ (NSValueTransformer *)meBlackTimesJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSString *str) {
//        return FormatNumber(str, @(0));
//    }];
//}
//
//+ (NSValueTransformer *)likeTimesJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSString *str) {
//        return FormatNumber(str, @(0));
//    }];
//}
//
//+ (NSValueTransformer *)topicTimesJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSString *str) {
//        return FormatNumber(str, @(0));
//    }];
//}
//
//
//+ (NSValueTransformer *)birthdayJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSString *str) {
//        return [str toDate];
//    }];
//}
//
//+ (NSValueTransformer *)photosJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSArray *photoArray) {
//        return [self photoToAttch:photoArray];
//    }];
//}
//
//+ (NSValueTransformer *)tagsJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSArray *tagArray) {
//        return [PCTag addTags:tagArray];
//    }];
//}
//
//+ (NSArray *)photoToAttch:(NSArray *)photoArray
//{
//    NSMutableArray *photos = [NSMutableArray array];
//    [photoArray enumerateObjectsUsingBlock:^(NSString *photoPath, NSUInteger idx, BOOL *stop) {
//        NSString *aid = [NSString stringWithFormat:@"%lu",(long)(idx+1)];
//        NSDictionary *attch = @{@"id":aid,@"attachmentPath":photoPath};
//        
//        PCAttatch *att = [MTLJSONAdapter modelOfClass:[PCAttatch class] fromJSONDictionary:attch error:nil];
//        [photos addObject:att];
//    }];
//    return photos;
//}
//
//
//[NSKeyedArchiver archiveRootObject:models toFile:@""];
//[NSKeyedUnarchiver unarchiveObjectWithFile:@""];

@end
