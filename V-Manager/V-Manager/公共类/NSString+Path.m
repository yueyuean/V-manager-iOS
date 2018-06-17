//
//  NSString+Path.m
//  releaselife
//
//  Created by ZhaoMirror on 16/11/11.
//  Copyright © 2016年 mirrorzhao. All rights reserved.
//

#import "NSString+Path.h"


@implementation NSString (Path)
- (NSString *)appendCaches {
    // 获取缓存目录
    NSString *cache = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    // 获取路径的最后一部份(文件名)
    NSString *filename = [self lastPathComponent];
    
    return [cache stringByAppendingPathComponent:filename];
}

- (NSString *)appendDocuments {
    // 获取缓存目录
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    // 获取路径的最后一部份(文件名)
    NSString *filename = [self lastPathComponent];
    
    return [document stringByAppendingPathComponent:filename];
}



- (NSString *)appendTmp {
    // 获取缓存目录
    NSString *temp = NSTemporaryDirectory();
    // 获取路径的最后一部份(文件名)
    NSString *filename = [self lastPathComponent];
    
    return [temp stringByAppendingPathComponent:filename];
}
@end
