//
//  ZDBuyDetailController.h
//  Zhangdian
//
//  Created by W z on 2019/2/28.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZDViewController.h"
NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger,DetailType) {
    DetailType_jingsuan_shougou = 0,
    DetailType_yuanpi_shougou,
    DetailType_jingsuan_chushou,
    DetailType_yuanpi_chushou,
};
@interface ZDBuyDetailController : ZDViewController
@property (assign, nonatomic) DetailType type;
@end

NS_ASSUME_NONNULL_END
