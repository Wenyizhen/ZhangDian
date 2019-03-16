//
//  ZDBabBarController.m
//  Zhangdian
//
//  Created by W z on 2018/12/17.
//  Copyright © 2018 wenyizhen. All rights reserved.
//

#import "ZDBabBarController.h"
#import "ZDPublishView.h"
#import "ZDIntrolduceView.h"
#import "ZDTabBar.h"
@interface ZDBabBarController ()<UITabBarControllerDelegate>

@end

@implementation ZDBabBarController
#pragma mark - VC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configTabBar];
    [self configSubController];
    [[UITabBar appearance] setTranslucent:NO];
    // Do any additional setup after loading the view.
}

#pragma mark - Private
- (void)configSubController {
    NSArray *titleArr = @[@"首页",@"明细",@"开单",@"报表",@"设置"];
    NSArray *imgArr = @[@"shouyehei",@"mingxihei",@"centerItem",@"baobiao_xuan",@"shezhi"];
    NSArray *selectedImgArr = @[@"shouyezhong",@"mingxi",@"centerItem",@"baobiao_xuanzhong",@"shezhixuan"];
    ZDNavigationController *mainPageNav =  [[UIStoryboard storyboardWithName:@"MainPage" bundle:nil]instantiateInitialViewController];
    ZDNavigationController *detailNav = [[UIStoryboard storyboardWithName:@"Detail" bundle:nil]instantiateInitialViewController];
    UIViewController *billingVC = [[UIViewController alloc]init];
    ZDNavigationController *formsNav = [[UIStoryboard storyboardWithName:@"Forms" bundle:nil]instantiateInitialViewController];
    ZDNavigationController *setNav = [[UIStoryboard storyboardWithName:@"Set" bundle:nil]instantiateInitialViewController];
    [self setViewControllers:@[mainPageNav,detailNav,billingVC,formsNav,setNav]];
    [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImage *img = [[UIImage imageNamed:imgArr[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *selectedImg = [[UIImage imageNamed:selectedImgArr[idx]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:titleArr[idx] image:img selectedImage:selectedImg];
        if (idx == 2) {
            item.imageInsets =UIEdgeInsetsMake(-10, 0, 10, 0);
        }
        obj.tabBarItem = item;
    }];
    if (![[NSUserDefaults standardUserDefaults]boolForKey:@"first"]) {
        ZDIntrolduceView *view = [[ZDIntrolduceView alloc]initWithFrame:self.view.bounds];
        [self.view addSubview:view];
        [self.view bringSubviewToFront:view];
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"first"];
    }
}

- (void)configTabBar {
    ZDTabBar *tabBar = [[ZDTabBar alloc]init];
    [self setValue:tabBar forKey:@"tabBar"];
    [self.tabBar setShadowImage:[UIImage new]];
    self.tabBar.tintColor = UIColorHex(0x363839);
    self.delegate = self;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    if ([viewController isKindOfClass:[ZDNavigationController class]]) {
        return YES;
    }

    ZDPublishView *view = [[UINib nibWithNibName:@"ZDPublishView" bundle:nil]instantiateWithOwner:nil options:nil].firstObject;
    [view show];
    return NO;
}


@end
