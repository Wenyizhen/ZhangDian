//
//  MFContainerController.h
//  MotorFans
//
//  Created by LiuFengting on 2017/4/24.
//  Copyright © 2017年 MotorFans, JDD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFContainerSegement.h"
#import "MFContainerScrollView.h"

@protocol MFContainerControllerDelegate <NSObject>

- (void)mfContainerControllerDidScrollToPage:(NSInteger)page;

@end


@interface MFContainerController : UIViewController

@property (nonatomic, strong) MFContainerSegement *segementView;
@property
(nonatomic, strong) MFContainerScrollView *scrollView;
@property (nonatomic, strong) id<MFContainerControllerDelegate> delegate;
@property (nonatomic, assign) NSInteger selectedIndex;

- (instancetype)initWithSuperViewController:(UIViewController *)superViewController
                            viewControllers:(NSArray<UIViewController *> *)viewControllers
                                     config:(MFContainerConfig *)config
                                   delegate:(id<MFContainerControllerDelegate>)delegate;

- (instancetype)initWithSuperViewController:(UIViewController *)superViewController
                            viewControllers:(NSArray<UIViewController *> *)viewControllers
                 initialViewControllerIndex:(NSInteger)initialViewControllerIndex
                                     config:(MFContainerConfig *)config
                                   delegate:(id<MFContainerControllerDelegate>)delegate;

@end
