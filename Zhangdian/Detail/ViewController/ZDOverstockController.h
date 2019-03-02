//
//  ZDOverstockController.h
//  Zhangdian
//
//  Created by xinmai on 2019/3/2.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDViewController.h"

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger,OverstockType) {
    OverstockType_jingsuan,
    OverstockType_yuanpi
};
@interface ZDOverstockController : ZDViewController
@property (assign, nonatomic)OverstockType type;



@end

NS_ASSUME_NONNULL_END
