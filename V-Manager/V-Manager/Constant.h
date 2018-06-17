//
//  Constant.h
//  YunDaoApp
//
//  Created by Sumency on 2017/8/24.
//  Copyright © 2017年 com.yundao. All rights reserved.
//

#ifndef Constant_h
#define Constant_h

#define HeaderViewH  170
#define Magrin  15
//屏幕宽度
#define kScreenW [UIScreen mainScreen].bounds.size.width

//屏幕高度
#define kScreenH [UIScreen mainScreen].bounds.size.height

//三原色的设置
#define kRGBColor(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

#define SafeAreaTop (iPhoneX ? 88 : 64)
#define TabBarHeight (iPhoneX ? 83 : 49)
#define SafeAreaBottom (iPhoneX ? 34 : 0)

#define Adapt(width) ceil(width * SCREEN_WIDTH / 375)
#define Hdapt(height) ceil(height * SCREEN_HEIGHT / 667)
//Documents文件夹的路径
#define kDocPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject
//appdelegate的实例对象
#define kAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

//把self转化为 __weak __block的方式, 方便的在block中使用而不导致内存循环应用问题

//在宏中使用 \ 可以换行
#define WK(weakSelf) \
__weak __typeof(&*self)weakSelf = self;\

//搜索界面特有
#define _weakSelf(...) \
rac_keywordify \
metamacro_foreach_cxt(rac_weakify_,, __weak, __VA_ARGS__)

#define _strongSelf(...) \
rac_keywordify \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
metamacro_foreach(rac_strongify_,, __VA_ARGS__) \
_Pragma("clang diagnostic pop")

//获取用户id
#define kuNickName                      @"vmNickname"
#define kuSignature                     @"vmSignature"
#define kuGender                        @"vmGender"
#define kuHeadImageData                 @"vmHeadImageData"

#define kuToken                         @"vmToken"
#define kuUserId                        @"vmUserId"
#define kuGiveContent                   @"vmGiveContent"
#define kuHeadImgUrl                    @"vmHeadImgUrl"

#define kuCountry                       @"vmCountry"
#define kuProvince                      @"vmProvince"
#define kuCity                          @"vmCity"
#define kuWxOpenId                      @"vmWxOpenId"
#define kuPhoneNo                       @"vmPhoneNo"
#define kuPrivilege                     @"vmPrivilege"
#define kuUnionId                       @"vmUnionId"

// 适配当前设备系统iOS7、iOS8、当前屏幕的宽高、当前app版本、当前窗口、当前设备
#define iOS11         ([[UIDevice currentDevice].systemVersion doubleValue] >= 11.f)
#define iOS10X        ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0f)
#define iOS9          ([[UIDevice currentDevice].systemVersion doubleValue] >= 9.0f)
#define iOS8X         ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0f)
#define iOS8          ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0f && [[UIDevice currentDevice].systemVersion doubleValue] < 9.0f)
#define iOS7          ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0f && [[UIDevice currentDevice].systemVersion doubleValue] < 8.0f)


#pragma mark - GCD
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define iPhone4  (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0f )
#define iPhone5  (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0f)
#define iPhone6  (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0f)
#define iPhone6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0f)
#define iPhoneX  ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define SafeAreaTop (iPhoneX ? 88 : 64)
#define TabBarHeight (iPhoneX ? 83 : 49)
#define SafeAreaBottom (iPhoneX ? 34 : 0)

#define Adapt(width) ceil(width * SCREEN_WIDTH / 375)
#define Hdapt(height) ceil(height * SCREEN_HEIGHT / 667)

// 第一个参数是当下的控制器适配iOS11 一下的，第二个参数表示scrollview或子类http://www.jianshu.com/p/3a9ad4f0fa32
#define AdjustScrollViewInsetNever(controller, view) if(@available(iOS 11.0, *)) { view.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever; } else if([controller isKindOfClass:[UIViewController class]]) { controller.automaticallyAdjustsScrollViewInsets = false; }

