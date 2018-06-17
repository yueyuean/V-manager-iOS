//
//  RLCheckButton.m
//  releaselife
//
//  Created by ZhaoMirror on 16/9/5.
//  Copyright © 2016年 mirrorzhao. All rights reserved.
//

#import "RLCheckButton.h"

@implementation RLCheckButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (void)initialize {
    if (self == [RLCheckButton self]) {
        [[self appearance]setImage:[UIImage imageNamed:@"通用-checkbox"] forState:UIControlStateNormal];
       // [[self appearance]setImage:[UIImage imageNamed:@"通用-checkbox"] forState:UIControlStateHighlighted];
        [[self appearance]setImage:[UIImage imageNamed:@"通用-checkbox-checked"] forState:UIControlStateSelected];
    }
}


- (void)awakeFromNib {
    [self sharedInitialize];
}

- (void)sharedInitialize {
    [self addTarget:self action:@selector(onSelfPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)onSelfPressed:(RLCheckButton*)checkboxButton {
    self.selected = !self.selected;
}
@end
