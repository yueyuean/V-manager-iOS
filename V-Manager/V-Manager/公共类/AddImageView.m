//
//  AddImageView.m
//  releaselife
//
//  Created by Zhao panming on 16/8/21.
//  Copyright © 2016年 mirrorzhao. All rights reserved.
//
#define imageH 75 // 图片高度
#define imageW 75 // 图片宽度
#define kMaxColumn 3 // 每行显示数量
#define MaxImageCount 3 // 最多显示图片个数
#define deleImageWH 25 // 删除按钮的宽高
#define kAdeleImage @"删除图片按钮" // 删除按钮图片
#define kAddImage @"上传图片底图" // 添加按钮图片

#import "VPViewController.h"
#import "VPImageCropperViewController.h"
#import "UIImage+N6Helper.h"

#define kImageLimitedSize 150000
#import "AddImageView.h"
#import <UIKit/UIKit.h>
@interface AddImageView()<UINavigationControllerDelegate,  UIImagePickerControllerDelegate,UIActionSheetDelegate, VPImageCropperDelegate>
{
         // 标识被编辑的按钮 -1 为添加新的按钮
         NSInteger editTag;
     }
@end
@implementation AddImageView
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    if (self) {
        UIButton *btn = [self createButtonWithImage:kAddImage andSeletor:@selector(addNew:)];
        [self addSubview:btn];
    }

}

- (id)initWithFrame:(CGRect)frame
{
         self = [super initWithFrame:frame];
         if (self) {
                UIButton *btn = [self createButtonWithImage:kAddImage andSeletor:@selector(addNew:)];
             
                 [self addSubview:btn];
             }
         return self;
    }

 -(NSMutableArray *)images
{
         if (_images == nil) {
                 _images = [NSMutableArray array];
             }
         return _images;
    }

// 添加新的控件
- (void)addNew:(UIButton *)btn
{
        // 标识为添加一个新的图片
    
        if (![self deleClose:btn]) {
                 editTag = -1;
                [self callImagePicker];
             }
    
    
     }

 // 修改旧的控件
 - (void)changeOld:(UIButton *)btn
 {
         // 标识为修改(tag为修改标识)
         if (![self deleClose:btn]) {
                 editTag = btn.tag;
                 [self callImagePicker];
             }
     }

 // 删除"删除按钮"
- (BOOL)deleClose:(UIButton *)btn
 {
        if (btn.subviews.count == 2) {
                 [[btn.subviews lastObject] removeFromSuperview];
                 [self stop:btn];
                 return YES;
            }
    
         return NO;
     }

 // 调用图片选择器
 - (void)callImagePicker
{
    [self editPortrait];
    
     }

