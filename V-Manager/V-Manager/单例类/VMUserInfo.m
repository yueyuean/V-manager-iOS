//
//  VMUserInfo.m
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/4.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "VMUserInfo.h"

@implementation VMUserInfo
/**
 *  获取当前类单例对象
 */
+ (VMUserInfo *)shared {
    static dispatch_once_t predicate = 0;
    static VMUserInfo *object = nil;
    dispatch_once(&predicate, ^{ object = [[self class] new]; });
    return object;
}

- (id)init {
    self = [super init];
    if (self) {
        self.defaults = [NSUserDefaults standardUserDefaults];
        
        //获得应用程序的Documents文件夹
        NSArray * myPaths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
        _myDocPath = [myPaths objectAtIndex:0];//头像本地地址
        //获取文件的完整路径
        _filename = [_myDocPath stringByAppendingPathComponent:@"Localstorage.plist"];
        _data = [[NSMutableArray alloc]init];
    }
    return self;
}
//存储头像
-(void)setHeadPortrait:(UIImage*)image name:(NSString*)name{
    //图片存储到沙盒中
    NSString *filePath = [_myDocPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",name]];   // 保存文件的名称
    [UIImagePNGRepresentation(image)writeToFile: filePath    atomically:YES];
    NSMutableDictionary *info = [[NSMutableDictionary alloc]init];
    //在plist中保存路径
    [info setObject:filePath forKey:name];
    [_data addObject:info];
    [_data writeToFile:_filename atomically:YES];
}
//获取头像
-(UIImage*)getHeadPortrait:(NSString*)name{
    if ([[NSFileManager defaultManager] fileExistsAtPath:_filename]) {
        NSArray *data = [[NSArray alloc] initWithContentsOfFile:_filename];
        NSDictionary *info = [data objectAtIndex:0];
        NSString *filePath=[info objectForKey:name];
        UIImage *img = [UIImage imageWithContentsOfFile:filePath];
        
        return img;
    }
    return nil;
}
/*** 保存头像*/
- (void)setHeadimagedata:(NSData *)headImageData{
    [self.defaults setObject:headImageData forKey:kuHeadImageData];
    [self.defaults synchronize];
}
/*** 获取头像*/
- (NSData *)headImageData{
    return (NSData*)[self.defaults objectForKey:kuHeadImageData];
}

/*******************************************/
/*** 保存昵称*/
- (void)setNickName:(NSString *)nickName{
    [self.defaults setObject:nickName forKey:kuNickName];
    [self.defaults synchronize];
}
/*** 获取昵称*/
- (NSString *)nickName{
    return (NSString*)[self.defaults objectForKey:kuNickName];
}


/*** 保存UserId*/
- (void)setUserId:(NSString *)userId{
    [self.defaults setObject:userId forKey:kuUserId];
    [self.defaults synchronize];
}
/*** 获取userId*/
- (NSString *)userId{
    return (NSString*)[self.defaults objectForKey:kuUserId];
}


/*** 保存token*/
- (void)setToken:(NSString *)token{
    [self.defaults setObject:token forKey:kuToken];
    [self.defaults synchronize];
}
/*** 获取token*/
- (NSString *)token{
    return (NSString*)[self.defaults objectForKey:kuToken];
}


/*** 保存头像url*/
- (void)setHeadImgUrl:(NSString *)headImgUrl{
    [self.defaults setObject:headImgUrl forKey:kuHeadImgUrl];
    [self.defaults synchronize];
}
/*** 获取个url*/
- (NSString *)headImgUrl{
    return (NSString*)[self.defaults objectForKey:kuHeadImgUrl];
}


/*** 保存国家*/
- (void)setCountry:(NSString *)country{
    [self.defaults setObject:country forKey:kuCountry];
    [self.defaults synchronize];
}
/*** 获取国家*/
- (NSString *)country{
    return (NSString*)[self.defaults objectForKey:kuCountry];
}


/*** 保存省市*/
- (void)setProvince:(NSString *)province{
    [self.defaults setObject:province forKey:kuProvince];
    [self.defaults synchronize];
}
/*** 获取省市*/
- (NSString *)province{
    return (NSString*)[self.defaults objectForKey:kuProvince];
}


/*** 保存城市*/
- (void)setCity:(NSString *)city{
    [self.defaults setObject:city forKey:kuCity];
    [self.defaults synchronize];
}
/*** 获取城市*/
- (NSString *)city{
    return (NSString*)[self.defaults objectForKey:kuCity];
}


/*** 保存性别*/
- (void)setGender:(NSString *)gender{
    NSString *sex = nil;
    if ([gender isEqualToString:@"0"]) {
        sex = @"未知";
    } else if ([gender isEqualToString:@"1"]){
        sex = @"男";
    } else {
        sex = @"女";
    }
    
    [self.defaults setObject:sex forKey:kuGender];
    [self.defaults synchronize];
}
/*** 获取性别*/
- (NSString *)gender{
    return (NSString*)[self.defaults objectForKey:kuGender];
}


/*** 保存微信id*/
- (void)setWxOpenId:(NSString *)wxOpenId{
    [self.defaults setObject:wxOpenId forKey:kuWxOpenId];
    [self.defaults synchronize];
}
/*** 获取微信id*/
- (NSString *)wxOpenId{
    return (NSString*)[self.defaults objectForKey:kuWxOpenId];
}


/*** 保存电话*/
- (void)setPhoneNo:(NSString *)phoneNo{
    [self.defaults setObject:phoneNo forKey:kuPhoneNo];
    [self.defaults synchronize];
}
/*** 获取电话*/
- (NSString *)phoneNo{
    return (NSString*)[self.defaults objectForKey:kuPhoneNo];
}


/*** 保存特权*/
- (void)setPrivilege:(NSString *)privilege{
    [self.defaults setObject:privilege forKey:kuPrivilege];
    [self.defaults synchronize];
}
/*** 获取特权*/
-(NSString *)privilege{
    return (NSString*)[self.defaults objectForKey:kuPrivilege];
}


/*** 保存个人签名*/
- (void)setSignature:(NSString *)signature{
    [self.defaults setObject:signature forKey:kuSignature];
    [self.defaults synchronize];
}
/*** 获取个人签名*/
- (NSString *)signature{
    return (NSString*)[self.defaults objectForKey:kuSignature];
}


/*** 保存unionId*/
- (void)setUnionId:(NSString *)unionId{
    [self.defaults setObject:unionId forKey:kuUnionId];
    [self.defaults synchronize];
}
/*** 获取个人签名*/
- (NSString *)unionId{
    return (NSString*)[self.defaults objectForKey:kuUnionId];
}


/*** 保存GiveContent*/
- (void)setGiveContent:(NSString *)giveContent{
    [self.defaults setObject:giveContent forKey:kuGiveContent];
    [self.defaults synchronize];
}
/*** 获取回向文*/
- (NSString *)giveContent{
    return (NSString*)[self.defaults objectForKey:kuGiveContent];
}


- (void)clearLogin {
    self.nickName = nil;
    self.city = nil;
    self.country = nil;
    self.gender = nil;
    self.giveContent = nil;
    self.headImgUrl = nil;
    self.phoneNo = nil;
    self.privilege = nil;
    self.province = nil;
    self.signature = nil;
    self.unionId = nil;
    self.wxOpenId = nil;
    self.token = nil;
    self.userId = nil;
}

@end
