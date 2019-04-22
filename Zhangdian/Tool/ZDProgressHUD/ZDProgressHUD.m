//
//  ZDProgressHUD.m
//  Zhangdian
//
//  Created by beice on 2019/3/25.
//  Copyright © 2019 beice. All rights reserved.
//

#import "ZDProgressHUD.h"
#import <MBProgressHUD/MBProgressHUD.h>

static CGFloat DelayTime = 1.5;

@interface ZDProgressHUD ()

@property(nonatomic,strong) UIWindow *windowHUD;
@property(nonatomic,strong) MBProgressHUD *progress;

@end

@implementation ZDProgressHUD

+ (instancetype)sharedManager{
    static ZDProgressHUD *progressHUD;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        progressHUD = [[self alloc]init];
    });
    return progressHUD;
}

#pragma mark - lazy
- (MBProgressHUD *)progress{
    if (!_progress) {
        _progress = [[MBProgressHUD alloc]init];
    }
    return _progress;
}

- (UIWindow *)windowHUD{
    if (!_windowHUD) {
        _windowHUD = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _windowHUD.windowLevel = UIWindowLevelStatusBar + 1;
        _windowHUD.hidden = NO;
    }
    return _windowHUD;
}

#pragma mark - funcation
- (void)showProgressWithMessage:(NSString *)message{
    __weak __typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.progress.mode = MBProgressHUDModeIndeterminate;
        strongSelf.progress.contentColor = [UIColor blackColor];
        if (message.length > 0) {
            strongSelf.progress.label.text = message;
        }
        strongSelf.windowHUD.hidden = NO;
        [strongSelf.windowHUD addSubview:strongSelf.progress];
        [strongSelf.progress showAnimated:YES];
    });
}

- (void)showSuccessWithMessage:(NSString *)message{
    __weak __typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.progress.mode = MBProgressHUDModeCustomView;
        strongSelf.progress.contentColor = [UIColor blackColor];
        if (message.length > 0) {
            strongSelf.progress.label.text = message;
        }
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ft_success"]];
        [strongSelf.windowHUD addSubview:imageView];
        strongSelf.progress.customView = imageView;
        strongSelf.windowHUD.hidden = NO;
        [strongSelf.windowHUD addSubview:strongSelf.progress];
        [strongSelf.progress showAnimated:YES];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DelayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf dismiss];
    });
}

- (void)showFailWithMessage:(NSString *)message{
    __weak __typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.progress.mode = MBProgressHUDModeCustomView;
        strongSelf.progress.contentColor = [UIColor blackColor];
        if (message.length > 0) {
            strongSelf.progress.label.text = message;
        }
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ft_failure"]];
        strongSelf.progress.customView = imageView;
        strongSelf.windowHUD.hidden = NO;
        [strongSelf.windowHUD addSubview:strongSelf.progress];
        [strongSelf.progress showAnimated:YES];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DelayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf dismiss];
    });
}

- (void)dismiss{
    __weak __typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf.progress removeFromSuperview];
        strongSelf.windowHUD.hidden = YES;
    });
}

@end
