//
//  Created by Guo Yu on 15/12/31.
//  Copyright © 2015年 zkbc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RLTextFieldType) {
    RLTextFieldTypeDefault     = 0,
    RLTextFieldTypeMoney       = 1,
    RLTextFieldTypeBankCard    = 2,
    RLTextFieldTypeMobileNo    = 3,
    RLTextFieldTypePassword    = 4,
    RLTextFieldTypeSmsCode     = 5,
    RLTextFieldTypeUserID     = 6
};

IB_DESIGNABLE
/** 参数化可定制TextField */
@interface RLTextField : UITextField

@property (nonatomic, assign) IBInspectable NSInteger   RL_type;
@property (nonatomic, assign) IBInspectable NSInteger   RL_maxLength;
@property (nonatomic, assign) IBInspectable CGPoint     RL_inset;

/** 在IB中连接下一个 */
@property (nonatomic, weak  ) IBOutlet RLTextField     *RL_next;

@end
