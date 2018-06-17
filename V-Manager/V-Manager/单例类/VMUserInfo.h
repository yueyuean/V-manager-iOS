//
//  VMUserInfo.h
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/4.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VMUserInfo : NSObject
@property (nonatomic, strong) NSUserDefaults *defaults;

/** 昵称 */
@property (nonatomic, strong) NSString          *nickName;
/** userId */
@property (nonatomic, strong) NSString          *userId;
/** token */
@property (nonatomic, strong) NSString          *token;

/** 头像图片Url */
@property (nonatomic, strong) NSString          *headImgUrl;
@property (nonatomic,strong) NSData             *headImageData;
/** 头像图片 */
@property (nonatomic, strong) NSString          *headPicName;

/** 国家 */
@property (nonatomic, strong) NSString          *country;
/** 省市 */
@property (nonatomic, strong) NSString          *province;
/** 城市 */
@property (nonatomic, strong) NSString          *city;

/** 性别 */
@property (nonatomic, strong) NSString          *gender;

/** 微信id */
@property (nonatomic, strong) NSString          *wxOpenId;

/** 电话 */
@property (nonatomic, strong) NSString          *phoneNo;

/** 特权 */
@property (nonatomic, strong) NSString          *privilege;

/** 个人签名 */
@property (nonatomic, strong) NSString          *signature;

/** 回向文 */
@property (nonatomic, strong) NSString          *giveContent;

/** unionId */
@property (nonatomic, strong) NSString          *unionId;

//头像本地地址
@property (nonatomic, copy) NSString *filename;
//数据数组
@property (nonatomic, copy) NSMutableArray *data;
//文件目录
@property (nonatomic, copy) NSString * myDocPath;

-(void)setHeadPortrait:(UIImage*)image name:(NSString*)name;
-(UIImage*)getHeadPortrait:(NSString*)name;

+ (VMUserInfo *)shared;
- (void)clearLogin;
@end
