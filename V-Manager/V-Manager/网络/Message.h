//
//  Message.h
//
//  Created by 代码生成器1.0
//

#import <Foundation/Foundation.h>

#define C_CODE      @"code"
#define C_MESSAGE      @"message"
#define C_DATA      @"data"

@interface Message : NSObject

@property(nonatomic, strong) NSMutableDictionary *context;
@property(nonatomic, strong) NSMutableDictionary *contextContent;

- (void) fromString:(NSString*)message;
- (NSString*) toString;
@end
