//
//  MFContainerSegement.h
//  MotorFans
//
//  Created by LiuFengting on 2017/4/24.
//  Copyright © 2017年 MotorFans, JDD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MFContainerConfig.h"
#import "MFContainerSegementCell.h"

@protocol MFContainerSegementDelegate <NSObject>

- (void)mfContainerSegementDidSelectedIndex:(NSInteger)index;

@end

@interface MFContainerSegement : UIView

- (instancetype)initWithFrame:(CGRect)frame
              viewControllers:(NSArray<UIViewController *> *)viewControllers
                     delegate:(id<MFContainerSegementDelegate>)delegate
                       config:(MFContainerConfig *)config;

- (void)selectIndex:(NSInteger)index animated:(BOOL)animated;

- (void)updateScrollOffsetPercent:(CGFloat)offsetPercent;

- (void)showBadgeToIndex:(NSInteger)index visable:(BOOL)visable;

@end
