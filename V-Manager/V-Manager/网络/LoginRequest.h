//
//  LoginRequest.h
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/12.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "MessageRequest.h"

@interface LoginRequest : MessageRequest
-(void)setMobile:(NSString*)value;
-(NSString*)mobile;
-(void)setPassWord:(NSString*)value;
-(NSString*)passWord;
@end
