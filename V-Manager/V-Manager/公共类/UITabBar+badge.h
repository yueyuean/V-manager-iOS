//
//  UITabBar+badge.h
//  cfp-ios
//
//  Created by Zhao panming on 16/7/18.
//  Copyright © 2016年 zkbc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (badge)

- (void)showBadgeOnItemIndex:(int)index;   //显示小红点

- (void)hideBadgeOnItemIndex:(int)index; //隐藏小红点

@end
