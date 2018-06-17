//
//  Created by Guo Yu on 15/12/31.
//  Copyright © 2015年 zkbc. All rights reserved.
//

#import "RLTextField.h"

/** 提供一个缺省的Delegate，如果设置了新的Delegate，该对象的处理将会无效 */
@interface RLTextFieldDelegateImpl : NSObject <UITextFieldDelegate>
/** 弱引用，用来访问TextField的设置 */
@property (nonatomic, weak) RLTextField *textField;

@end

@implementation RLTextFieldDelegateImpl

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (self.textField.RL_type == RLTextFieldTypeMoney) {
        NSString *oldText = textField.text;
        textField.text = [oldText stringByReplacingOccurrencesOfString:@"," withString:@""];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (self.textField.RL_type == RLTextFieldTypeMoney) {
        NSString *oldText = textField.text;
//        if ([textField.text length] == 0) {
//            textField.text =  @"";
//        }else{
//            
            textField.text = [oldText n6_amountString];

//        }
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    BOOL result = YES;
    switch (self.textField.RL_type) {
        case RLTextFieldTypeMoney: {
//            NSString *current = textField.text;
//            NSString *replaced = [current stringByReplacingCharactersInRange:range withString:string];
//            result = [replaced n6_isMoneyFormat] && ![replaced n6_isEmpty];
            
            result = YES;
        }
            break;
        case RLTextFieldTypeBankCard: {
            // 四位加一个空格
            if ([string isEqualToString:@""]) { // 删除字符
                if ((textField.text.length - 2) % 5 == 0) {
                    textField.text = [textField.text substringToIndex:textField.text.length - 1];
                }
                result = YES;
            } else {
                if (textField.text.length % 5 == 0) {
                    textField.text = [NSString stringWithFormat:@"%@ ", textField.text];
                }
            }
            result = YES;
        }
            break;
        default:
            break;
    }
    
    if (self.textField.RL_maxLength != NSIntegerMax) {
        NSUInteger oldLength = [textField.text length];
        NSUInteger replacementLength = [string length];
        NSUInteger rangeLength = range.length;
        
        NSUInteger newLength = oldLength - rangeLength + replacementLength;
        
        BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
        
        result = newLength <= self.textField.RL_maxLength || returnKey;
    }
    
    return result;
}

@end

#pragma mark -----------------------------------------------------------------

@implementation RLTextField {
    RLTextFieldDelegateImpl *defaultDelegate_;
}

- (void)awakeFromNib {
    [self sharedInit];
}

- (void) sharedInit {
    // 不擦除用户设置的Delegate
    if (self.delegate == nil) {
        defaultDelegate_ = [RLTextFieldDelegateImpl new];
        defaultDelegate_.textField = self;
        self.delegate = defaultDelegate_;
    }
    
    //检查最大长度的设置是否合理
    if (self.RL_maxLength <= 0) {
        self.RL_maxLength = NSIntegerMax;
    }
    
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [self configKeyboardNocheck];
    switch (self.RL_type) {
        case RLTextFieldTypeMoney: {
            self.keyboardType = UIKeyboardTypeDecimalPad;
            self.inputAccessoryView = [self keyboardTopView];
        }
            break;
        case RLTextFieldTypeBankCard: {
            self.keyboardType = UIKeyboardTypeNumberPad;
            self.inputAccessoryView = [self keyboardTopView];
        }
            break;
        case RLTextFieldTypeMobileNo: {
            self.keyboardType = UIKeyboardTypeNumberPad;
            self.inputAccessoryView = [self keyboardTopView];
            self.RL_maxLength = 11;
        }
            break;
        case RLTextFieldTypePassword: {
            self.secureTextEntry = YES;
        }
            break;
        case RLTextFieldTypeSmsCode: {
            self.keyboardType = UIKeyboardTypeNumberPad;
            self.inputAccessoryView = [self keyboardTopView];
            self.RL_maxLength = 6;
        }
            break;
        case RLTextFieldTypeUserID: {
            self.keyboardType = UIKeyboardTypeNumberPad;
            self.inputAccessoryView = [self keyboardTopView];
            self.RL_maxLength = 12;
        }
            break;
        
        default:
            break;
    }
    
    // 设置returnKey样式
    if (self.RL_next) {
        self.returnKeyType = UIReturnKeyNext;
    } else {
        self.returnKeyType = UIReturnKeyDone;
    }
}

- (void)configKeyboardNocheck {
    self.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.autocorrectionType     = UITextAutocorrectionTypeNo;
    self.spellCheckingType      = UITextSpellCheckingTypeNo;
}

/**
 * 数字键盘顶部添加“完成”按钮
 */
- (UIView *) keyboardTopView {
    UIView *keyboardTopView = [UIView new];
    keyboardTopView.frame = CGRectMake(0, 0, 320, 40);
    keyboardTopView.backgroundColor = [UIColor whiteColor];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [keyboardTopView addSubview:button];
    
//    [button mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(keyboardTopView.mas_top).with.offset(0);
//        make.left.equalTo(keyboardTopView.mas_left).with.offset(0);
//        make.bottom.equalTo(keyboardTopView.mas_bottom).with.offset(0);
//        make.right.equalTo(keyboardTopView.mas_right).with.offset(0);
//    }];
    
    UIImageView *bottomImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MM-通用-单像素线-0"]];
    [keyboardTopView addSubview:bottomImageView];
//    [bottomImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(keyboardTopView.mas_bottom).with.offset(0);
//        make.left.equalTo(keyboardTopView.mas_left).with.offset(0);
//        make.right.equalTo(keyboardTopView.mas_right).with.offset(0);
//        make.height.equalTo(@1);
//    }];
    
    
    if (self.RL_next) {
        [button setTitle:@"下一步" forState:UIControlStateNormal];
    } else {
        [button setTitle:@"完成" forState:UIControlStateNormal];
    }
    [button setTitleColor:UIColorFromRGBValue(0xF96B24) forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    
    [button addTarget:self action:@selector(onOkButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    return keyboardTopView;
}

#pragma mark - IBAction
- (void)onOkButtonPressed:(id)sender {
    [self resignFirstResponder];
    if (self.RL_next) {
        [self.RL_next becomeFirstResponder];
    }
}

#pragma mark - Override
- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + self.RL_inset.x, bounds.origin.y,
                      bounds.size.width - self.RL_inset.y, bounds.size.height);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + self.RL_inset.x, bounds.origin.y,
                      bounds.size.width - self.RL_inset.y, bounds.size.height);
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + self.RL_inset.x, bounds.origin.y,
                      bounds.size.width - self.RL_inset.y, bounds.size.height);
}

@end
