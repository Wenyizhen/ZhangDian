//
//  ZDProgressHUD.h
//  Zhangdian
//
//  Created by beice on 2019/3/25.
//  Copyright © 2019 beice. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define ZDToast [ZDProgressHUD sharedManager]
#define ZDProgressToast(message) [[ZDProgressHUD sharedManager]showProgressWithMessage:message]
#define ZDSuccessToast(message)  [[ZDProgressHUD sharedManager]showSuccessWithMessage:message]
#define ZDFailToast(message)     [[ZDProgressHUD sharedManager]showFailWithMessage:message]
#define ZDDismissToast           [[ZDProgressHUD sharedManager]dismiss]

@interface ZDProgressHUD : NSObject

+ (instancetype)sharedManager;

#pragma mark - funcation
- (void)showProgressWithMessage:(NSString *)message;

- (void)showSuccessWithMessage:(NSString *)message;

- (void)showFailWithMessage:(NSString *)message;

- (void)dismiss;

@end

NS_ASSUME_NONNULL_END
