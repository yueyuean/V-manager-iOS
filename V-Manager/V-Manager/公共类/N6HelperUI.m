//
//  N6HelperUI.m
//  mobip2p
//
//  Created by Guo Yu on 14-10-22.
//  Copyright (c) 2014年 zkbc. All rights reserved.
//

#import "N6HelperUI.h"


UIColor *UIColorFromRGBValue(UInt32 rgbValue) {
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0
                           green:((float)((rgbValue & 0xFF00) >> 8))/255.0
                            blue:((float)(rgbValue & 0xFF))/255.0
                           alpha:1.0];
}

UIColor *UIColorFromRGBDecValue(unsigned int r, unsigned int g, unsigned int b) {
    return [UIColor colorWithRed:((float)r)/255.0f
                           green:((float)g)/255.0f
                            blue:((float)b)/255.0f
                           alpha:1.0];
}


// 根据16进制颜色字符串转换成UIColor, Added by 赵潘明 on 2016-03-01
UIColor *UIColorFromRGBString(NSString * color) {
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
    cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
    cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
    return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

NSString * N6GenerateUUID(void) {
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef theString = CFUUIDCreateString(NULL, theUUID);
    NSString *unique = [NSString stringWithString:(__bridge id)theString];
    CFRelease(theString);
    CFRelease(theUUID);
    
    return unique;
}

NSString  *removePre1(NSString * str)
{
    NSString * tempstr;
    NSString * returnstr;
    if (str.length>2)
    {
        tempstr=[str substringToIndex:2];
        
        
        if ([tempstr isEqualToString:@"1."] || [tempstr isEqualToString:@"1。"] ||[tempstr isEqualToString:@"1、"])
        {
            returnstr = [str substringFromIndex:2];
            return returnstr;
            
        }
        
    }
    return str;
    
}



NSString * n6convertDistance(CGFloat meters)
{
    
    CGFloat km=floor(meters/1000);
    CGFloat m=floor(meters);
    if (km>=1 &&km <10000)
    {
        return [NSString stringWithFormat:@"%d公里",(int)km];
    }
    if (km>10000)
    {
        return @"1万公里以上";
    }
    if (km<1)
    {
        return [NSString stringWithFormat:@"%d米",(int)m];
    }
    return @"";
}


