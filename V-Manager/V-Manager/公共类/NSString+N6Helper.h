//
//  NSString+N6Helper.h
//  mobip2p
//
//  Created by Guo Yu on 14/11/1.
//  Copyright (c) 2014年 zkbc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (N6Helper)

- (NSString*)n6_trimmedString;
- (BOOL)n6_isEmpty;
- (BOOL)n6_isEmail;
- (BOOL)n6_isMobile;

/**
 * 固定电话验证 ：区号+座机号码+分机号码
 */
- (BOOL)n6_isTelephone;

/**
 * QQ验证
 */
- (BOOL)n6_isQQ;

/** 用户名验证 */
- (BOOL)n6_isName;

/** 身份证验证 */
- (BOOL)n6_isIdentityCard;

/** 纯数字验证 */
- (BOOL)n6_isNumber;

/** 密码验证 */
- (BOOL)n6_isPassWord;

/** 以数字开头验证 */
- (BOOL)n6_isNumberHeader;

/** 金额格式（至多小数点后两位） */
- (BOOL)n6_isMoneyFormat;

- (BOOL)n6_isMMPassword;

+ (NSString*)n6_amountStringWithDouble:(double)amount;

- (NSString*)n6_amountString;

+ (NSString *)formattedGenderWithIdCardNo:(NSString *)idCardNo;

+ (NSString *)removeTheLastZero:(NSString *)num;
+ (NSString *)removePre1:(NSString *)str;

- (NSString *)n6_hideWithKeepHeadLength:(NSUInteger)headLen tailLength:(NSUInteger)tailLen;
- (NSString *)n6_hideWithKeepHeadLength:(NSUInteger)headLen
                             tailLength:(NSUInteger)tailLen
                                 ignore:(unichar)ignore
                                replace:(unichar)replace;

@end
