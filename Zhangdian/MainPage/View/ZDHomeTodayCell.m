//
//  ZDHomeTodayCell.m
//  Zhangdian
//
//  Created by W z on 2019/1/2.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDHomeTodayCell.h"
@interface ZDHomeTodayCell ()

@property (weak, nonatomic) IBOutlet UILabel *upLabel;
@property (weak, nonatomic) IBOutlet UILabel *downLabel;

@end

@implementation ZDHomeTodayCell

- (void)setHomeTodayDict:(NSDictionary *)dict{
    _downLabel.text = dict[@"title"];
    _upLabel.text = [NSString stringWithFormat:@"%@",dict[@"price"]];
}

@end
