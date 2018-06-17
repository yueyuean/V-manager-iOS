//
//  InputButton.m
//  releaselife
//
//  Created by ZhaoMirror on 16/9/20.
//  Copyright © 2016年 mirrorzhao. All rights reserved.
//

#import "InputButton.h"

@implementation InputButton

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

@end
