//
//  NSDate+N6Helper.h
//  mobip2p
//
//  Created by Guo Yu on 14/11/18.
//  Copyright (c) 2014年 zkbc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate(N6Helper)

- (NSString *)n6_stringWithFormat:(NSString *)format;
+ (NSDate *)n6_dateWithString:(NSString *)string format:(NSString *)format;

@end
