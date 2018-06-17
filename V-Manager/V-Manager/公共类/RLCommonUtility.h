//
//  RLCommonUtility.h
//  releaselife
//
//  Created by ZhaoMirror on 16/9/29.
//  Copyright © 2016年 mirrorzhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RLCommonUtility : NSObject
+ (NSString *)signString:(NSString*)origString;
+(UIImage *) reSizeImage:(UIImage *)originalImage :(int)filemaxsize :(int) type;
+ (NSString *) compareCurrentTime:(NSString *)str;
+ (NSString *) ConverTime:(NSString *)str;

+(BOOL)isIncludeSpecialCharact: (NSString *)str;
+ (NSString *)md5:(NSString *)str;
+ (NSString *) md5str:(NSString *) input;
+ (NSString *) ConverTimeWithYear:(NSString *)str;
+(void)initButton:(UIButton*)btn;
+(long long) fileSizeAtPath:(NSString*)filePath;
+(NSString*) decryptUseDES:(NSString*)cipherText key:(NSString*)key;
+(NSString *) encryptUseDES:(NSString *)clearText key:(NSString *)key;
//保存图片
+(void)saveImageDocuments:(UIImage *)image :(NSString*)filename;// 读取并存贮到相册
+(UIImage *)getDocumentImage:(NSString*)filename;
//音乐文件是否存在
+(BOOL)isMusicFileExist: (NSString *)filename ;
+ (NSString*)formatByteCount:(long long)size;
+(NSString *)getMMSSFromSS:(NSString *)totalTime;
@end
