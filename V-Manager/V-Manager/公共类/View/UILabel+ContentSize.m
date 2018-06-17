#import "UILabel+ContentSize.h"
 
@implementation UILabel (ContentSize)

- (CGSize)contentSize {
   NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = self.textAlignment;
    
    NSDictionary * attributes = @{NSFontAttributeName : self.font,
                                  NSParagraphStyleAttributeName : paragraphStyle};
    
    CGSize contentSize = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT)
                                              options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                           attributes:attributes
                                              context:nil].size;
    return contentSize;
}


//NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
//paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
//NSDictionary *attributes = @{NSFontAttributeName:someFont, NSParagraphStyleAttributeName:paragraphStyle.copy};
//
//labelSize = [someText boundingRectWithSize:CGSizeMake(207, 999) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
///*
// This method returns fractional sizes (in the size component of the returned CGRect); to use a returned size to size views, you must use raise its value to the nearest higher integer using the ceil function.
// */
//labelSize.height = ceil(labelSize.height);
//labelSize.width = ceil(labelSize.width);
@end