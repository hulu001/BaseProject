//
//  letterPaper.m
//  PinkCommunity
//
//  Created by yuan on 14-1-2.
//  Copyright (c) 2014年 yuan.he. All rights reserved.
//

#import "PCEmotionList.h"

@implementation PCEmotionList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"eid":@"id",
             @"coverS":@"cover_s",
             @"priceOrign":@"price_orign",
             @"priceFinal":@"price_final",
             @"priceDesc":@"price_desc",
             @"expireTime":@"expire_time",
             @"expireDesc":@"expire_desc",
             @"zipSize":@"zip_size",
             @"saleAmount":@"sale_amount",
             @"downloadUrl":@"download_url",
             @"useTime":@"use_time",
             @"nameTag":@"name_tag",
             };
}

+ (NSValueTransformer *)statusJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *str, BOOL *success, NSError *__autoreleasing *error) {
        return FormatNumber(str, @(0));
    }];
}
//
//+ (NSValueTransformer *)ownJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSString *str) {
//        return FormatNumber(str, @(0));
//    }];
//}
//
//+ (NSValueTransformer *)thumbnailJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSArray *thumbArray) {
//        NSMutableArray *thumbs = [NSMutableArray array];
//        [thumbArray enumerateObjectsUsingBlock:^(NSDictionary *thumbDic, NSUInteger idx, BOOL *stop) {
//            PCPaperEmotionThumbnail *thumbnail = [MTLJSONAdapter modelOfClass:[PCPaperEmotionThumbnail class] fromJSONDictionary:thumbDic error:nil];
//            [thumbs addObject:thumbnail];
//        }];
//        return thumbs;
//    }];
//}
//
//
//+ (NSValueTransformer *)expireTimeJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSString *str) {
//          return [NSDate dateWithTimeIntervalSince1970:[str doubleValue]];
//    }];
//}
//
//
//+ (NSValueTransformer *)datelineJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSString *str) {
//          return [NSDate dateWithTimeIntervalSince1970:[str doubleValue]];
//    }];
//}
//
//
//+ (NSValueTransformer *)authorJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSDictionary *author) {
//        return [MTLJSONAdapter modelOfClass:[PCUser class] fromJSONDictionary:author error:nil];
//    }];
//}
//
//+ (NSValueTransformer *)tagJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSArray *tags) {
//        NSMutableArray *tagArrary = [NSMutableArray array];
//        [tags enumerateObjectsUsingBlock:^(NSDictionary *tagDic, NSUInteger idx, BOOL *stop) {
//            PCPaperEmotionTag *tag =   [MTLJSONAdapter modelOfClass:[PCPaperEmotionTag class] fromJSONDictionary:tagDic error:nil];
//            [tagArrary addObject:tag];
//        }];
//        return tagArrary;
//    }];
//}
//
//+ (NSValueTransformer *)nameTagJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSDictionary *nameTag) {
//        return [MTLJSONAdapter modelOfClass:[PCPaperEmotionTag class] fromJSONDictionary:nameTag error:nil];
//    }];
//}
//
//+ (NSValueTransformer *)taskJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSDictionary *task) {
//        return [MTLJSONAdapter modelOfClass:[PCPaperEmotionTask class] fromJSONDictionary:task error:nil];
//    }];
//}
//
//
//+ (NSValueTransformer *)useTimeJSONTransformer
//{
//    return [MTLValueTransformer transformerWithBlock:^(NSDictionary *useTime) {
//        return [MTLJSONAdapter modelOfClass:[PCPaperEmotionUseTime class] fromJSONDictionary:useTime error:nil];
//    }];
//}
//
//+ (void)synchronizeLocal:(PCEmotionList *)emotion
//{
//    NSString *emotionPath = [PATH_OF_DOCUMENT stringByAppendingPathComponent:EMOTION_LIST_PATH(emotion.eid)];
//    [NSKeyedArchiver archiveRootObject:emotion toFile:emotionPath];
//}
//
//+ (PCEmotionList *)readEmotionListWithEid:(NSString *)eid
//{
//    if (!isValidString(eid)) {
//        return nil;
//    }
//    NSString *emotionListPath = [PATH_OF_DOCUMENT stringByAppendingPathComponent:EMOTION_LIST_PATH(eid)];
//    PCEmotionList *emotionList = [NSKeyedUnarchiver unarchiveObjectWithFile:emotionListPath];
//    return emotionList;
//}
//
//- (BOOL)isShowNew
//{
//    if ([PCEmotionList readEmotionListWithEid:self.eid]) {
//        return NO;
//    }
//    for (PCPaperEmotionTag *emotiontag in self.tag) {
//        if ([emotiontag.bg isEqualToString:@"new"]) {
//            return YES;
//        }
//    }
//    return NO;
//    
//}
//
//- (BOOL)isShowHot
//{
////    if ([PCEmotionList readEmotionListWithEid:self.eid]) {
////        return NO;
////    }
//    for (PCPaperEmotionTag *emotiontag in self.tag) {
//        if ([emotiontag.bg isEqualToString:@"hot"]) {
//            return YES;
//        }
//    }
//    return NO;
//}

@end