// 根据图片名称或者图片创建一个新的显示控件
 - (UIButton *)createButtonWithImage:(id)imageNameOrImage andSeletor : (SEL)selector
{
         UIImage *addImage = nil;
         if ([imageNameOrImage isKindOfClass:[NSString class]]) {
                addImage = [UIImage imageNamed:imageNameOrImage];
             }
         else if([imageNameOrImage isKindOfClass:[UIImage class]])
             {
                     addImage = imageNameOrImage;
                 }
         UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
         [addBtn setImage:addImage forState:UIControlStateNormal];
         [addBtn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
         addBtn.tag = self.subviews.count;
    
         // 添加长按手势,用作删除.加号按钮不添加
         if(addBtn.tag != 0)
             {
                 UILongPressGestureRecognizer *gester = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
                 [addBtn addGestureRecognizer:gester];
                 }
         return addBtn;
    
     }

 // 长按添加删除按钮
- (void)longPress : (UIGestureRecognizer *)gester
 {
         if (gester.state == UIGestureRecognizerStateBegan)
            {
                 UIButton *btn = (UIButton *)gester.view;
            
                UIButton *dele = [UIButton buttonWithType:UIButtonTypeCustom];
                 dele.bounds = CGRectMake(0, 0, deleImageWH, deleImageWH);
                 [dele setImage:[UIImage imageNamed:kAdeleImage] forState:UIControlStateNormal];
                 [dele addTarget:self action:@selector(deletePic:) forControlEvents:UIControlEventTouchUpInside];
                 dele.frame = CGRectMake(btn.frame.size.width - dele.frame.size.width, 0, dele.frame.size.width, dele.frame.size.height);
            
                 [btn addSubview:dele];
                 [self start : btn];
                 }
   
    }

// 长按开始抖动
 - (void)start : (UIButton *)btn {
         double angle1 = -5.0 / 180.0 * M_PI;
         double angle2 = 5.0 / 180.0 * M_PI;
         CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
         anim.keyPath = @"transform.rotation";
         anim.values = @[@(angle1),  @(angle2), @(angle1)];
         anim.duration = 0.25;
         // 动画的重复执行次数
         anim.repeatCount = MAXFLOAT;
             // 保持动画执行完毕后的状态
         anim.removedOnCompletion = NO;
         anim.fillMode = kCAFillModeForwards;
         [btn.layer addAnimation:anim forKey:@"shake"];
     }
 // 停止抖动
- (void)stop : (UIButton *)btn{
         [btn.layer removeAnimationForKey:@"shake"];
    }

 // 删除图片
 - (void)deletePic : (UIButton *)btn
{
         [self.images removeObject:[(UIButton *)btn.superview imageForState:UIControlStateNormal]];
         [btn.superview removeFromSuperview];
         if ([[self.subviews lastObject] isHidden]) {
                 [[self.subviews lastObject] setHidden:NO];
             }
  
     }

// 对所有子控件进行布局
- (void)layoutSubviews
 {
         [super layoutSubviews];
         int count = self.subviews.count;
     
         CGFloat btnW = imageW;
         CGFloat btnH = imageH;
     CGRect frm=self.frame;
         int maxColumn = kMaxColumn > SCREEN_WIDTH / imageW ? SCREEN_WIDTH  / imageW : kMaxColumn;
         CGFloat marginX = (SCREEN_WIDTH  - maxColumn * btnW) / (count + 1);
       //  CGFloat marginY = marginX;
     CGFloat marginY = 30;
         for (int i = 0; i < count; i++) {
                 UIButton *btn = self.subviews[i];
                 CGFloat btnX = (i % maxColumn) * (marginX + btnW) + marginX;
                 CGFloat btnY = (i / maxColumn) * (marginY + btnH) + marginY;
                 btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
                       }
     
    
    
     


     }

//#pragma mark - UIImagePickerController 代理方法
// -(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
//{
//        UIImage *image = info[UIImagePickerControllerEditedImage];
//         if (editTag == -1) {
//                 // 创建一个新的控件
//                 UIButton *btn = [self createButtonWithImage:image andSeletor:@selector(changeOld:)];
//                 [self insertSubview:btn atIndex:self.subviews.count - 1];
//                 [self.images addObject:image];
//                 if (self.subviews.count - 1 == MaxImageCount) {
//                         [[self.subviews lastObject] setHidden:YES];
//                     
//                     }
//             }
//         else
//            {
//                     // 根据tag修改需要编辑的控件
//                     UIButton *btn = (UIButton *)[self viewWithTag:editTag];
//                     int index = [self.images indexOfObject:[btn imageForState:UIControlStateNormal]];
//                     [self.images removeObjectAtIndex:index];
//                     [btn setImage:image forState:UIControlStateNormal];
//         [self.images insertObject:image atIndex:index];
//                 }
//         // 退出图片选择控制器
//    [picker dismissViewControllerAnimated:YES completion:nil];
//     }
- (void)editPortrait
{
    
    UIActionSheet *choiceSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照", @"相册", nil];
    [choiceSheet showInView:self];
    
}
#pragma mark VPImageCropperDelegate
//选取图片后返回
- (void)imageCropper:(VPImageCropperViewController *)cropperViewController didFinished:(UIImage *)editedImage {
    
    
    UIImage *image = editedImage;
    if (editTag == -1) {
        // 创建一个新的控件
        UIButton *btn = [self createButtonWithImage:image andSeletor:@selector(changeOld:)];
        [self insertSubview:btn atIndex:self.subviews.count - 1];
        [self.images addObject:image];
        if (self.subviews.count - 1 == MaxImageCount) {
            [[self.subviews lastObject] setHidden:YES];
            
        }
    }
    else
    {
        // 根据tag修改需要编辑的控件
        UIButton *btn = (UIButton *)[self viewWithTag:editTag];
        int index = [self.images indexOfObject:[btn imageForState:UIControlStateNormal]];
        [self.images removeObjectAtIndex:index];
        [btn setImage:image forState:UIControlStateNormal];
        [self.images insertObject:image atIndex:index];
    }
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
    }];
        //        // TO DO
 
}

- (void)imageCropperDidCancel:(VPImageCropperViewController *)cropperViewController {
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
    }];
}


