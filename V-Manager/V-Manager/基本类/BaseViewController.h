//
//  BaseViewController.h
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/4.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VMConfig.h"
#import "VMUserInfo.h"
#import "VMNetworkService.h"
#import "AppDelegate.h"

@interface BaseViewController : UIViewController
@property (nonatomic, weak) VMConfig*          config;
@property (nonatomic, weak) VMUserInfo*         userInfo;
@property (nonatomic, weak) VMNetworkService*  networkService;
//@property (nonatomic, weak) CFPLocalstorage*  localstorage;
@property (nonatomic, copy) NSString*           networkAccessIdentifier;
@property (nonatomic, strong) UIImageView*        norecordImageView;
@property (nonatomic, strong) UILabel*        norecordLabel;


+ (id)simpleInstance;
- (void)showToastMessage:(NSString*)message;
@end
