//
//  ZDProfitCell.h
//  Zhangdian
//
//  Created by xinmai on 2019/3/2.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZDGarlicProfit.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZDProfitCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyLabel;
@property (weak, nonatomic) IBOutlet UILabel *saleLabel;
@property (weak, nonatomic) IBOutlet UILabel *profitLabel;

- (void)setGarlicProfit:(ZDGarlicProfit *)profit;

@end

NS_ASSUME_NONNULL_END
