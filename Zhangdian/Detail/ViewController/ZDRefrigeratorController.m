//
//  ZDRefrigeratorController.m
//  Zhangdian
//
//  Created by xinmai on 2019/1/27.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDRefrigeratorController.h"

@interface ZDRefrigeratorController ()

@end

@implementation ZDRefrigeratorController
#pragma mark - VC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self confiSubViews];
    // Do any additional setup after loading the view.
}

#pragma mark - Private
- (void)confiSubViews {
    self.title = @"冷库";
}
@end
