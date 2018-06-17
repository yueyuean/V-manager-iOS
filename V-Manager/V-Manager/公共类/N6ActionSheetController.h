//
//  Created by Guo Yu on 15/12/22.
//  Copyright © 2015年 zkbc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface N6ActionSheetController : NSObject

+ (id) newInstance;

- (void)showViewController:(UIViewController*)viewController
          inViewController:(UIViewController*)inViewController
                    height:(CGFloat)height
                 maskLayer:(BOOL)isMaskLayer
                  animated:(BOOL)animated
                completion:(void (^)(void))completion;

- (void)dismissWithAnimated:(BOOL)animated completion:(void (^)(void))completion;

@end
