//
//  Created by Guo Yu on 14/11/10.
//  Copyright (c) 2014年 zkbc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(N6Helper)

- (UIImage *)n6_resizedImageWithContentMode:(UIViewContentMode)contentMode
                                     bounds:(CGSize)bounds
                       interpolationQuality:(CGInterpolationQuality)quality;

+ (UIImage*) n6_imageWithColor: (UIColor*) color;

@end
