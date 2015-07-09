//
//  YWCacheManager.m
//  BaseProject
//
//  Created by zhupetter on 15/6/29.
//  Copyright (c) 2015年 zhupetter. All rights reserved.
//

#import "YWCacheManager.h"

#define COMMUNITY_CACHE_PREFIX    [NSString stringWithFormat:@"community_cache_user"]

@implementation YWCacheManager

+ (void)saveCacheWithArray:(NSArray *)listArray forKey:(NSString *)key
{
    NSString *cachePath = [PATH_OF_CACHE stringByAppendingPathComponent:[NSString stringWithFormat:@"%@_%@",COMMUNITY_CACHE_PREFIX, key]];
    NSMutableArray *cacheArray = [NSMutableArray arrayWithArray:listArray];
    [NSKeyedArchiver archiveRootObject:cacheArray toFile:cachePath];
}

+ (NSArray *)getCacheWithKey:(NSString *)key
{
    NSString *cachePath = [PATH_OF_CACHE stringByAppendingPathComponent:[NSString stringWithFormat:@"%@_%@",COMMUNITY_CACHE_PREFIX, key]];
    NSArray *cacheList = [NSKeyedUnarchiver unarchiveObjectWithFile:cachePath];
    return cacheList;
}

+ (BOOL)clearCommunityCache
{
    return [VFileManager removeFilesInDirectoryAtPath:PATH_OF_CACHE withPrefix:COMMUNITY_CACHE_PREFIX];
}

@end
