//
//  YWCacheManager.h
//  BaseProject
//
//  Created by zhupetter on 15/6/29.
//  Copyright (c) 2015年 zhupetter. All rights reserved.
//
#import <Foundation/Foundation.h>

static NSString * const kCacheHomeAttationDiary                  = @"cacheHomeAttationDiary";
static NSString * const kCacheHomeHotDiary                       = @"cacheHomeHotDiary";
static NSString * const kCacheHomeNewDiary                       = @"cacheHomeNewDiary";
static NSString * const kCacheHomeDiaryDetail                    = @"cacheHomeDiaryDetail";
static NSString * const kCacheHomeDiaryDetailComment             = @"cacheHomeDiaryDetailComment";
static NSString * const kCacheMessagefollowDynamic               = @"cacheMessagefollowDynamic";

@interface YWCacheManager : NSObject

+ (void)saveCacheWithArray:(NSArray *)listArray forKey:(NSString *)key;

+ (NSArray *)getCacheWithKey:(NSString *)key;

+ (BOOL)clearCommunityCache;

@end
