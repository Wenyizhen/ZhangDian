//
//  ZDProfitCell.m
//  Zhangdian
//
//  Created by xinmai on 2019/3/2.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDProfitCell.h"

@implementation ZDProfitCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setGarlicProfit:(ZDGarlicProfit *)profit{
    _nameLabel.text = profit.garlicBuyerName;
    _buyLabel.text = [NSString stringWithFormat:@"%zd元",[profit.buyAmount integerValue]];
    _saleLabel.text = [NSString stringWithFormat:@"%zd元",[profit.sellAmount integerValue]];
    _profitLabel.text = [NSString stringWithFormat:@"%zd元",[profit.profit integerValue]];
}

@end
