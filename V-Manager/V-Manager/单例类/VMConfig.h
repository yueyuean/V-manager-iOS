//
//  VMConfig.h
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/4.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import <Foundation/Foundation.h>
//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface VMConfig : NSObject
/** 当前设备系统版本 */
@property (nonatomic, assign) float             osVersion;
/** 当前设备系统版本 */
@property (nonatomic, copy) NSString *        deviceName;
/** 程序启动次数 */
@property (nonatomic, assign) NSInteger         launchCount;
@property (nonatomic, assign) NSTimeInterval    idleTimeInterval;
/** 轮播滚动时间间隔 */
@property (nonatomic, assign) NSTimeInterval    bannerDisplayTimeInterval;
/** 程序启动次数 */
/** 用户名 */
@property (nonatomic, copy  ) NSString*         loginName;
/** 用户密码 */
@property (nonatomic, copy  ) NSString*         loginPassword;
/** 手势密码 */
@property (nonatomic, copy  ) NSString*         patternLockNumber;
/** 是否使用手势密码解锁屏幕 */
@property (nonatomic, assign) BOOL              usingPatternLock;

/** 进入后台时间 */
@property (nonatomic, assign) NSTimeInterval    enterBackgroundTime;
@property (nonatomic, assign) NSTimeInterval    lastNetworkAccessTime;
/** 网络超时时间 */
@property (nonatomic, assign) NSTimeInterval    networkAccessTimeout;
@property (nonatomic, assign) NSTimeInterval    networkAccessIdleTimeout;
/** 获取短信验证码最新时间 */
@property (nonatomic, assign) NSTimeInterval    lastGettingSMSTime;
/** 是否永久记录会话 */
@property (nonatomic, assign) BOOL              sessionPermanent;

/** sesionId */
@property (nonatomic, copy  ) NSString          *sessionId;
/** 调试开关 */
@property (nonatomic, assign) BOOL              debug;
/** 手机号 */
@property (nonatomic, copy) NSString            *phoneNumber;

/** 用户id*/
@property (nonatomic, copy) NSString            *userID;


/** deviceToken */
@property (nonatomic, copy) NSString            *deviceToken;
/** wordcheck */
@property (nonatomic, strong) NSString            *wordcheckcnt;


/*增加了版本号*/
@property (nonatomic, assign)  BOOL         verVerified;
/*增加了版本号*/
@property (nonatomic, assign)  BOOL         ifWindowOpened;

/*是否设置了密码*/
@property (nonatomic, assign)  BOOL        ifPasswordConfiged;

/*用户未读文章数*/
@property (nonatomic, strong) NSString        *articleNoReadCount;

/*用户未读消息数*/
@property (nonatomic, strong) NSString        *messageNoReadCount;
+ (VMConfig *)shared;
- (void)clearLogin;
@end
