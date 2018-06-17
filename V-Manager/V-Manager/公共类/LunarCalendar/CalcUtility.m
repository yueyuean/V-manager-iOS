//
//  CalcUtility.m
//  ReleaseLife
//
//  Created by ZhaoMirror on 15/7/5.
//  Copyright (c) 2015年 com.mirrorzhao. All rights reserved.
//

#import "CalcUtility.h"

@implementation CalcUtility

+(NSString *)getChineseHoliday:(int)aMonth day:(int)aDay
{
    NSDictionary *chineseHolidayDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                        @"春节", @"1|1",
                                        @"元宵", @"1|15",
                                        @"端午", @"5|5",
                                        @"七夕", @"7|7",
                                        @"中元", @"7|15",
                                        @"中秋", @"8|15",
                                        @"重阳", @"9|9",
                                        @"腊八", @"12|8",
                                        @"小年", @"12|24",
                                        @"除夕", @"12|30",
                                        nil];
    
    return [chineseHolidayDict objectForKey:[NSString stringWithFormat:@"%d|%d",aMonth,aDay]];
}




+(NSString *)getBuddhaday:(int)aMonth day:(int)aDay
{
    NSDictionary *chineseHolidayDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                        @"弥勒菩萨圣诞", @"1|1",
                                        @"定光佛圣诞", @"1|6",
                                        @"释迦牟尼出家日", @"2|8",
                                        @"释迦牟尼涅槃日", @"2|15",
                                        @"观世音菩萨圣诞", @"2|19",
                                        @"普贤菩萨圣诞", @"2|21",
                                        @"准提菩萨圣诞", @"3|16",
                                        @"文殊菩萨圣诞", @"4|4",
                                        @"释迦牟尼佛圣诞", @"4|8",
                                        @"佛吉祥日", @"4|15",
                                        @"药王菩萨圣诞", @"4|28",
                                        @"伽蓝菩萨圣诞", @"5|13",
                                        @"护法韦陀尊天菩萨圣诞", @"6|3",
                                        @"观世音菩萨成道日", @"6|19",
                                        @"大势至菩萨圣诞", @"7|13",
                                        @"佛欢喜日", @"7|15",
                                        @"龙树菩萨圣诞", @"7|24",
                                        @"地藏菩萨圣诞", @"7|30",
                                        @"月光菩萨圣诞", @"8|15",
                                        @"燃灯佛圣诞", @"8|22",
                                        @"观世音菩萨出家日", @"9|19",
                                        @"药师琉璃光如来圣诞", @"9|30",
                                        @"达摩祖师圣诞", @"10|5",
                                        @"阿弥陀佛圣诞", @"11|17",
                                        @"日光菩萨圣诞", @"11|19",
                                        @"释迦牟尼佛成道日", @"12|8",
                                        @"监斋菩萨圣诞", @"12|23",
                                        @"华严菩萨圣诞", @"12|29",
                                        nil];
    
    return [chineseHolidayDict objectForKey:[NSString stringWithFormat:@"%d|%d",aMonth,aDay]];
}

+(NSString *)getGuanyinzhaiday:(int)aMonth day:(int)aDay
{
    NSDictionary *chineseHolidayDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                        @"观音斋", @"1|8",
                                        @"观音斋", @"2|7",
                                        @"观音斋", @"2|9",
                                        @"观音斋", @"2|19",
                                        @"观音斋", @"3|3",
                                        @"观音斋", @"3|6",
                                        @"观音斋", @"3|16",
                                        @"观音斋", @"3|13",
                                        @"观音斋", @"4|22",
                                        @"观音斋", @"5|3",
                                        @"观音斋", @"5|17",
                                        @"观音斋", @"6|16",
                                        @"观音斋", @"6|18",
                                        @"观音斋", @"6|19",
                                        @"观音斋", @"6|23",
                                        @"观音斋", @"7|13",
                                        @"观音斋", @"8|16",
                                        @"观音斋", @"9|19",
                                        @"观音斋", @"9|23",
                                        @"观音斋", @"10|2",
                                        @"观音斋", @"11|19",
                                        @"观音斋", @"11|24",
                                        @"观音斋", @"12|25",
                                        nil];
    
    return [chineseHolidayDict objectForKey:[NSString stringWithFormat:@"%d|%d",aMonth,aDay]];
}





