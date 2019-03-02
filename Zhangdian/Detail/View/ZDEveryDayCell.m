//
//  ZDEveryDayCell.m
//  Zhangdian
//
//  Created by xinmai on 2019/3/2.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDEveryDayCell.h"

@implementation ZDEveryDayCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.bgView.layer.borderColor = UIColorHex(0x414242).CGColor;
    self.bgView.layer.borderWidth = 1;
}
@end
