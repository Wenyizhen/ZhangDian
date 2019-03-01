//
//  ZDDetailController.m
//  Zhangdian
//
//  Created by W z on 2018/12/17.
//  Copyright © 2018 wenyizhen. All rights reserved.
//

#import "ZDDetailController.h"
#import "ZDBuyController.h"
#import "ZDRefrigeratorController.h"
@interface ZDDetailController ()
@property (strong, nonatomic) MFContainerController *container;
@property (strong, nonatomic) ZDBuyController *buyVC;
@property (strong, nonatomic) ZDBuyController *refrigeratorVC;
//@property (strong, nonatomic) ZDRefrigeratorController *refrigeratorVC;

@end

@implementation ZDDetailController
#pragma mark - VC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
    // Do any additional setup after loading the view.
}

#pragma mark - Private
- (void)configSubViews {
    self.buyVC = kStoryDetail(@"ZDBuyController");
    self.buyVC.title = @"购销";
//    self.refrigeratorVC = kStoryDetail(@"ZDRefrigeratorController");
    self.refrigeratorVC = kStoryDetail(@"ZDBuyController");
    self.refrigeratorVC.title = @"冷库";
    MFContainerConfig *config = [MFContainerConfig navConfigWithTabbar:YES];

    self.container = [[MFContainerController alloc] initWithSuperViewController:self
                                                    viewControllers:@[self.buyVC, self.refrigeratorVC]
                                                                         config:config
                                                                       delegate:nil];
    [self.navigationItem setTitleView:self.container.segementView];
    [self.view addSubview:self.container.view];
}

@end
