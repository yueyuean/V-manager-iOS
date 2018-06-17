//
//  VMNetworkService.h
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/4.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Message.h"
#import "MessageRequest.h"
#import "MessageResponse.h"
#import "VMConfig.h"
#import "VMUserInfo.h"
#import "AFNetworkReachabilityManager.h"
#import "LoginRequest.h"
#import "LoginResponse.h"
//_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
typedef NS_ENUM(NSInteger, VMNetworkErrorCode) {
    VMNetworkErrorCodeUnavailable      = -10000,
    VMNetworkErrorCodeAccessTimeOut    = -10001,
    VMNetworkErrorCodeSuccess          = 200,
    VMNetworkErrorCodeFail             = -1,
    VMNetworkErrorCodeTimeOut          = -100,
    VMNetworkErrorCodeNoAuth           = -101,
    VMNetworkErrorCodeConcurrent       = -102,
    VMNetworkErrorCodeAuthFail         = 401,
    VMNetworkErrorCodeVerify           = -104,
    VMNetworkErrorCodeVfCodeWrong      = -1002,
    VMNetworkErrorCodeVfCodeBlank      = -1003,
    VMNetworkErrorCodeBusinessError    = -106,
};

FOUNDATION_EXTERN NSString* kVMErrorDomain;
FOUNDATION_EXTERN NSString* kVMErrorDescriptionKey;
FOUNDATION_EXTERN NSString* kVMMessageURI;
FOUNDATION_EXTERN NSString* kVMOperationIdentifier;
FOUNDATION_EXTERN NSString* kVMContractURI;
FOUNDATION_EXTERN NSString* kVMMMHomePage ;
FOUNDATION_EXTERN NSString* kVMPengHomePage;
FOUNDATION_EXTERN NSString* KVMGomeLoginPage;
FOUNDATION_EXTERN NSString* endPoint;
FOUNDATION_EXTERN NSString* multipartUploadKey;



@interface VMNetworkService : NSObject

@property (nonatomic, assign) AFNetworkReachabilityStatus networkStatus;
@property (nonatomic, strong) VMConfig *config;
@property (nonatomic, strong) VMUserInfo *userInfo;

@property (nonatomic, assign) BOOL hideIndicator;

/** 指示是否忽略网络处理 */
@property (nonatomic, assign) BOOL lock;

+ (VMNetworkService *)sharedService;

- (void)postMessageRequest:(MessageRequest*)messageRequest
            taskIdentifier:(NSString*)taskIdentifier
                 inSession:(BOOL)inSession
           disbleOperation:(BOOL)disableOperation
               layerString:(NSString*)layerString
                completion:(void (^)(MessageResponse * messageResponse, NSError *err))completion;


//- (void)cancelSpecifiedOperaions:(NSArray*)identifiers;
//- (void)cancelAllOperations;
- (void)startMonitoringNetworkStatus;
- (void)stopMonitoringNetworkStatus;
//- (BOOL)isSpecifiedTasksBusy:(NSArray*)taskIdenfiers;
//- (BOOL)isSpecifiedTaskBusy :(NSString*)taskIdenfier;
//-(void)startUploadImage:(UIImage *)image
//                  Type :(NSString*) Type
//                Userid :(NSString *) Userid
//             completion:(void (^)(NSString *imageName, NSError *err)) completion;

@end
