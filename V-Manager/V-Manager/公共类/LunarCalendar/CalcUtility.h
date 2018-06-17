//
//  CalcUtility.h
//  ReleaseLife
//
//  Created by ZhaoMirror on 15/7/5.
//  Copyright (c) 2015年 com.mirrorzhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalcUtility : NSObject
+(NSString *)getChineseHoliday:(int)aMonth day:(int)aDay;

+(NSString *)getBuddhaday:(int)aMonth day:(int)aDay;
+(NSString *)getGuanyinzhaiday:(int)aMonth day:(int)aDay;



+(NSString *)getLiuzhaiday:(int)aMonth day:(int)aDay;
+(NSString *)getShizhaiday:(int)aMonth day:(int)aDay;
+(NSString *)getliuzhaiday:(int)aYear month:(int)aMonth day:(int)aDay;
+(NSString *)getWeekDay:(int)aYear month:(int)aMonth week:(int)aWeek dayInWeek:(int)aDay;
@end
