//
//  Created by Guo Yu on 15/12/26.
//  Copyright © 2015年 zkbc. All rights reserved.
//

#import "N6CheckboxButton.h"

@implementation N6CheckboxButton

@dynamic uncheckedImage, checkedImage;

- (void)awakeFromNib {
    [self sharedInitialize];
}

- (void)sharedInitialize {
    [self addTarget:self action:@selector(onSelfPressed:) forControlEvents:UIControlEventTouchUpInside];
}

//- (IBAction)onSelfPressed:(CFPCheckboxButton*)checkboxButton {
//    self.selected = !self.selected;
//    [self sendActionsForControlEvents:UIControlEventValueChanged];
//}

- (void)setUncheckedImage:(UIImage *)uncheckedImage {
    [self setImage:uncheckedImage forState:UIControlStateNormal];
    [self setImage:uncheckedImage forState:UIControlStateHighlighted];
}

- (void)setCheckedImage:(UIImage *)checkedImage {
    [self setImage:checkedImage forState:UIControlStateSelected];
}

@end
