//
//  UIImageView+badge.m
//  cfp-ios
//
//  Created by ZhaoMirror on 16/12/19.
//  Copyright © 2016年 zkbc. All rights reserved.
//

#import "UIImageView+badge.h"

@implementation UIImageView (badge)
- (void)showBadge{
    
    //移除之前的小红点
    [self removeBadge];
    
    //新建小红点
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = 888 ;
    badgeView.layer.cornerRadius = 5;
    badgeView.backgroundColor = [UIColor redColor];
    CGRect tabFrame = self.frame;
    
    //确定小红点的位置

    CGFloat x = ceilf(tabFrame.size.width-3);
    CGFloat y = ceilf(-8);
    badgeView.frame = CGRectMake(x, y, 10, 10);
    [self addSubview:badgeView];
    
}

- (void)hideBadge{
    
    //移除小红点
    [self removeBadge];
    
}

- (void)removeBadge{
    
    //按照tag值进行移除
    for (UIView *subView in self.subviews) {
        
        if (subView.tag == 888) {
            
            [subView removeFromSuperview];
            
        }
    }
}

@end