+(NSString *)getLiuzhaiday:(int)aMonth day:(int)aDay
{
    NSDictionary *chineseHolidayDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                        
                                        @"六斋日", @"1|8",
                                        @"六斋日", @"1|14",
                                        @"六斋日", @"1|15",
                                        @"六斋日", @"1|23",
                                        @"六斋日", @"1|29",
                                        @"六斋日", @"1|30",
                                        @"六斋日", @"2|8",
                                        @"六斋日", @"2|14",
                                        @"六斋日", @"2|15",
                                        @"六斋日", @"2|23",
                                        @"六斋日", @"2|29",
                                        @"六斋日", @"2|30",
                                        @"六斋日", @"3|8",
                                        @"六斋日", @"3|14",
                                        @"六斋日", @"3|15",
                                        @"六斋日", @"3|23",
                                        @"六斋日", @"3|29",
                                        @"六斋日", @"3|30",
                                        @"六斋日", @"4|8",
                                        @"六斋日", @"4|14",
                                        @"六斋日", @"4|15",
                                        @"六斋日", @"4|23",
                                        @"六斋日", @"4|29",
                                        @"六斋日", @"4|30",
                                        @"六斋日", @"5|8",
                                        @"六斋日", @"5|14",
                                        @"六斋日", @"5|15",
                                        @"六斋日", @"5|23",
                                        @"六斋日", @"5|29",
                                        @"六斋日", @"5|30",
                                        @"六斋日", @"6|8",
                                        @"六斋日", @"6|14",
                                        @"六斋日", @"6|15",
                                        @"六斋日", @"6|23",
                                        @"六斋日", @"6|29",
                                        @"六斋日", @"6|30",
                                        @"六斋日", @"7|8",
                                        @"六斋日", @"7|14",
                                        @"六斋日", @"7|15",
                                        @"六斋日", @"7|23",
                                        @"六斋日", @"7|29",
                                        @"六斋日", @"7|30",
                                        @"六斋日", @"8|8",
                                        @"六斋日", @"8|14",
                                        @"六斋日", @"8|15",
                                        @"六斋日", @"8|23",
                                        @"六斋日", @"8|29",
                                        @"六斋日", @"8|30",
                                        @"六斋日", @"9|8",
                                        @"六斋日", @"9|14",
                                        @"六斋日", @"9|15",
                                        @"六斋日", @"9|23",
                                        @"六斋日", @"9|29",
                                        @"六斋日", @"9|30",
                                        @"六斋日", @"10|8",
                                        @"六斋日", @"10|14",
                                        @"六斋日", @"10|15",
                                        @"六斋日", @"10|23",
                                        @"六斋日", @"10|29",
                                        @"六斋日", @"10|30",
                                        @"六斋日", @"11|8",
                                        @"六斋日", @"11|14",
                                        @"六斋日", @"11|15",
                                        @"六斋日", @"11|23",
                                        @"六斋日", @"11|29",
                                        @"六斋日", @"11|30",
                                        @"六斋日", @"12|8",
                                        @"六斋日", @"12|14",
                                        @"六斋日", @"12|15",
                                        @"六斋日", @"12|23",
                                        @"六斋日", @"12|29",
                                        @"六斋日", @"12|30",
                                        nil];
    
    return [chineseHolidayDict objectForKey:[NSString stringWithFormat:@"%d|%d",aMonth,aDay]];
}


