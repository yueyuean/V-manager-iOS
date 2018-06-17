//
//  NSString+N6Helper.m
//  mobip2p
//
//  Created by Guo Yu on 14/11/1.
//  Copyright (c) 2014年 zkbc. All rights reserved.
//

#import "NSString+N6Helper.h"

@implementation NSString (N6Helper)

- (NSString*)n6_trimmedString {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)n6_isEmpty {
    BOOL res = (nil == self ||0 == [[self n6_trimmedString] length]);
    return res;
//    return (nil == self ||0 == [[self n6_trimmedString] length]);
}

- (BOOL)n6_isEmail {
    NSString *emailRegex =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    NSPredicate *emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", emailRegex];
    
    return [emailPredicate evaluateWithObject:self];
}

- (BOOL)n6_isMobile {
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189,177
     * 170
     */
//    NSString *mobileRegex = @"^1(3[0-9]|47|5[0-35-9]|7[06-8]|8[0-9])\\d{8}$";
    NSString *mobileRegex = @"^1[0-9]{10}";//以1开头，共11位
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", mobileRegex];
    
    return [predicate evaluateWithObject:self];
}

/**
 * 固定电话验证 ：区号+座机号码+分机号码
 */
- (BOOL)n6_isTelephone {
   
    NSString *telephoneRegex = @"(\\(\\d{3,4}\\)|\\d{3,4}-|\\s|\\d{3,4})?\\d{8}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", telephoneRegex];
    
    return [predicate evaluateWithObject:self];
}

/**
 * QQ验证
 */
- (BOOL)n6_isQQ{
    
    NSString *qqRegex = @"^[1-9][0-9]{4,10}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", qqRegex];
    
    return [predicate evaluateWithObject:self];
}

/**
 * 身份证验证
 */
- (BOOL)n6_isIdentityCard {
    NSString *IDRegex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",IDRegex2];
    return [predicate evaluateWithObject:self];
}

/**
 * 纯数字验证
 */
- (BOOL)n6_isNumber {
    NSString *numberRegex =
    @"^[0-9]*$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    return [predicate evaluateWithObject:self];
}

/**
 * 只能输入字母、数字、汉字验证
 */
- (BOOL)n6_isName {
    NSString *nameRegex =
    @"^[a-zA-Z\u4e00-\u9fa5][a-zA-Z0-9_\u4E00-\u9FA5]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    return [predicate evaluateWithObject:self];
}

/**
 * 只能输入字母、数字验证
 */
- (BOOL)n6_isPassWord {
    NSString *passwordRegex =
    @"[a-zA-Z0-9]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex];
    return [predicate evaluateWithObject:self];
}

/**
 * 以数字开头验证
 */
- (BOOL)n6_isNumberHeader {
    NSString *numberHeaderRegex =
    @"^[0-9][a-zA-Z0-9_\u4E00-\u9FA5]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberHeaderRegex];
    return [predicate evaluateWithObject:self];
}

/** 
 * 金额格式（至多小数点后两位） 
 */
-(BOOL)n6_isMoneyFormat {
//    NSString *moneyRegex = @"^(\\-|\\+)?\\d*\\.\\d+|\\d+\\.\\d*|[1-9]\\d*$";
    NSString *moneyRegex = @"^(\\-|\\+)?\\d*\\.\\d{0,2}$|\\d+\\.\\d{0,2}$|[1-9]\\d*$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", moneyRegex];
    return [predicate evaluateWithObject:self];
}

/**
 * 将金额金额字符串格式化成标准金额字符串
 */
+ (NSString*)n6_amountStringWithDouble:(double)amount {
    NSMutableString *resultString = [NSMutableString stringWithFormat:@"%.2f", amount];
    
    BOOL bellowZearo = NO;
    if (amount < 0.0f) {
        bellowZearo = YES;
        [resultString replaceCharactersInRange:NSMakeRange(0, 1) withString:@""];
    }
    NSInteger count = ([resultString length] - 1) / 3 - 2;
    NSInteger mod = [resultString length]%3==0?3:[resultString length]%3;
    
    for (int i=0; i<=count; i++) {
        [resultString insertString:@"," atIndex:mod+3*(count-i)];
    }
    
    if (bellowZearo) {
        [resultString insertString:@"-" atIndex:0];
    }
    
    return [NSString stringWithString:resultString];
}

/**
 * 将金额金额字符串格式化成标准金额字符串
 */
- (NSString*)n6_amountString {
    return [[self class] n6_amountStringWithDouble:[self doubleValue]];
}

/**
 *  长度为6~18个字符,支持数字/大小写字母/标点符号,不允许有空格
 *
 */
- (BOOL)n6_isMMPassword {
    NSString *moneyRegex = @"^[a-zA-Z0-9]{6,18}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", moneyRegex];
    return [predicate evaluateWithObject:self];
}

+ (NSString *)formattedGenderWithIdCardNo:(NSString *)idCardNo{
    int a=0;
    if (idCardNo.length==15) {
        a=[idCardNo substringFromIndex:14].intValue;
    }else if (idCardNo.length==18){
        a=[idCardNo substringWithRange:NSMakeRange(16, 1)].intValue;
    }
    if (a%2==1) {
        return @"男";
    }else{
        return @"女";
    }
}


+ (NSString *)removeTheLastZero:(NSString *)num
{
    NSString * s = nil;
    unsigned long offset = num.length - 1;
    while (offset)
    {
        s = [num substringWithRange:NSMakeRange(offset, 1)];
        if ([s isEqualToString:@"."]) {
            offset--;
            break;
        }
        if ([s isEqualToString:@"0"])
        {
            offset--;
        }
        else
        {
            break;
        }
    }
    NSString * outNumber = [num substringToIndex:offset+1];
    return outNumber;
}

/** 保留字符串中头@headLen位，尾部tailLen位，其余置换成'*' */
- (NSString *)n6_hideWithKeepHeadLength:(NSUInteger)headLen tailLength:(NSUInteger)tailLen {
    if (self.length <= (headLen + tailLen)) {
        return self;
    }
    NSRange replaceRange = NSMakeRange(headLen, self.length - tailLen - headLen);
    
    return [self stringByReplacingCharactersInRange:replaceRange withString:@"*"];
}

- (NSString *)n6_hideWithKeepHeadLength:(NSUInteger)headLen
                             tailLength:(NSUInteger)tailLen
                                 ignore:(unichar)ignore
                                replace:(unichar)replace {
    
    
    if (self.length <= (headLen + tailLen)) {
        return self;
    }
    
    NSMutableString *res = [NSMutableString stringWithString:self];
    
    NSString *replaceString = [NSString stringWithCharacters:&replace length:1];
    for (NSUInteger i = 0; i < res.length; i++) {
        if (i >= headLen && i < (res.length - tailLen)) {
            if ([self characterAtIndex:i] != ignore) {
                [res replaceCharactersInRange:NSMakeRange(i, 1) withString:replaceString];
            }
        }
    }
    return [NSString stringWithString:res];
}



@end
