//
//  CALayer+XibConfiguration.m
//  cfp-ios
//
//  Created by eagle on 16/7/8.
//  Copyright © 2016年 zkbc. All rights reserved.
//

#import "CALayer+XibConfiguration.h"

@implementation CALayer (XibConfiguration)
-(void)setBorderUIColor:(UIColor*)color
{
    self.borderColor = color.CGColor;
}

-(UIColor*)borderUIColor
{
    return [UIColor colorWithCGColor:self.borderColor];
}
@end
