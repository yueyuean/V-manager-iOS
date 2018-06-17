//
//  UIButton+InputLocButton.m
//  releaselife
//
//  Created by ZhaoMirror on 2017/3/14.
//  Copyright © 2017年 mirrorzhao. All rights reserved.
//

#import "InputLocButton.h"

@implementation InputLocButton
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor lightGrayColor].CGColor);
    CGContextFillRect(context, CGRectMake(0, CGRectGetHeight(self.frame) - 0.5, CGRectGetWidth(self.frame), 0.5));

}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        self.title=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-110, self.frame.size.height)];
        self.title.numberOfLines=0;
        self.title.font=[UIFont systemFontOfSize:13];
        self.title.textColor=[UIColor lightGrayColor];
        [self addSubview: self.title];
        self.titleLabel.hidden=YES;
        

    }
    
    return self;
}



@end
