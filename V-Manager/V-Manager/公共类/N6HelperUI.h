//
//  N6HelperUI.h
//  mobip2p
//
//  Created by Guo Yu on 14-10-22.
//  Copyright (c) 2014年 zkbc. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifdef __cplusplus
extern "C" {
#endif

UIColor *UIColorFromRGBValue(UInt32 rgbValue);
UIColor *UIColorFromRGBDecValue(unsigned int r, unsigned int g, unsigned int b);
UIColor *UIColorFromRGBString(NSString * color);
    
NSString * N6GenerateUUID(void);
NSString  *removePre1(NSString * str);
    NSString * n6convertDistance(CGFloat meters);
    

#ifdef __cplusplus
}
#endif

#import "UIImage+N6Helper.h"
#import "N6CheckboxButton.h"
#import "N6ActionSheetController.h"
