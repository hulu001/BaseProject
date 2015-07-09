//
//  LetterPaper.h
//  PinkCommunity
//
//  Created by yuan on 14-1-2.
//  Copyright (c) 2014年 yuan.he. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PCUser.h"
@class PCPaperEmotionUseTime, PCPaperEmotionTag, PCPaperEmotionTask, PCPaperEmotionUseTime;
@interface PCEmotionList :  MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString * eid;          //信纸id
@property (nonatomic, copy) NSString * name;         //名称
@property (nonatomic, copy) NSString * desc;         //简介
@property (nonatomic, copy) NSString * label;        //标签
@property (nonatomic, copy) NSString * cover;        //封面
@property (nonatomic, copy) NSString * coverS;       //封面小图
@property (nonatomic, copy) NSString * background;   //推广图地址
@property (nonatomic, copy) NSArray  * thumbnail;    //预览图地址(多张，以逗号分隔开)
@property (nonatomic, copy) NSString * zipSize;      //压缩包大小(比特)
@property (nonatomic, copy) NSString * saleAmount;   //购买量
@property (nonatomic, copy) NSString * priceOrign;   //原价
@property (nonatomic, copy) NSString * priceFinal;   //最终价(会员价、折扣价)
@property (nonatomic, copy) NSString * priceDesc;    //对priceFinal的说明
@property (nonatomic, copy) NSString * copyright;    //版权所有
@property (nonatomic, copy) NSString * category;     //类别(数组代表信纸具有多个类别)
@property (nonatomic, copy) NSDate   * expireTime;   //有效期(时间戳，0为永久有效)
@property (nonatomic, copy) NSString * expireDesc;   //对有效时间的说明
@property (nonatomic, copy) NSDate   * dateline;     //用户使用有效期(时间戳,0为永久有效)
@property (nonatomic, copy) NSNumber * status;       //状态(0上架，1为下架)
@property (nonatomic, copy) NSNumber * own;          //是否已购买(1为已购买,0为未购买)
@property (nonatomic, copy) NSString * downloadUrl;  //下载链接
@property (nonatomic, copy) NSArray * tag;  //表情标签
@property (nonatomic, copy) PCPaperEmotionUseTime * useTime;  //表情标签
@property (nonatomic, copy) PCPaperEmotionTag * nameTag;  //类别
@property (nonatomic, copy) PCPaperEmotionTask * task;  //任务说明
@property (nonatomic, copy) PCUser * author;  //作者

//+ (void)synchronizeLocal:(PCEmotionList *)emotion;
//
//+ (PCEmotionList *)readEmotionListWithEid:(NSString *)eid;
//
//- (BOOL)isShowNew;
//
//- (BOOL)isShowHot;
@end


