//
//  ZDViewController.h
//  Zhangdian
//
//  Created by W z on 2018/12/17.
//  Copyright © 2018 wenyizhen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZDViewController : UIViewController

#pragma mark - Nav相关
//nav背景透明度
- (void)setNavBgAlpha:(CGFloat)alpha;
//nav隐藏
- (void)setNavHidden:(BOOL)hidden;
//nav title字颜色
- (void)setNavTitleColor:(UIColor *)color;
//nav 背景颜色
- (void)setNavBgColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
