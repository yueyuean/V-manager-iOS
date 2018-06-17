//
//  TMEditProcessHeaderView.h
//  V-Manager
//
//  Created by 塔米 on 2018/6/14.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^MyTapAction)(NSInteger tag);

@interface TMEditProcessHeaderView : UIView

@property (nonatomic, strong) MyTapAction myTapAction;

@property (nonatomic, strong) UILabel *timeLable;

@property (nonatomic, strong) UIImageView *upOrdownImage;

- (void)upDateSelectNum:(NSString *)SelectNum andWithGroupName:(NSString *)groupName;

@end
