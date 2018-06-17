//
//  Created by Guo Yu on 15/11/27.
//  Copyright © 2015年 zkbc. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface UIButton(cfphelper)

/**
 *  可以在xib里面直接设置
 */
@property (nonatomic, assign) IBInspectable NSUInteger cfpStyle;

@property (nonatomic, strong) IBInspectable UIColor *normalColor;
@property (nonatomic, strong) IBInspectable UIColor *highlightColor;

- (void)creatButtonWithImageName:(NSString *)imgName andTitleName:(NSString *)titleName andBgLabelName:(NSString *)bgLabelName;

@end
