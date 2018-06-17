//
//  PlannerButton.m
//  cfp-ios
//
//  Created by Zhao panming on 16/3/17.
//  Copyright © 2016年 zkbc. All rights reserved.
//

#import "PlannerButton.h"

@implementation PlannerButton


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:34.0/255.0 green:85.0/255.0 blue:141.0/255.0 alpha:1.0].CGColor);
    CGContextFillRect(context, CGRectMake(0, CGRectGetHeight(self.frame) - 0.5, CGRectGetWidth(self.frame), 2));
}
//-(id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self)
//    {
//        self.font=[UIFont systemFontOfSize:15];
//        
//    }
//    return self;
//}


@end
