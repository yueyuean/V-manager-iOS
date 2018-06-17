//
//  LoginResponse.m
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/12.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "LoginResponse.h"
#define C_NICKNAME      @"nickName"
#define C_ICONURL     @"iconUrl"
#define C_TOKEN      @"token"
#define C_POSITIONNAME      @"positionName"

@implementation LoginResponse
+(id)responseWithReponseData:(NSData*)responseData {
    LoginResponse* response = [[self alloc] init];
    [response fromString: [[NSString alloc] initWithData: responseData encoding: NSUTF8StringEncoding]];
    return response;
}

-(id)init {
    self = [super init];
    if ( self ) {
    }
    return self;
}

-(void)setNickname:(NSString *)value{
    id objcValue;
    objcValue = value;
    self.context[C_NICKNAME] = objcValue;
};
-(NSString*)nickName{
    NSString* value = self.context[C_NICKNAME];
    return value;
}
-(void)setIconUrl:(NSString *)value{
    id objcValue;
    objcValue = value;
    self.context[C_ICONURL] = objcValue;
};
-(NSString*)iconUrl{
    NSString* value = self.context[C_ICONURL];
    return value;
}
-(NSString*)positionName{
    NSString* value = self.context[C_POSITIONNAME];
    return value;
}
-(void)setPositionName:(NSString *)value{
    id objcValue;
    objcValue = value;
    self.context[C_POSITIONNAME] = objcValue;
};
-(void)setToken:(NSString *)value{
    id objcValue;
    objcValue = value;
    self.context[C_TOKEN] = objcValue;
};
-(NSString*)token{
    NSString* value = self.context[C_TOKEN];
    return value;
}
@end