+(NSString *)getShizhaiday:(int)aMonth day:(int)aDay
{
    NSDictionary *chineseHolidayDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                        @"十斋日", @"1|1",
                                        @"十斋日", @"1|8",
                                        @"十斋日", @"1|14",
                                        @"十斋日", @"1|15",
                                        @"十斋日", @"1|18",
                                        @"十斋日", @"1|23",
                                        @"十斋日", @"1|24",
                                        @"十斋日", @"1|28",
                                        @"十斋日", @"1|29",
                                        @"十斋日", @"1|30",
                                        @"十斋日", @"2|1",
                                        @"十斋日", @"2|8",
                                        @"十斋日", @"2|14",
                                        @"十斋日", @"2|15",
                                        @"十斋日", @"2|18",
                                        @"十斋日", @"2|23",
                                        @"十斋日", @"2|24",
                                        @"十斋日", @"2|28",
                                        @"十斋日", @"2|29",
                                        @"十斋日", @"2|30",
                                        @"十斋日", @"3|1",
                                        @"十斋日", @"3|8",
                                        @"十斋日", @"3|14",
                                        @"十斋日", @"3|15",
                                        @"十斋日", @"3|18",
                                        @"十斋日", @"3|23",
                                        @"十斋日", @"3|24",
                                        @"十斋日", @"3|28",
                                        @"十斋日", @"3|29",
                                        @"十斋日", @"3|30",
                                        @"十斋日", @"4|1",
                                        @"十斋日", @"4|8",
                                        @"十斋日", @"4|14",
                                        @"十斋日", @"4|15",
                                        @"十斋日", @"4|18",
                                        @"十斋日", @"4|23",
                                        @"十斋日", @"4|24",
                                        @"十斋日", @"4|28",
                                        @"十斋日", @"4|29",
                                        @"十斋日", @"4|30",
                                        @"十斋日", @"5|1",
                                        @"十斋日", @"5|8",
                                        @"十斋日", @"5|14",
                                        @"十斋日", @"5|15",
                                        @"十斋日", @"5|18",
                                        @"十斋日", @"5|23",
                                        @"十斋日", @"5|24",
                                        @"十斋日", @"5|28",
                                        @"十斋日", @"5|29",
                                        @"十斋日", @"5|30",
                                        @"十斋日", @"6|1",
                                        @"十斋日", @"6|8",
                                        @"十斋日", @"6|14",
                                        @"十斋日", @"6|15",
                                        @"十斋日", @"6|18",
                                        @"十斋日", @"6|23",
                                        @"十斋日", @"6|24",
                                        @"十斋日", @"6|28",
                                        @"十斋日", @"6|29",
                                        @"十斋日", @"6|30",
                                        @"十斋日", @"7|1",
                                        @"十斋日", @"7|8",
                                        @"十斋日", @"7|14",
                                        @"十斋日", @"7|15",
                                        @"十斋日", @"7|18",
                                        @"十斋日", @"7|23",
                                        @"十斋日", @"7|24",
                                        @"十斋日", @"7|28",
                                        @"十斋日", @"7|29",
                                        @"十斋日", @"7|30",
                                        @"十斋日", @"8|1",
                                        @"十斋日", @"8|8",
                                        @"十斋日", @"8|14",
                                        @"十斋日", @"8|15",
                                        @"十斋日", @"8|18",
                                        @"十斋日", @"8|23",
                                        @"十斋日", @"8|24",
                                        @"十斋日", @"8|28",
                                        @"十斋日", @"8|29",
                                        @"十斋日", @"8|30",
                                        @"十斋日", @"9|1",
                                        @"十斋日", @"9|8",
                                        @"十斋日", @"9|14",
                                        @"十斋日", @"9|15",
                                        @"十斋日", @"9|18",
                                        @"十斋日", @"9|23",
                                        @"十斋日", @"9|24",
                                        @"十斋日", @"9|28",
                                        @"十斋日", @"9|29",
                                        @"十斋日", @"9|30",
                                        @"十斋日", @"10|1",
                                        @"十斋日", @"10|8",
                                        @"十斋日", @"10|14",
                                        @"十斋日", @"10|15",
                                        @"十斋日", @"10|18",
                                        @"十斋日", @"10|23",
                                        @"十斋日", @"10|24",
                                        @"十斋日", @"10|28",
                                        @"十斋日", @"10|29",
                                        @"十斋日", @"10|30",
                                        @"十斋日", @"11|1",
                                        @"十斋日", @"11|8",
                                        @"十斋日", @"11|14",
                                        @"十斋日", @"11|15",
                                        @"十斋日", @"11|18",
                                        @"十斋日", @"11|23",
                                        @"十斋日", @"11|24",
                                        @"十斋日", @"11|28",
                                        @"十斋日", @"11|29",
                                        @"十斋日", @"11|30",
                                        @"十斋日", @"12|1",
                                        @"十斋日", @"12|8",
                                        @"十斋日", @"12|14",
                                        @"十斋日", @"12|15",
                                        @"十斋日", @"12|18",
                                        @"十斋日", @"12|23",
                                        @"十斋日", @"12|24",
                                        @"十斋日", @"12|28",
                                        @"十斋日", @"12|29",
                                        @"十斋日", @"12|30",                                        
                                        nil];
    
    return [chineseHolidayDict objectForKey:[NSString stringWithFormat:@"%d|%d",aMonth,aDay]];
}


