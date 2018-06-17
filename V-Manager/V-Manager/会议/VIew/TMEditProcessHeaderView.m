//
//  TMEditProcessHeaderView.m
//  V-Manager
//
//  Created by 塔米 on 2018/6/14.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMEditProcessHeaderView.h"

@implementation TMEditProcessHeaderView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.timeLable = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width-200, 5, 150, 20)];
        [self addSubview:self.timeLable];
        self.timeLable.textColor = [UIColor whiteColor];
        self.timeLable.font = [UIFont systemFontOfSize:12];
        self.timeLable.hidden = YES;
        self.timeLable.textAlignment = NSTextAlignmentRight;
        
        
        self.upOrdownImage = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width-30, 20, 30, 20)];
        self.upOrdownImage.hidden = YES;
        [self addSubview:self.upOrdownImage];
       
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(myTapAction:)];
        self.tag =1000;
        [self addGestureRecognizer:tap];
        
    }
    return self;
}

-(void)myTapAction:(UITapGestureRecognizer *)tap {
    if (self.myTapAction != nil) {
        self.myTapAction(tap.view.tag);
    }
}

-(void)upDateSelectNum:(NSString *)SelectNum andWithGroupName:(NSString *)groupName {
    
}

@end
