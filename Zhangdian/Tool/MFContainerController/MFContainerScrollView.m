//
//  MFContainerScrollView.m
//  MotorFans
//
//  Created by LiuFengting on 2017/4/24.
//  Copyright © 2017年 MotorFans, JDD. All rights reserved.
//

#import "MFContainerScrollView.h"

@interface MFContainerScrollView ()

@end

@implementation MFContainerScrollView

- (instancetype)initWithFrame:(CGRect)frame
                     delegate:(id<UIScrollViewDelegate>)delegate
              viewControllers:(NSArray<UIViewController *> *)viewControllers
                       config:(MFContainerConfig *)config
{
    self = [super initWithFrame:frame];
    if (self) {
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.alwaysBounceHorizontal = config.contentEnableScrolling;
        self.alwaysBounceVertical = NO;
        self.pagingEnabled = YES;
        self.scrollsToTop = NO;
        self.delegate = delegate;
        self.scrollEnabled = config.contentEnableScrolling;
        self.contentSize = CGSizeMake(self.bounds.size.width*viewControllers.count, self.bounds.size.height);
    }
    return self;
}

@end