+(NSString *)getliuzhaiday:(int)aYear month:(int)aMonth day:(int)aDay
{
    
    NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
    [dict setObject:@"世界哮喘日" forKey:@"0512"];
    [dict setObject:@"国际母亲节 救助贫困母亲日" forKey:@"0520"];
    [dict setObject:@"全国助残日" forKey:@"0530"];
    [dict setObject:@"国际牛奶日" forKey:@"0532"];
    [dict setObject:@"中国文化遗产日" forKey:@"0626"];
    [dict setObject:@"国际父亲节" forKey:@"0630"];
    [dict setObject:@"国际合作节" forKey:@"0716"];
    [dict setObject:@"被奴役国家周" forKey:@"0730"];
    [dict setObject:@"国际和平日" forKey:@"0932"];
    [dict setObject:@"全民国防教育日" forKey:@"0936"];
    [dict setObject:@"国际聋人节 世界儿童日" forKey:@"0940"];
    [dict setObject:@"世界海事日 世界心脏病日" forKey:@"0950"];
    [dict setObject:@"国际住房日 世界建筑日 世界人居日" forKey:@"1011"];
    [dict setObject:@"国际减灾日" forKey:@"1023"];
    [dict setObject:@"世界视觉日" forKey:@"1024"];
    [dict setObject:@"感恩节" forKey:@"1144"];
    [dict setObject:@"国际儿童电视广播日" forKey:@"1220"];
    
    NSString *result=nil;
    for (id key in [dict allKeys]) {
        NSString *dictMonth=[key substringToIndex:2];
        int dictWeek=[[[key substringFromIndex:2] substringToIndex:1] intValue];
        int dictDayInWeek=[[[key substringFromIndex:3] substringToIndex:1] intValue];
        
        if(aMonth==[dictMonth intValue])
        {
            NSString *resultDay=[self getWeekDay:aYear month:aMonth week:dictWeek dayInWeek:dictDayInWeek];
            
            if(resultDay)
            {
                if([resultDay intValue]==aDay )
                {
                    result=[dict objectForKey:key];
                }
            }
        }
    }
    
    return result;
}

+(NSString *)getWeekDay:(int)aYear month:(int)aMonth week:(int)aWeek dayInWeek:(int)aDay
{
    NSString* dateStr =[NSString stringWithFormat:@"%i 1 %i +0000",aMonth,aYear];
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"M d yyyy zzzz"];
    NSDate* date = [formater dateFromString:dateStr];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components: NSWeekdayCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:date];
    int firstWeek=[components weekday]-1;
    int result=0;
    aDay=aDay+1;
    
    if(aWeek<5)
    {
        result=(firstWeek>aDay?7:0)+7*(aWeek-1)+aDay-firstWeek;
    }
    
    if(result==0)
    {
        return nil;
    }
    else
    {
        return [NSString stringWithFormat:@"%i",result];
    }
}
@end
