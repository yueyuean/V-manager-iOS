//
//  CommonUtility.m
//  releaselife
//
//  Created by ZhaoMirror on 16/9/29.
//  Copyright © 2016年 mirrorzhao. All rights reserved.
//

#import "RLCommonUtility.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>

#include <CommonCrypto/CommonCryptor.h>
#define kImageLimitedSize 250000
@implementation RLCommonUtility


+ (NSString *)signString:(NSString*)origString
{
    const char *original_str = [origString UTF8String];
    unsigned char result[32];
    CC_MD5(original_str, strlen(original_str), result);//调用md5
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++){
        [hash appendFormat:@"%02X", result[i]];
    }
    
    return hash;
}

+ (NSString *) md5str:(NSString *) input {
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}
+ (NSString *)md5:(NSString *)str {
    
    
    
    const char *cStr = [str UTF8String];
    
    
    
    unsigned char result[32];
    
    
    
    CC_MD5( cStr, strlen(cStr), result );
    
    
    
    return [NSString stringWithFormat:
            
            
            
            @"xxxxxxxxxxxxxxxx",
            
            
            
            result[0],result[1],result[2],result[3],
            
            result[4],result[5],result[6],result[7],
            
            result[8],result[9],result[10],result[11],
            
            result[12],result[13],result[14],result[15],
            
            result[16], result[17],result[18], result[19],
            
            result[20], result[21],result[22], result[23],
            
            result[24], result[25],result[26], result[27],
            
            result[28], result[29],result[30], result[31]];
    
}

//缩放图片
+(UIImage *) reSizeImage:(UIImage *)originalImage :(int)filemaxsize :(int) type
{
    NSData * imageData = UIImageJPEGRepresentation(originalImage,1);
    CGFloat imagesize= [imageData length];
    CGFloat originalimage_width=originalImage.size.width;
    CGFloat originalimage_height=originalImage.size.height;
    CGSize  newimagesize;
    CGFloat scaleratio;
    if (imagesize>filemaxsize*1000)
    {
        scaleratio=filemaxsize*1000/imagesize;
        float w=originalimage_width*scaleratio;
        //宽度最低400
        if (w<400 &&type==1)
        {
              newimagesize=CGSizeMake(400, originalimage_height*400/originalimage_width);
        }
        else
        {
              newimagesize=CGSizeMake(originalimage_width*scaleratio, originalimage_height*scaleratio);
        }
  
        return [originalImage n6_resizedImageWithContentMode:UIViewContentModeScaleAspectFill  bounds:newimagesize interpolationQuality:kCGInterpolationNone];
        
    }
    
    return  originalImage;
}

//- (NSString *)timeInfo {
//    return [NSDate timeInfoWithDate:self];
//}
//
//+ (NSString *)timeInfoWithDate:(NSDate *)date {
//    return [self timeInfoWithDateString:[self stringWithDate:date format:[self ymdHmsFormat]]];
//}

+ (NSString *) compareCurrentTime:(NSString *)str
{
    
    //把字符串转为NSdate
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    NSDate *timeDate = [dateFormatter dateFromString:str];
    
    //得到与当前时间差
    NSTimeInterval  timeInterval = [timeDate timeIntervalSinceNow];
    timeInterval = -timeInterval;
    //标准时间和北京时间差8个小时
  //  timeInterval = timeInterval - 8*60*60;
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    }
    
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    }
    
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    
    return  result;
}
+(void)initButton:(UIButton*)btn{
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(btn.imageView.frame.size.height ,-btn.imageView.frame.size.width, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0,0.0, -btn.titleLabel.bounds.size.width)];//图片距离右边框距离减少图片的宽度，其它不边
}
+ (NSString *) ConverTime:(NSString *)str
{
    
    //把字符串转为NSdate
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    [dateFormatter1 setDateFormat:@"MM月dd日"];
    NSDate *timeDate = [dateFormatter dateFromString:str];
    
     NSString * datestring2 = [dateFormatter1 stringFromDate:timeDate];
    
    return  datestring2;
}

