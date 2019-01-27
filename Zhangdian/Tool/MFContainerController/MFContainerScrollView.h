//
//  MFContainerScrollView.h
//  MotorFans
//
//  Created by LiuFengting on 2017/4/24.
//  Copyright © 2017年 MotorFans, JDD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFContainerConfig.h"

@interface MFContainerScrollView : UIScrollView

- (instancetype)initWithFrame:(CGRect)frame
                     delegate:(id<UIScrollViewDelegate>)delegate
              viewControllers:(NSArray<UIViewController *> *)viewControllers
                       config:(MFContainerConfig *)config;

@end
