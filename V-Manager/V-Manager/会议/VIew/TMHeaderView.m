//
//  TMHeaderView.m
//  VHkeeper
//
//  Created by 塔米 on 2018/6/10.
//  Copyright © 2018年 tami. All rights reserved.
//

#import "TMHeaderView.h"
#import "UIButton+cfphelper.h"

@implementation TMHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {

        CGFloat width = 40;
        CGFloat top = 20;
        CGFloat height = 100-2*top;
        CGFloat marg = (kScreenW-4*width)/5;
        _PayBtn  = [[UIButton alloc] initWithFrame:CGRectMake(marg, top, width, height)];
        [_PayBtn creatButtonWithImageName:@"" andTitleName:@"已付款项" andBgLabelName:@"10%"];
        [self addSubview:_PayBtn];
        
        _ideaBtn = [[UIButton alloc] initWithFrame:CGRectMake(2*marg+width, top, width, height)];
        [_ideaBtn creatButtonWithImageName:@"" andTitleName:@"意见箱" andBgLabelName:@""];
        [self addSubview:_ideaBtn];
       
        _needChangeBtn = [[UIButton alloc] initWithFrame:CGRectMake(3*marg+2*width, top, width, height)];
        [_needChangeBtn creatButtonWithImageName:@"" andTitleName:@"需求变化" andBgLabelName:@""];
        [self addSubview:_needChangeBtn];
        
        _remindBtn = [[UIButton alloc] initWithFrame:CGRectMake(4*marg+3*width, top, width, height)];
        [_remindBtn creatButtonWithImageName:@"" andTitleName:@"小V提醒" andBgLabelName:@""];
        [self addSubview:_remindBtn];
      
        
        _bottomView  = [[UIView alloc] initWithFrame:CGRectMake(0, self.height-50, kScreenW, 50)];
        [self addSubview:_bottomView];
        _bottomView.backgroundColor = [UIColor lightGrayColor];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 20, 20)];
        [_bottomView addSubview:imgView];
        imgView.backgroundColor = Color(113, 113, 113);
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 70, 30)];
        [_bottomView addSubview:label];
        label.text = @"活动流程";
        label.font = Font12;
        label.textColor = kRGBColor(35, 35, 35, 1);
        
        _editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _editBtn.frame = CGRectMake(kScreenW-80, 0, 80, 50);
        [_editBtn setTitle:@"编辑" forState:UIControlStateNormal];
        _editBtn.titleLabel.font = Font12;
        [_editBtn setTitleColor:kRGBColor(35, 35, 35, 1) forState:UIControlStateNormal];
        [_bottomView addSubview:_editBtn];
        [_editBtn setImage:[UIImage imageNamed:@"向右"] forState:UIControlStateNormal];
        [_editBtn setImage:[UIImage imageNamed:@"向右"] forState:UIControlStateSelected];
        [_editBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -_editBtn.imageView.size.width, 0, _editBtn.imageView.size.width)];
        [_editBtn setImageEdgeInsets:UIEdgeInsetsMake(15, _editBtn.titleLabel.bounds.size.width, 15, -_editBtn.titleLabel.bounds.size.width)];
    }
    return self;
}


@end