#pragma mark UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        // 拍照
        if ([self isCameraAvailable] && [self doesCameraSupportTakingPhotos]) {
            UIImagePickerController *controller = [[UIImagePickerController alloc] init];
            controller.sourceType = UIImagePickerControllerSourceTypeCamera;
            if ([self isFrontCameraAvailable]) {
                controller.cameraDevice = UIImagePickerControllerCameraDeviceFront;
            }
            NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
            [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
            controller.mediaTypes = mediaTypes;
            controller.delegate = self;
            [self.window.rootViewController presentViewController:controller
                               animated:YES
                             completion:^(void){
                                 NSLog(@"Picker View Controller is presented");
                             }];
        }
        
    } else if (buttonIndex == 1) {
        // 从相册中选取
        if ([self isPhotoLibraryAvailable]) {
            UIImagePickerController *controller = [[UIImagePickerController alloc] init];
            controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
            [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
            controller.mediaTypes = mediaTypes;
            controller.delegate = self;
            [self.window.rootViewController presentViewController:controller
                               animated:YES
                             completion:^(void){
                                 NSLog(@"Picker View Controller is presented");
                             }];
        }
    }
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:^() {
        UIImage *portraitImg = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        
        // portraitImg = [self imageByScalingToMaxSize:portraitImg];
        // 裁剪
        
        
        NSData * imageData = UIImageJPEGRepresentation(portraitImg,1);
        CGFloat imagesize= [imageData length]/1000;
        
        VPImageCropperViewController *imgEditorVC = [[VPImageCropperViewController alloc] initWithImage:portraitImg cropFrame:CGRectMake(0, 100.0f, SCREEN_WIDTH, SCREEN_WIDTH*2.0/3.0) limitScaleRatio:3.0];
        imgEditorVC.delegate = self;
        [ self.window.rootViewController presentViewController:imgEditorVC animated:YES completion:^{
            // TO DO
        }];
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^(){
    }];
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
}

#pragma mark camera utility
- (BOOL) isCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) isRearCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

- (BOOL) isFrontCameraAvailable {
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

- (BOOL) doesCameraSupportTakingPhotos {
    return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) isPhotoLibraryAvailable{
    return [UIImagePickerController isSourceTypeAvailable:
            UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL) canUserPickVideosFromPhotoLibrary{
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL) canUserPickPhotosFromPhotoLibrary{
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    __block BOOL result = NO;
    if ([paramMediaType length] == 0) {
        return NO;
    }
    NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType]){
            result = YES;
            *stop= YES;
        }
    }];
    return result;
}

#pragma mark image scale utility
- (UIImage *)imageByScalingToMaxSize:(UIImage *)sourceImage {
    if (sourceImage.size.width < SCREEN_WIDTH) return sourceImage;
    CGFloat btWidth = 0.0f;
    CGFloat btHeight = 0.0f;
    if (sourceImage.size.width > sourceImage.size.height) {
        btHeight = SCREEN_WIDTH;
        btWidth = sourceImage.size.width * (SCREEN_WIDTH / sourceImage.size.height);
    } else {
        btWidth = SCREEN_WIDTH;
        btHeight = sourceImage.size.height * (SCREEN_WIDTH/ sourceImage.size.width);
    }
    CGSize targetSize = CGSizeMake(btWidth, btHeight);
    return [self imageByScalingAndCroppingForSourceImage:sourceImage targetSize:targetSize];
}

- (UIImage *)imageByScalingAndCroppingForSourceImage:(UIImage *)sourceImage targetSize:(CGSize)targetSize {
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else
            if (widthFactor < heightFactor)
            {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
            }
    }
    UIGraphicsBeginImageContext(targetSize); // this will crop
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil) NSLog(@"could not scale image");
    
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    return newImage;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
//缩放图片
-(UIImage *) reSizeImage:(UIImage *)originalImage
{
    NSData * imageData = UIImageJPEGRepresentation(originalImage,1);
    CGFloat imagesize= [imageData length];
    CGFloat originalimage_width=originalImage.size.width;
    CGFloat originalimage_height=originalImage.size.height;
    CGSize  newimagesize;
    CGFloat scaleratio;
    if (imagesize>kImageLimitedSize*1000)
    {
        scaleratio=kImageLimitedSize*1000/imagesize;
        newimagesize=CGSizeMake(originalimage_width*scaleratio, originalimage_height*scaleratio);
        return [originalImage n6_resizedImageWithContentMode:UIViewContentModeScaleAspectFill  bounds:newimagesize interpolationQuality:kCGInterpolationNone];
        
    }
    
    return  originalImage;
}



@end
