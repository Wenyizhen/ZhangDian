//
//  MFContainerController.m
//  MotorFans
//
//  Created by LiuFengting on 2017/4/24.
//  Copyright © 2017年 MotorFans, JDD. All rights reserved.
//

#import "MFContainerController.h"

@interface MFContainerController () <MFContainerSegementDelegate, UIScrollViewDelegate>

@property (nonatomic, strong)UIViewController *superViewController;
@property (nonatomic, strong)NSArray<UIViewController *> *viewControllers;
@property (nonatomic, strong)MFContainerConfig *config;

@end

@implementation MFContainerController

- (instancetype)initWithSuperViewController:(UIViewController *)superViewController
                            viewControllers:(NSArray<UIViewController *> *)viewControllers
                                     config:(MFContainerConfig *)config
                                   delegate:(id<MFContainerControllerDelegate>)delegate
{
    
    return [self initWithSuperViewController:superViewController
                             viewControllers:viewControllers
                  initialViewControllerIndex:0
                                      config:config
                                    delegate:delegate];
}

- (instancetype)initWithSuperViewController:(UIViewController *)superViewController
                            viewControllers:(NSArray<UIViewController *> *)viewControllers
                 initialViewControllerIndex:(NSInteger)initialViewControllerIndex
                                     config:(MFContainerConfig *)config
                                   delegate:(id<MFContainerControllerDelegate>)delegate
{
    self = [super init];
    if (self) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.view.translatesAutoresizingMaskIntoConstraints = NO;

        [self willMoveToParentViewController:superViewController];
        self.view.frame = CGRectMake(0, config.scrollViewFrame.origin.y, superViewController.view.bounds.size.width, superViewController.view.bounds.size.height - config.scrollViewFrame.origin.y);
        [superViewController addChildViewController:self];
        [self didMoveToParentViewController:superViewController];

        self.superViewController = superViewController;
        self.viewControllers = viewControllers;
        self.config = config;
        self.delegate = delegate;

        [self initializeConponents];

        [self scrollToViewControllerAtIndex:initialViewControllerIndex];
    }
    return self;
}

- (void)initializeConponents
{
    if (!self.viewControllers.count) {
        return;
    }

    self.segementView = [[MFContainerSegement alloc] initWithFrame:self.config.segementViewFrame
                                                   viewControllers:self.viewControllers
                                                          delegate:self
                                                            config:self.config];

    CGRect rect = self.config.scrollViewFrame;
    rect.origin.y = 0;
    self.scrollView = [[MFContainerScrollView alloc] initWithFrame:rect
                                                          delegate:self
                                                   viewControllers:self.viewControllers
                                                            config:self.config];
    [self.view addSubview:self.scrollView];
}

- (void)scrollToViewControllerAtIndex:(NSInteger)index
{
    if (index < 0 || index > self.viewControllers.count - 1) {
        return;
    }
    self.selectedIndex = index;
    UIViewController *viewController = self.viewControllers[index];
    CGRect vcRect = CGRectMake(self.view.frame.size.width*index, 0, self.view.frame.size.width, self.config.scrollViewFrame.size.height);
    if (!viewController.view.window) {
        [viewController willMoveToParentViewController:self];
        [viewController.view setFrame:vcRect];
        [self addChildViewController:viewController];
        [self.scrollView addSubview:viewController.view];
        [viewController didMoveToParentViewController:self];
    }
    [self.scrollView scrollRectToVisible:vcRect animated:YES];
    [self.segementView selectIndex:index animated:NO];

    if (_delegate && [_delegate respondsToSelector:@selector(mfContainerControllerDidScrollToPage:)]) {
        [_delegate mfContainerControllerDidScrollToPage:index];
    }
}

#pragma mark - MFContainerSegementDelegate

- (void)mfContainerSegementDidSelectedIndex:(NSInteger)index
{
    [self scrollToViewControllerAtIndex:index];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:self.scrollView]) {
        NSInteger page = scrollView.contentOffset.x/scrollView.bounds.size.width;
        [self scrollToViewControllerAtIndex:page];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:self.scrollView] && scrollView.isDragging) {
//        CGFloat percent = scrollView.contentOffset.x/scrollView.contentSize.width;
//        [self.segementView updateScrollOffsetPercent:percent];
    }
}

@end
