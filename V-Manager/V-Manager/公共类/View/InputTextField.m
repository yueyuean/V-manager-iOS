//
//  InputTextField.m
//  ReleaseLife
//
//  Created by zhaopanming on 15/12/10.
//  Copyright © 2015年 com.mirrorzhao. All rights reserved.
//

#import "InputTextField.h"

@implementation InputTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor lightGrayColor].CGColor);
    CGContextFillRect(context, CGRectMake(0, CGRectGetHeight(self.frame) - 0.5, CGRectGetWidth(self.frame), 0.5));
}
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.font=[UIFont systemFontOfSize:12];
    }
    return self;
}
@end