// http://www.jianshu.com/p/0994771a2f2d
#define AdjustsScrollViewInsets(scrollView, controller) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
if ([UIScrollView instancesRespondToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
[scrollView performSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:") withObject:@(2)];\
} else {\
controller.automaticallyAdjustsScrollViewInsets = NO;\
}\
_Pragma("clang diagnostic pop") \
} while (0)

// 判断是真机还是模拟器
#if TARGET_OS_IPHONE
#endif
#if TARGET_IPHONE_SIMULATOR
#endif

// 沙盒目录文件 Temp/Document/Cache
#define kPathTemp NSTemporaryDirectory()
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

// 最顶层的window
#define Window  [Config lastWindow]

// 导航控制器View(在Window上方的导航栏视图)
#define NavigationView self.navigationController.view

// 定义一个weakSelf（block中使用）
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self

#define StrongSelf typeof(weakSelf) __strong strongSelf = weakSelf

/** block安全调用 */
#define BLOCK_SAFE(block, ...) block ? block(__VA_ARGS__) : nil

// 判断字符串是否为空，并返回字符串
#define ObjectOrEmptyStr(obj) ((obj) ? (obj) : @"")

// 判断两个字符串是否相等
#define IsEqualToString(a, b) [a isEqualToString:b]

// 判断两个对象是否相等
#define IsEqual(a, b) [a isEqual:b]

// 判断字符串是否为空
#define IsEmptyString(x) (IsNull(x) || [x isEqualToString:@""] || [x isEqualToString:@"(null)"])

// 判断对象是否为空
#define IsNull(object) (object == nil \
|| [object isKindOfClass:[NSNull class]] \
|| ([object respondsToSelector:@selector(length)] && [(NSData *)object length] == 0) \
|| ([object respondsToSelector:@selector(count)] && [(NSArray *)object count] == 0))

// key判断
#define IsValidKey(key) ((key) != nil && ![key isKindOfClass:[NSNull class]])

// value判断
#define IsValidValue(value) (((value) != nil) && ![value isKindOfClass:[NSNull class]])

// 正常字体
#define Font(x) [UIFont systemFontOfSize:x]
#define Font25  [UIFont systemFontOfSize:25.f]
#define Font24  [UIFont systemFontOfSize:24.f]
#define Font23  [UIFont systemFontOfSize:23.f]
#define Font22  [UIFont systemFontOfSize:22.f]
#define Font20  [UIFont systemFontOfSize:20.f]
#define Font19  [UIFont systemFontOfSize:19.f]
#define Font18  [UIFont systemFontOfSize:18.f]
#define Font17  [UIFont systemFontOfSize:17.f]
#define Font16  [UIFont systemFontOfSize:16.f]
#define Font15  [UIFont systemFontOfSize:15.f]
#define Font14  [UIFont systemFontOfSize:14.f]
#define Font13  [UIFont systemFontOfSize:13.f]
#define Font12  [UIFont systemFontOfSize:12.f]
#define Font11  [UIFont systemFontOfSize:11.f]
#define Font10  [UIFont systemFontOfSize:10.f]
#define Font9   [UIFont systemFontOfSize:9.f]
#define Font8   [UIFont systemFontOfSize:8.f]
#define Font7   [UIFont systemFontOfSize:7.f]

// 粗体
#define BFont(x) [UIFont boldSystemFontOfSize:x]
#define BFont20  [UIFont boldSystemFontOfSize:20.f]
#define BFont19  [UIFont boldSystemFontOfSize:18.f]
#define BFont18  [UIFont boldSystemFontOfSize:18.f]
#define BFont17  [UIFont boldSystemFontOfSize:17.f]
#define BFont16  [UIFont boldSystemFontOfSize:16.f]
#define BFont15  [UIFont boldSystemFontOfSize:15.f]
#define BFont14  [UIFont boldSystemFontOfSize:14.f]
#define BFont13  [UIFont boldSystemFontOfSize:13.f]
#define BFont12  [UIFont boldSystemFontOfSize:12.f]
#define BFont11  [UIFont boldSystemFontOfSize:11.f]
#define BFont10  [UIFont boldSystemFontOfSize:10.f]

// 设置RGB颜色、随机色
#define Color(r, g, b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f]
#define RandomColor    Color(arc4random_uniform(256.0f), arc4random_uniform(256.0f), arc4random_uniform(256.0f))

// 加载mainBundle中的资源，加载完毕之后释放内存资源，适合加载高分辨率的图片或者一次性使用的资源（无法获取到Assets.xcassets中的图片）
#define PNGImage(NAME) [UIImage imageWithContentsOfFile:[NSBundle.mainBundle pathForResource:NAME ofType:@"png"]]
#define JPGImage(NAME) [UIImage imageWithContentsOfFile:[NSBundle.mainBundle pathForResource:NAME ofType:@"jpg"]]
#define kImg(NAME, EXT) [UIImage imageWithContentsOfFile:[NSBundle.mainBundle pathForResource:NAME ofType:EXT]]

// 加载自定义Bundle中的资源，加载完毕之后释放内存资源（无法获取到Assets.xcassets中的图片）
#define BundlePath [NSBundle.mainBundle pathForResource:@"Selene" ofType:@"bundle"]
#define FilePath(name, ext, directory) [[NSBundle bundleWithPath:BundlePath] pathForScaledResource:name ofType:ext inDirectory:directory]
#define BundleImage(name, ext, directory) [UIImage imageWithContentsOfFile:FilePath(name, ext, directory)]

#define BundlePNGImage(name, directory) [UIImage imageWithContentsOfFile:FilePath(name, @"png", directory)]
#define BundleJPGImage(name, directory) [UIImage imageWithContentsOfFile:FilePath(name, @"jpg", directory)]
#define BundleGIFImage(name, directory) [UIImage imageWithContentsOfFile:FilePath(name, @"gif", directory)]

// 字符串处理
#define URL(url) [NSURL URLWithString:url]
#define string(str1 ,str2) [NSString stringWithFormat:@"%@%@",str1, str2]
#define s_str(str1) [NSString stringWithFormat:@"%@",str1]
#define s_Num(num1) [NSString stringWithFormat:@"%d",num1]
#define s_Integer(num1) [NSString stringWithFormat:@"%ld",num1]


#endif /* Constant_h */
