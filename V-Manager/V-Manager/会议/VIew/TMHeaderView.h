//
//  TMHeaderView.h
//  VHkeeper
//
//  Created by 塔米 on 2018/6/10.
//  Copyright © 2018年 tami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMHeaderView : UIView

@property (assign, nonatomic) CGFloat itemHeight;

/* bottomView */
@property (nonatomic, strong) UIView *bottomView;

/* editBtn */
@property (nonatomic, strong) UIButton *PayBtn;

/* ideaBtn */
@property (nonatomic, strong) UIButton *ideaBtn;

/* needChangeBtn */
@property (nonatomic, strong) UIButton *needChangeBtn;

/* remindBtn */
@property (nonatomic, strong) UIButton *remindBtn;

/* editBtn */
@property (nonatomic, strong) UIButton *editBtn;


@end
