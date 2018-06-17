//
//  NSString+Path.h
//  releaselife
//
//  Created by ZhaoMirror on 16/11/11.
//  Copyright © 2016年 mirrorzhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Path)
- (NSString *)appendCaches ;
- (NSString *)appendDocuments;
- (NSString *)appendTmp ;
- (NSString *)appendMusicDir;
@end
