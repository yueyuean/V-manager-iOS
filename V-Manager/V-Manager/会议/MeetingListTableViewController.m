//
//  MeetingListTableViewController.m
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/14.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "MeetingListTableViewController.h"
#import "MeetingGistViewController.h"
#import "TMMeetingContentAndGistViewController.h"

@interface MeetingListTableViewController ()
@property (strong, nonatomic) IBOutlet UIView *headerView;

@end

@implementation MeetingListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self initData];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;

}

-(void)initData
{
    self.navigationItem.title=@"北京香格里拉酒店";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setUpTableViewHeaderView {
    //DDLogDebug(@"！！！！如果看到这条信息，有可能StoryBoard中设置的固定HeaderView无法显示，请用重载该方法为空！！！！");
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        MeetingGistViewController *vc = [MeetingGistViewController new];
        [self.navigationController pushViewController:vc animated:YES];
        self.tabBarController.tabBar.hidden = YES;
    }
    else {
        TMMeetingContentAndGistViewController *vc = [TMMeetingContentAndGistViewController new];
        [self.navigationController pushViewController:vc animated:YES];
        self.tabBarController.tabBar.hidden = YES;
    }
    
//    TMMeetingContentAndGistViewController *vc = [TMMeetingContentAndGistViewController new];
//    [self.navigationController pushViewController:vc animated:YES];
    
//    MeetingGistViewController *vc = [MeetingGistViewController new];
//    [self.navigationController pushViewController:vc animated:YES];
}

@end
