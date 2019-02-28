//
//  ZDDetailCell.h
//  Zhangdian
//
//  Created by xinmai on 2019/1/27.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface ZDDetailCell : UITableViewCell
@property (copy, nonatomic) void (^selectedBlock)(NSInteger row);
@end

NS_ASSUME_NONNULL_END
