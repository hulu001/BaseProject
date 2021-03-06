//
//  UIColor+Extensions.h
//  VExtensions
//
//  Created by Yuan on 14-6-16.
//  Copyright (c) 2014年 www.heyuan110.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIColor (UIColor_Extensions)

@property (nonatomic, readonly) CGFloat red;
@property (nonatomic, readonly) CGFloat green;
@property (nonatomic, readonly) CGFloat blue;
@property (nonatomic, readonly) CGFloat alpha;

+ (UIColor *)colorWithStringValue:(NSString *)string;
+(UIColor *) colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
+ (UIColor *)colorWithRGBValue:(NSInteger)rgb;
+ (UIColor *)colorWithRGBAValue:(NSUInteger)rgba;
- (UIColor *)initWithString:(NSString *)string;
- (UIColor *)initWithRGBValue:(NSInteger)rgb;
- (UIColor *)initWithRGBAValue:(NSUInteger)rgba;

- (NSInteger)RGBValue;
- (NSUInteger)RGBAValue;
- (NSString *)stringValue;

- (BOOL)isMonochromeOrRGB;
- (BOOL)isEquivalent:(id)object;
- (BOOL)isEquivalentToColor:(UIColor *)color;

+ (UIColor *)lightRandom;

@end
