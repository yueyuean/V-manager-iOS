//
//  YZCRandomViewController.m
//  YZCSegmentController
//
//  Created by dyso on 16/8/1.
//  Copyright © 2016年 yangzhicheng. All rights reserved.
//

#import "YZCRandomViewController.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define titleWidth 100
#define titleHeight 40
#define backColor [UIColor colorWithWhite:0.300 alpha:1.000]

@interface YZCRandomViewController ()<UIScrollViewDelegate> {
    UIButton *selectButton;
    UIView *_sliderView;
    UIViewController *_viewController;
    UIScrollView *_scrollView;
    UIScrollView *_scroll;
}

@property (nonatomic, strong) NSMutableArray *buttonArray;

@end

@implementation YZCRandomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _buttonArray = [NSMutableArray array];
}

- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
    [self initWithTitleButton];
}

- (void)setControllerArray:(NSArray *)controllerArray {
    _controllerArray = controllerArray;
    [self initWithController];
}

- (void)initWithTitleButton
{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH*2, 64)];
    titleView.backgroundColor = [UIColor colorWithWhite:0.800 alpha:1.000];
    [self.view addSubview:titleView];

    
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, 375, 40)];
    scroll.contentSize = CGSizeMake(titleWidth*_titleArray.count, 40);
    scroll.bounces = NO;
    scroll.scrollEnabled = YES;
    scroll.showsHorizontalScrollIndicator = YES;
    [scroll flashScrollIndicators];
    scroll.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scroll];
    _scroll = scroll;
    
    for (int i = 0; i < _titleArray.count; i++) {
        
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        titleButton.frame = CGRectMake(titleWidth*i, 0, titleWidth, titleHeight);
        [titleButton setTitle:_titleArray[i] forState:UIControlStateNormal];
        [titleButton setTitleColor:backColor forState:UIControlStateNormal];
        titleButton.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0];
        titleButton.tag = 100+i;
        [titleButton addTarget:self action:@selector(scrollViewSelectToIndex:) forControlEvents:UIControlEventTouchUpInside];
        [scroll addSubview:titleButton];
        if (i == 0) {
            selectButton = titleButton;
            [selectButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        }
        [_buttonArray addObject:titleButton];
        
    }
    
//    滑块
    UIView *sliderV=[[UIView alloc]initWithFrame:CGRectMake(0, titleHeight-1, titleWidth, 1)];
    sliderV.backgroundColor = [UIColor redColor];
    [scroll addSubview:sliderV];
    _sliderView=sliderV;
    
}

- (void)scrollViewSelectToIndex:(UIButton *)button
{
    
    [self selectButton:button.tag-100];
    
    [UIView animateWithDuration:0 animations:^{
        _scrollView.contentOffset = CGPointMake(SCREEN_WIDTH*(button.tag-100), 0);
    }];
}

//选择某个标题
- (void)selectButton:(NSInteger)index
{
    
    [selectButton setTitleColor:backColor forState:UIControlStateNormal];
    selectButton = _buttonArray[index];
    [selectButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    CGRect rect = [selectButton.superview convertRect:selectButton.frame toView:self.view];
    [UIView animateWithDuration:0 animations:^{
        _sliderView.frame = CGRectMake(titleWidth*index, titleHeight-1, titleWidth, 1);
        CGPoint contentOffset = _scroll.contentOffset;
        if (contentOffset.x - (SCREEN_WIDTH/2-rect.origin.x-titleWidth/2)<=0) {
            [_scroll setContentOffset:CGPointMake(0, contentOffset.y) animated:YES];
        } else if (contentOffset.x - (SCREEN_WIDTH/2-rect.origin.x-titleWidth/2)+SCREEN_WIDTH>=_titleArray.count*titleWidth) {
            [_scroll setContentOffset:CGPointMake(_titleArray.count*titleWidth-SCREEN_WIDTH, contentOffset.y) animated:YES];
        } else {
            [_scroll setContentOffset:CGPointMake(contentOffset.x - (SCREEN_WIDTH/2-rect.origin.x-titleWidth/2), contentOffset.y) animated:YES];
        }
    }];
}

//监听滚动事件判断当前拖动到哪一个了
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView == _scrollView) {
        NSInteger index = scrollView.contentOffset.x / SCREEN_WIDTH;
        [self selectButton:index];
    } else {
        
    }
    
}

- (void)initWithController
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    if (self.navigationController.navigationBar) {
        scrollView.frame = CGRectMake(0, titleHeight+64, SCREEN_WIDTH, SCREEN_HEIGHT-titleHeight-64);
    } else {
        scrollView.frame = CGRectMake(0, titleHeight, SCREEN_WIDTH, SCREEN_HEIGHT-titleHeight);
    }
    scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor colorWithWhite:0.900 alpha:1.000];
    scrollView.pagingEnabled = YES;
    scrollView.scrollEnabled = YES;
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*_controllerArray.count, SCREEN_HEIGHT-titleHeight-64);
    [self.view addSubview:scrollView];
    _scrollView = scrollView;
    
    for (int i = 0; i < _controllerArray.count; i++) {
        UIView *viewcon = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        UIViewController *viewcontroller = _controllerArray[i];
        viewcon = viewcontroller.view;
        viewcon.frame = CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        viewcon.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0];
        [scrollView addSubview:viewcon];
        
    }
    
}


@end
