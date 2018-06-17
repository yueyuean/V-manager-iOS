//
//  VMConfig.m
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/4.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "VMConfig.h"
#define kLaunchCount                @"vm_launch_count"
@interface VMConfig ()

@property (nonatomic, strong) NSUserDefaults *defaults;

@end
@implementation VMConfig
/**
 *  获取当前类单例对象
 */
+ (VMConfig *)shared {
    static dispatch_once_t predicate = 0;
    static VMConfig *object = nil;
    dispatch_once(&predicate, ^{ object = [[self class] new]; });
    return object;
}

/**
 *  初始化一些基本信息
 */
- (id)init {
    if ((self = [super init])) {
        self.defaults = [NSUserDefaults standardUserDefaults];
        // 当前设备系统版本
        self.osVersion = [[[UIDevice currentDevice]systemVersion]floatValue];
        self.deviceName=[[UIDevice currentDevice]name ];
        // 5分钟
        self.idleTimeInterval = 10.0f;
        self.bannerDisplayTimeInterval = 6.0f;
        // 网络超时时间
        self.networkAccessTimeout = 20.0f;
        self.networkAccessIdleTimeout = 120.0f;
        //
        //        [UMSocialData setAppKey:@"56a46f4c67e58ef1e800091e"];
        //        // 设置微信AppId、appSecret，分享url
        //        [UMSocialWechatHandler setWXAppId:@"wx828009e20489234a"
        //                                appSecret:@"59cb756e50ae73606886ee3cb83355e0"
        //                                      url:@"http://m.meme2c.com"];
        //
        //        // 设置QQ AppId、appSecret，分享url
        //        [UMSocialQQHandler setQQWithAppId:@"1105058989"
        //                                   appKey:@"dnDWwzQSAEs8j1qf"
        //                                      url:@"http://m.meme2c.com"];
        
        
        
    }
    return self;
}

#pragma mark - Accessors

/**
 *  获取应用的启动总次数
 */
- (NSInteger)launchCount {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *obj = [defaults objectForKey:kLaunchCount];
    if (nil == obj) {
        return 0;
    } else {
        return [obj integerValue];
    }
}

/**
 *  设置应用的启动次数
 */
- (void)setLaunchCount:(NSInteger)launchCount {
    [self.defaults setObject:@((NSInteger)launchCount) forKey:kLaunchCount];
    [self.defaults synchronize];
}
- (void)clearLogin {
    self.sessionId = nil;
    self.userID=nil;
    self.usingPatternLock = NO;
    
    
}
@end
