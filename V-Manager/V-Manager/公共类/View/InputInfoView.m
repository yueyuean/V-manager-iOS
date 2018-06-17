//
//  InputInfoView.m
//  ReleaseLife
//
//  Created by ZhaoMirror on 15/6/24.
//  Copyright (c) 2015年 com.mirrorzhao. All rights reserved.
//

#import "InputInfoView.h"

@implementation InputInfoView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 0.6);
    CGContextSetLineWidth(context, 0.1);
    CGContextMoveToPoint(context, 0,self.frame.size.height-0.1);
    CGContextAddLineToPoint(context,self.frame.size.width, self.frame.size.height-0.1);
    


    
    CGContextMoveToPoint(context, 0,0.1);
    CGContextAddLineToPoint(context,self.frame.size.width,0.1);
   
//    CGContextMoveToPoint(context, 0,40);
//        CGContextSetRGBStrokeColor(context, 0.0, 0, 0, 0.5);
//    CGContextAddLineToPoint(context,self.frame.size.width, 40);
//    
//    CGContextMoveToPoint(context, 10,self.frame.size.height-50);
//    CGContextAddLineToPoint(context,self.frame.size.width-10, self.frame.size.height-50);
    
    CGContextStrokePath(context);
    
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
               self.backgroundColor=[UIColor whiteColor];
        self.titlelabel=[[UILabel alloc] initWithFrame:CGRectMake(0,15,self.frame.size.width,20)];
        self.titlelabel.textAlignment=NSTextAlignmentCenter;
        [self addSubview:self.titlelabel];
        self.commentlabel=[[UILabel alloc] initWithFrame:CGRectMake(5,self.frame.size.height-30,self.frame.size.width,20)];
        self.commentlabel.textAlignment=NSTextAlignmentCenter;
        [self addSubview: self.commentlabel];
        
        
    }
    return self;
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.nextResponder touchesBegan:touches withEvent:event];
}

@end
