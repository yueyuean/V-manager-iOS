//
//  NSDate+N6Helper.m
//  mobip2p
//
//  Created by Guo Yu on 14/11/18.
//  Copyright (c) 2014年 zkbc. All rights reserved.
//

#import "NSDate+N6Helper.h"

@implementation NSDate(N6Helper)

- (NSString *)n6_stringWithFormat:(NSString *)format {
    NSDateFormatter *outputFormatter = [NSDateFormatter new];
    [outputFormatter setDateFormat:format];
    NSString *dateString = [outputFormatter stringFromDate:self];
    return dateString;
}

+ (NSDate *)n6_dateWithString:(NSString *)string format:(NSString *)format {
    if (string == nil || format == nil) {
        return nil;
    }
    
    NSDateFormatter *inputFormatter = [NSDateFormatter new];
    [inputFormatter setDateFormat:format];
    NSDate *date = [inputFormatter dateFromString:string];
    
    return date;
}

@end
