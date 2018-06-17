//
//  LoginResponse.h
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/12.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "MessageResponse.h"

@interface LoginResponse : MessageResponse
-(void)setNickname:(NSString*)value;
-(NSString*)nickName;
-(void)setToken:(NSString*)value;
-(NSString*)token;
-(void)setPositionName:(NSString*)value;
-(NSString*)positionName;
-(void)setIconUrl:(NSString*)value;
-(NSString*)iconUrl;


@end
