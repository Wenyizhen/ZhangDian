//
//  ZDViewController.m
//  Zhangdian
//
//  Created by W z on 2018/12/17.
//  Copyright © 2018 wenyizhen. All rights reserved.
//

#import "ZDViewController.h"

@interface ZDViewController ()

@end

@implementation ZDViewController
#pragma mark - VC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNav];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view.
}

- (void)dealloc {
    NSLog(@"============= dealloc ===============");
}

#pragma mark - Private
- (void)configNav {
    if (self.navigationController.viewControllers.count>1) {
        UIImage *img = [UIImage imageNamed:@"return"];
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithImage:[img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(backAction:)];
        backItem.imageInsets = UIEdgeInsetsMake(0, -8, 0, 0);
        self.navigationItem.leftBarButtonItem = backItem;
    }
    self.hbd_barShadowHidden = YES;
    [self setNavBgColor:kColor_ffd50d];
    [self setNavTitleColor:UIColor.blackColor];
}

- (void)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Public
- (void)contentBehaviorNever:(UIScrollView *)scrollView {
    if (@available(iOS 11.0,*)) {
        scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}


#pragma mark - Nav相关
- (void)setNavBgAlpha:(CGFloat)alpha {
    self.hbd_barAlpha = alpha;
    [self hbd_setNeedsUpdateNavigationBarAlpha];
    
}

- (void)setNavHidden:(BOOL)hidden {
    self.hbd_barHidden = hidden;
}

- (void)setNavTitleColor:(UIColor *)color {
    self.hbd_titleTextAttributes = @{NSForegroundColorAttributeName:color,NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Medium" size:17]};
    [self hbd_setNeedsUpdateNavigationBar];
}

- (void)setNavBgColor:(UIColor *)color {
    self.hbd_barTintColor = color;
    [self hbd_setNeedsUpdateNavigationBar];
}

@end
