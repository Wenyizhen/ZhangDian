//
//  ZDScreenReusableView.m
//  Zhangdian
//
//  Created by W z on 2019/2/28.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDScreenReusableView.h"

@implementation ZDScreenReusableView
- (void)awakeFromNib {
    [super awakeFromNib];
    self.startBtn.layer.cornerRadius = 4;
    self.endBtn.layer.cornerRadius = 4;
}

- (IBAction)endAction:(id)sender {
}

- (IBAction)startAction:(id)sender {
}

@end
