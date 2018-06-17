//
//  KJStepper.m
//  KenJiao
//
//  Created by mac on 16/3/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "KJStepper.h"

@implementation KJStepper

+(instancetype)shareStepper{
    
    return [[KJStepper alloc]init];
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    NSLog(@"call %@", @"initWithCoder");
    if (self = [super initWithCoder:aDecoder]) {
        //设置背景图片
        self.layer.borderColor = [UIColor colorWithRed:220 green:220 blue:220 alpha:1.0].CGColor;
        self.layer.borderWidth = 1.0;
        self.layer.cornerRadius = 2.5;
        self.layer.masksToBounds = YES;
        self.clipsToBounds = YES;
        
        //设置默认值
        _value = 100;
        _minimumValue = 100;
        _maximumValue = 10000;
        _stepValue = 100;
        
        //创建增减按钮
        _subBtn = [[UIButton alloc]init];
        [_subBtn addTarget:self action:@selector(subValue:) forControlEvents:UIControlEventTouchUpInside];
        [_subBtn setImage:[UIImage imageNamed:@"jian"] forState:UIControlStateNormal];
        [_subBtn setImage:[UIImage imageNamed:@"jian"] forState:UIControlStateHighlighted];
        [self addSubview:_subBtn];
        
        _addBtn = [[UIButton alloc]init];
        [_addBtn addTarget:self action:@selector(addValue:) forControlEvents:UIControlEventTouchUpInside];
        [_addBtn setImage:[UIImage imageNamed:@"jia"] forState:UIControlStateNormal];
        [_addBtn setImage:[UIImage imageNamed:@"jia"] forState:UIControlStateHighlighted];
        [self addSubview:_addBtn];
        
        //创建显示数据的标签
        _amountLabel = [[UITextField alloc]init];
        _amountLabel.layer.borderColor = [UIColor colorWithRed:220 green:220 blue:220 alpha:1.0].CGColor;
        _amountLabel.layer.borderWidth = 1.0;
        _amountLabel.textColor = [UIColor blackColor];
        _amountLabel.textAlignment = NSTextAlignmentCenter;
        _amountLabel.text = [NSString stringWithFormat:@"%d",_value];
        _amountLabel.keyboardType=UIKeyboardTypeNumberPad;
        [self addSubview:_amountLabel];
    }
    return  self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        //设置背景图片
        self.layer.borderColor = [UIColor colorWithRed:220 green:220 blue:220 alpha:1.0].CGColor;
        self.layer.borderWidth = 1.0;
        self.layer.cornerRadius = 2.5;
        self.layer.masksToBounds = YES;
        self.clipsToBounds = YES;
        
        //设置默认值
        _value = 100;
        _minimumValue = 100;
        _maximumValue = 10000;
        _stepValue = 100;
        
        //创建增减按钮
        _subBtn = [[UIButton alloc]init];
        [_subBtn addTarget:self action:@selector(subValue:) forControlEvents:UIControlEventTouchUpInside];
        [_subBtn setImage:[UIImage imageNamed:@"jian"] forState:UIControlStateNormal];
        [_subBtn setImage:[UIImage imageNamed:@"jian"] forState:UIControlStateHighlighted];
        [self addSubview:_subBtn];
        
        _addBtn = [[UIButton alloc]init];
        [_addBtn addTarget:self action:@selector(addValue:) forControlEvents:UIControlEventTouchUpInside];
        [_addBtn setImage:[UIImage imageNamed:@"jia"] forState:UIControlStateNormal];
        [_addBtn setImage:[UIImage imageNamed:@"jia"] forState:UIControlStateHighlighted];
        [self addSubview:_addBtn];
        
        //创建显示数据的标签
        _amountLabel = [[UITextField alloc]init];
        _amountLabel.layer.borderColor = [UIColor colorWithRed:220 green:220 blue:220 alpha:1.0].CGColor;
        _amountLabel.layer.borderWidth = 1.0;
        _amountLabel.textColor = [UIColor blackColor];
        _amountLabel.textAlignment = NSTextAlignmentCenter;
        _amountLabel.text = [NSString stringWithFormat:@"%d",_value];
        _amountLabel.keyboardType=UIKeyboardTypeNumberPad;
        [self addSubview:_amountLabel];
    }
    return self;
}

#pragma mark - subValue
-(void)subValue:(UIButton *)btn{
    
    if (_value == 0) return;
    _value =_value-100;
    if (_value <0)
    {
        _value=0;
    }
    _amountLabel.text = [NSString stringWithFormat:@"%d",_value];
}

#pragma mark - addValue
-(void)addValue:(UIButton *)btn{
    
    if (_value == 100) return;
    _value=_value+100;
    if (_value >10000)
    {
        _value=10000;
    }
    _amountLabel.text = [NSString stringWithFormat:@"%d",_value];
}

//布局子视图frame
-(void)layoutSubviews{
    [super layoutSubviews];
    
    //减按钮
    _subBtn.frame = CGRectMake(0, 0, 30, self.frame.size.height);
    
    //标签
    _amountLabel.frame = CGRectMake(CGRectGetMaxX(_subBtn.frame), 0,self.frame.size.width-60, self.frame.size.height);
    
    //增按钮
    _addBtn.frame = CGRectMake(self.frame.size.width-30, 0, 30, self.frame.size.height);
}
@end
