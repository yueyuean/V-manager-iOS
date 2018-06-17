//
//  LoginRequest.m
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/12.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "LoginRequest.h"
#import "LoginResponse.h"
#define C_MOBILE      @"mobile"
#define C_PASSWORD      @"passWord"

@implementation LoginRequest
+(Class)responseClass {
    return [LoginResponse class];
}

+(NSString*)RA_type {
    return @"user/login";
}

-(id)init {
    self = [super init];
    if ( self ) {
    }
    return self;
}

-(void)setMobile:(NSString*)value {
    id objcValue;
    objcValue = value;
    self.context[C_MOBILE] = objcValue;
}

-(NSString*)mobile {
    NSString* value = self.context[C_MOBILE];
    return value;
}
-(void)setPassWord:(NSString *)value {
    id objcValue;
    objcValue = value;
    self.context[C_PASSWORD] = objcValue;
}

-(NSString*)passWord {
    NSString* value = self.context[C_PASSWORD];
    return value;
}
@end
