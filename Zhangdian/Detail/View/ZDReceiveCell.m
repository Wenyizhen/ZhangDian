//
//  ZDReceiveCell.m
//  Zhangdian
//
//  Created by xinmai on 2019/3/3.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDReceiveCell.h"

@implementation ZDReceiveCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.bgView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.18].CGColor;
    self.bgView.layer.shadowOffset = CGSizeMake(1,2);
    self.bgView.layer.shadowOpacity = 1;
    self.bgView.layer.shadowRadius = 1;
    self.bgView.layer.borderWidth = 0.7;
    self.bgView.layer.borderColor = [UIColor colorWithRed:228/255.0 green:230/255.0 blue:229/255.0 alpha:1.0].CGColor;
    self.bgView.layer.cornerRadius = 5.3;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
