//
//  ZDScreenCell.m
//  Zhangdian
//
//  Created by W z on 2019/2/28.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDScreenCell.h"

@implementation ZDScreenCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.btn.layer.cornerRadius = 4;
}
@end
