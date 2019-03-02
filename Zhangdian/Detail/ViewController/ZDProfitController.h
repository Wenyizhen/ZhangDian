//
//  ZDProfitController.h
//  Zhangdian
//
//  Created by xinmai on 2019/3/2.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDViewController.h"

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger,ProfitType) {
    ProfitType_jingsuan,
    ProfitType_yuanpi
};
@interface ZDProfitController : ZDViewController
@property (assign, nonatomic) ProfitType type;

@end

NS_ASSUME_NONNULL_END
