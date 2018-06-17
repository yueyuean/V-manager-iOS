//
//  TMHomeTableView.m
//  VHkeeper
//
//  Created by 塔米 on 2018/6/8.
//  Copyright © 2018年 tami. All rights reserved.
//

#import "TMHomeTableView.h"
#import "TMHeaderView.h"

@interface TMHomeTableView()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation TMHomeTableView

- (void)setFunctionView:(TMHeaderView *)functionView {
    _functionView = functionView;
    
    self.dataSource = self;
    self.delegate = self;
    
    self.scrollIndicatorInsets = UIEdgeInsetsMake(self.functionView.height, 0, 0, 0);
    
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.functionView.height)];
    self.tableHeaderView = tableHeaderView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01f;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseFirstTableViewCell = @"CellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseFirstTableViewCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseFirstTableViewCell];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.textColor = [UIColor orangeColor];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"TableView:第%ld行", (long)indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.nextDelegate toNextVC];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat placeHolderHeight = self.functionView.height - self.functionView.itemHeight;
    CGFloat offsetY = scrollView.contentOffset.y;
    
    //导航条的高度SafeAreaTop    
    if (offsetY >= 0 && offsetY <= placeHolderHeight) {
        self.functionView.y = -offsetY+SafeAreaTop+HeaderViewH;
    }
    else if (offsetY > placeHolderHeight) {
        self.functionView.y = - placeHolderHeight+SafeAreaTop+HeaderViewH;
    }
    else if (offsetY <0) {//下拉
        //self.headerView.y =  - offsetY+naviBarH;
        self.functionView.y =  SafeAreaTop+HeaderViewH;

    }
}


@end
