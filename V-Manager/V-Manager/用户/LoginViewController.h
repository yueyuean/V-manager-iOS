//
//  LoginViewController.h
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/12.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "BaseViewController.h"

@interface LoginViewController : BaseViewController
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UITextField *mobileTextField;
@property (strong, nonatomic) IBOutlet UITextField *passWordTextField;
- (IBAction)loginButtonPressed:(UIButton *)sender;

@end
