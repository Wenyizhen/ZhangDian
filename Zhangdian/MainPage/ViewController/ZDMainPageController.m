//
//  ZDMainPageController.m
//  Zhangdian
//
//  Created by W z on 2018/12/17.
//  Copyright © 2018 wenyizhen. All rights reserved.
//

#import "ZDMainPageController.h"
#import "SDCycleScrollView.h"
@interface ZDMainPageController ()

@end

@implementation ZDMainPageController
#pragma mark - VC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
    // Do any additional setup after loading the view.
}

#pragma mark - Private
- (void)configSubViews {
    [self setNavBgAlpha:0];
}

@end
