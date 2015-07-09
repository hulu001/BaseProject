//
//  User.h
//  PinkCommunity
//
//  Created by yuan on 14-1-2.
//  Copyright (c) 2014年 yuan.he. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface PCUser :  MTLModel <MTLJSONSerializing>
//用户信息
@property (nonatomic, copy) NSString * uid;          //用户ID
@property (nonatomic, copy) NSString * account;      //用户帐号
@property (nonatomic, copy) NSString * nickname;     //用户呢称
@property (nonatomic, copy) NSString * email;        //用户邮箱
@property (nonatomic, copy) NSNumber * sex;          //用户性别
@property (nonatomic, copy) NSDate * birthday;       //用户生日
@property (nonatomic, copy) NSString * province;     //用户所在省
@property (nonatomic, copy) NSString * city;         //用户所在城市
@property (nonatomic, copy) NSString * signature;    //用户签名
@property (nonatomic, copy) NSString * avatar;       //用户头像
@property (nonatomic, copy) NSString * background;   //用户首页背景
@property (nonatomic, copy) NSNumber * experience;   //用户经验值
@property (nonatomic, copy) NSNumber * level;        //用户等级
@property (nonatomic, copy) NSNumber * nextLevelExp; //用户下次升级需要的经验
@property (nonatomic, copy) NSNumber * maxNumbers;    //用户写写日记时最大字数
@property (nonatomic, copy) NSNumber * isVip;            //是否是Vip
@property (nonatomic, copy) NSNumber * isAbility;        //是否是达人
@property (nonatomic, copy) NSNumber * abilityLevel;   //达人等级
//用户数据统计
@property (nonatomic, copy) NSNumber * diaryTimes;   //用户每天发表的日记数
@property (nonatomic, copy) NSNumber * secretDiaryTimes; //用户的私密日记篇数
@property (nonatomic, copy) NSNumber * commentTimes; //用户评论的次数
@property (nonatomic, copy) NSNumber * followMeTimes;    //用户的粉丝
@property (nonatomic, copy) NSNumber * meFollowTimes;    //用户的关注
@property (nonatomic, copy) NSNumber * meBlackTimes;     //被用户拉黑的人数
@property (nonatomic, copy) NSNumber * likeTimes;    //用户喜欢的
@property (nonatomic, copy) NSNumber * topicTimes;       //用户的话题数
@property (nonatomic, copy) NSNumber * isFollowMe;    //登陆用户是否关注当前用户
@property (nonatomic, copy) NSNumber * isMeFollow;    //当前用户是否关注登陆用户
@property (nonatomic, copy) NSArray  * photos;
@property (nonatomic, copy) NSArray  * tags;
@end