+ (NSString *) ConverTimeWithYear:(NSString *)str
{
    
    //把字符串转为NSdate
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    [dateFormatter1 setDateFormat:@"YYYY年MM月dd日"];
    NSDate *timeDate = [dateFormatter dateFromString:str];
    
    NSString * datestring2 = [dateFormatter1 stringFromDate:timeDate];
    
    return  datestring2;
}
+(long long) fileSizeAtPath:(NSString*)filePath{
    NSFileManager* manager =[NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil]fileSize];
    }
    return 0;
}

//+(NSString*) decryptUseDES:(NSString*)cipherText key:(NSString*)key {
//    // 利用 GTMBase64 解碼 Base64 字串
//    NSData* cipherData = [GTMBase64 decodeString:cipherText];
//    unsigned char buffer[1024];
//    memset(buffer, 0, sizeof(char));
//    size_t numBytesDecrypted = 0;
//
//    // IV 偏移量不需使用
//    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
//                                          kCCAlgorithmDES,
//                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
//                                          [key UTF8String],
//                                          kCCKeySizeDES,
//                                          nil,
//                                          [cipherData bytes],
//                                          [cipherData length],
//                                          buffer,
//                                          1024,
//                                          &numBytesDecrypted);
//    NSString* plainText = nil;
//    if (cryptStatus == kCCSuccess) {
//        NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
//        plainText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] ;
//    }
//    return plainText;
//}
//+(NSString *) encryptUseDES:(NSString *)clearText key:(NSString *)key
//{
//    NSData *data = [clearText dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
//    unsigned char buffer[1024];
//    memset(buffer, 0, sizeof(char));
//    size_t numBytesEncrypted = 0;
//
//    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
//                                          kCCAlgorithmDES,
//                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
//                                          [key UTF8String],
//                                          kCCKeySizeDES,
//                                          nil,
//                                          [data bytes],
//                                          [data length],
//                                          buffer,
//                                          1024,
//                                          &numBytesEncrypted);
//
//    NSString* plainText = nil;
//    if (cryptStatus == kCCSuccess) {
//        NSData *dataTemp = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
//        plainText = [GTMBase64 stringByEncodingData:dataTemp];
//    }else{
//        NSLog(@"DES加密失败");
//    }
//    return plainText;
//}
//保存图片
+(void)saveImageDocuments:(UIImage *)image :(NSString*)filename{
    //拿到图片

    NSString *path_sandox = NSHomeDirectory();
    //设置一个图片的存储路径
    NSString *imagePath = [path_sandox stringByAppendingString:[NSString stringWithFormat:@"/Documents/%@",filename]];
    //把图片直接保存到指定的路径（同时应该把图片的路径imagePath存起来，下次就可以直接用来取）
    [UIImagePNGRepresentation(image) writeToFile:imagePath atomically:YES];
}
// 读取并存贮到相册
+(UIImage *)getDocumentImage:(NSString*)filename{
    // 读取沙盒路径图片
    NSString *aPath3=[NSString stringWithFormat:@"%@/Documents/%@",NSHomeDirectory(),filename];
    // 拿到沙盒路径图片
    UIImage *imgFromUrl3=[[UIImage alloc]initWithContentsOfFile:aPath3];
    // 图片保存相册
    UIImageWriteToSavedPhotosAlbum(imgFromUrl3, self, nil, nil);
    return imgFromUrl3;
}



+(BOOL)isIncludeSpecialCharact: (NSString *)str {
    //***需要过滤的特殊字符：~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€。
    NSRange urgentRange = [str rangeOfCharacterFromSet: [NSCharacterSet characterSetWithCharactersInString: @"~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€"]];
    if (urgentRange.location == NSNotFound)
    {
        return NO;
    }
    return YES;
}

+(NSString *)getMMSSFromSS:(NSString *)totalTime{
        
        NSInteger seconds = [totalTime integerValue]/1000;
    NSString *str_hour;
    NSString *format_time;
    
    if (seconds>=3600)
    {
        //format of hour
     str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    }
        //format of minute
        NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
        //format of second
        NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
        //format of time
    if (seconds>=3600)
    {
        //format of hour
        format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    }
    else
    {
       format_time = [NSString stringWithFormat:@"%@:%@",str_minute,str_second];


    }
   
        
        return format_time;
        
    }

+ (NSString*)formatByteCount:(long long)size
{
    return [NSByteCountFormatter stringFromByteCount:size countStyle:NSByteCountFormatterCountStyleFile];
}

@end
