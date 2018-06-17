//
//  Created by Guo Yu on 15/12/22.
//  Copyright © 2015年 zkbc. All rights reserved.
//

#import "N6ActionSheetController.h"

#define kMinContentHeight       50.0f
#define kAnimationDuration      0.35f

@interface N6ActionSheetInnerViewController : UIViewController

@property (nonatomic, strong) UIButton*         backgroundButton;
@property (nonatomic, strong) UIView*           containerView;
@property (nonatomic, strong) UIViewController* viewController;
@property (nonatomic, assign) CGFloat           height;

/***  是否有遮罩*/
@property (nonatomic, assign)  BOOL             isMaskLayer;

- (void)showWithAnimated:(BOOL)animated completion:(void (^)(void))completion;
- (void)hideWithAnimated:(BOOL)animated completion:(void (^)(void))completion;

@end

@implementation N6ActionSheetInnerViewController {
    BOOL isShowing_;
}

- (id)initWithViewController:(UIViewController*)viewController height:(CGFloat)height maskLayer:(BOOL) isMaskLayer {
    self = [super init];
    if (self) {
        self.viewController = viewController;
        if (height < kMinContentHeight) {
            height = kMinContentHeight;
        }
        self.height      = height;
        self.isMaskLayer = isMaskLayer;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect bounds = self.view.bounds;
    
    self.view.backgroundColor = [UIColor clearColor];
    
    self.backgroundButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backgroundButton.backgroundColor = [UIColor clearColor];
    self.backgroundButton.frame = bounds;
    [self.view addSubview:self.backgroundButton];
    
    self.containerView = [[UIView alloc]initWithFrame:CGRectMake(0, bounds.size.height,
                                                                 bounds.size.width, self.height)];
    self.containerView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.containerView];
    
    self.viewController.view.frame = self.containerView.bounds;
    [self addChildViewController:self.viewController];
    [self.containerView addSubview:self.viewController.view];
    [self.viewController didMoveToParentViewController:self];
}

- (void)showWithAnimated:(BOOL)animated completion:(void (^)(void))completion {
    CGRect bounds = self.view.bounds;
    self.backgroundButton.frame = bounds;
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.containerView.frame = CGRectMake(0, bounds.size.height - self.height, bounds.size.width, self.height);
        self.viewController.view.frame = self.containerView.bounds;
        if (self.isMaskLayer) {
            self.view.backgroundColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.7];
        }
    } completion:^(BOOL finished) {
        if (completion) {
            isShowing_ = YES;
            completion();
        }
    }];
}

- (void)hideWithAnimated:(BOOL)animated completion:(void (^)(void))completion {
    CGRect bounds = self.view.bounds;
    self.backgroundButton.frame = bounds;
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.containerView.frame = CGRectMake(0, bounds.size.height, bounds.size.width, self.height);
        self.view.backgroundColor = [UIColor clearColor];
    } completion:^(BOOL finished) {
        if (completion) {
            isShowing_ = NO;
            completion();
        }
    }];
}

@end

//////////////////////////////////////////////////////////////////////////////////////////
@interface N6ActionPopoverTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>

/** Indicate is dissmis or present */
@property (nonatomic, assign) BOOL presenting;

@end

@implementation N6ActionPopoverTransitionAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return kAnimationDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    CGRect bounds = containerView.bounds;
    
    if (self.presenting) {
        fromViewController.view.userInteractionEnabled = NO;
        toViewController.view.frame = bounds;
        [containerView addSubview:toViewController.view];
        
        N6ActionSheetInnerViewController *container = (N6ActionSheetInnerViewController*)toViewController;
        [container showWithAnimated:YES completion:^{
            [transitionContext completeTransition:YES];
        }];
    }
    else {
        toViewController.view.userInteractionEnabled = YES;
        [containerView addSubview:fromViewController.view];
        
        N6ActionSheetInnerViewController *container = (N6ActionSheetInnerViewController*)fromViewController;
        [container hideWithAnimated:YES completion:^{
            [transitionContext completeTransition:YES];
        }];
    }
}

@end

//////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - N6ActionSheetController
@interface N6ActionSheetController() <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) N6ActionSheetInnerViewController *containerViewController;

@end

@implementation N6ActionSheetController

+ (id) newInstance {
    id inst = [[self class] new];
    return inst;
}

- (void)showViewController:(UIViewController*)viewController
          inViewController:(UIViewController*)inViewController
                    height:(CGFloat)height
                 maskLayer:(BOOL)isMaskLayer
                  animated:(BOOL)animated
                completion:(void (^)(void))completion

{
    self.containerViewController = [[N6ActionSheetInnerViewController alloc]initWithViewController:viewController
                                                                                            height:height maskLayer:isMaskLayer];
    self.containerViewController.transitioningDelegate = self;
    self.containerViewController.modalPresentationStyle = UIModalPresentationCustom;
    [inViewController presentViewController:self.containerViewController
                                   animated:animated
                                 completion:^{
                                     [self.containerViewController.backgroundButton addTarget:self
                                                                                       action:@selector(onBackgroundButtonPressed:)
                                                                             forControlEvents:UIControlEventTouchUpInside];
                                     if (completion != nil) {
                                         completion();
                                     }
                                 }];
}

- (void)dismissWithAnimated:(BOOL)animated completion:(void (^)(void))completion {
    [self.containerViewController dismissViewControllerAnimated:animated
                                                     completion:completion];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    N6ActionPopoverTransitionAnimator *animator = [N6ActionPopoverTransitionAnimator new];
    animator.presenting = YES;
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    N6ActionPopoverTransitionAnimator *animator = [N6ActionPopoverTransitionAnimator new];
    animator.presenting = NO;
    return animator;
}

- (IBAction)onBackgroundButtonPressed:(id)sender {
    [self dismissWithAnimated:YES completion:nil];
}

@end

