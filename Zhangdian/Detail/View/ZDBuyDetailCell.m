//
//  ZDBuyDetailCell.m
//  Zhangdian
//
//  Created by W z on 2019/2/28.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDBuyDetailCell.h"
#import "ZDPurchasezDetailPort.h"

@implementation ZDBuyDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setPurchaseDetail:(id)model{
        ZDPurchasezDetailPort *garlicPurchase = (ZDPurchasezDetailPort *)model;
        _lblName.text = garlicPurchase.farmerName;
        _lblWeight.text = [NSString stringWithFormat:@"%zd",garlicPurchase.weight.integerValue];
        _lblPrice.text = [NSString stringWithFormat:@"%0.1f",garlicPurchase.unitPrice.floatValue];
        _lblSum.text = [NSString stringWithFormat:@"%zd",garlicPurchase.totalAmount.integerValue];
        _lblTime.text = garlicPurchase.acquisitionTime;
    
}

@end
