//
//  ZDBabBarController.m
//  Zhangdian
//
//  Created by W z on 2018/12/17.
//  Copyright © 2018 wenyizhen. All rights reserved.
//

#import "ZDBabBarController.h"

@interface ZDBabBarController ()

@end

@implementation ZDBabBarController
#pragma mark - VC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubController];
    [self configTabBar];
    // Do any additional setup after loading the view.
}

#pragma mark - Private
- (void)configSubController {
    NSArray *titleArr = @[@"首页",@"明细",@"开单",@"报表",@"设置"];
    NSArray *imgArr = @[@"shouyehei",@"mingxihei",@"centerItem",@"baobiao_xuan",@"shezhi"];
    NSArray *selectedImgArr = @[@"shouyezhong",@"mingxi",@"centerItem",@"baobiao_xuanzhong",@"shezhixuan"];
    ZDNavigationController *mainPageNav =  [[UIStoryboard storyboardWithName:@"MainPage" bundle:nil]instantiateInitialViewController];
    ZDNavigationController *detailNav = [[UIStoryboard storyboardWithName:@"Detail" bundle:nil]instantiateInitialViewController];
    ZDNavigationController *billingNav = [[UIStoryboard storyboardWithName:@"Billing" bundle:nil]instantiateInitialViewController];
    ZDNavigationController *formsNav = [[UIStoryboard storyboardWithName:@"Forms" bundle:nil]instantiateInitialViewController];
    ZDNavigationController *setNav = [[UIStoryboard storyboardWithName:@"Set" bundle:nil]instantiateInitialViewController];
    [self setViewControllers:@[mainPageNav,detailNav,billingNav,formsNav,setNav]];
    [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImage *img = [[UIImage imageNamed:imgArr[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *selectedImg = [[UIImage imageNamed:selectedImgArr[idx]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:titleArr[idx] image:img selectedImage:selectedImg];
        if (idx == 2) {
            item.imageInsets =UIEdgeInsetsMake(-15, 0, 15, 0);
        }
        obj.tabBarItem = item;
    }];
}

- (void)configTabBar {
//    [self.tabBar setBackgroundImage:[UIImage new]];
    [self.tabBar setShadowImage:[UIImage new]];
    self.tabBar.tintColor = UIColorHex(0x363839);
    
}

@end
