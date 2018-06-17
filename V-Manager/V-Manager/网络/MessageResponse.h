//
//  MessageResponse.h
//
//  Created by 代码生成器1.0
//

#import <Foundation/Foundation.h>
#import "Message.h"

#define C_CODE        @"code"
#define C_MESSAGE     @"message"

@interface MessageResponse : Message

@property (nonatomic, copy, readonly) NSString *responseString;


+ (id)responseWithReponseData:(NSData*)responseData;
- (id)initWithReponseData:(NSData*)responseData;

-(void)setCode:(int)value;
-(int)code;
-(void)setMessage:(NSString*)value;
-(NSString*)message;

@end
