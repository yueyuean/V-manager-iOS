//
//  TMEditProcessCell.m
//  V-Manager
//
//  Created by 塔米 on 2018/6/15.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMEditProcessCell.h"

@implementation TMEditProcessCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        CGSize itemSize = CGSizeMake(25, 25);//希望显示的大小
        UIGraphicsBeginImageContextWithOptions(itemSize, NO, UIScreen.mainScreen.scale);
        CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
        [self.imageView.image drawInRect:imageRect];
        self.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    return self;
}

@end
