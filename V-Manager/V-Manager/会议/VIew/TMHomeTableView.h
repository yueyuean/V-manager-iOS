//
//  TMHomeTableView.h
//  VHkeeper
//
//  Created by 塔米 on 2018/6/8.
//  Copyright © 2018年 tami. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TMHeaderView;

@protocol TMBaseTableViewDelegate <NSObject>

- (void)toNextVC;

@end

@interface TMHomeTableView : UITableView

/* headerView */
@property (nonatomic, strong) TMHeaderView *functionView;

/* TMBaseTableViewDelegate */
@property (nonatomic, weak) id<TMBaseTableViewDelegate> nextDelegate;

@end
