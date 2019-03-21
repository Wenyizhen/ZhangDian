//
//  ZDTodayeusableView.m
//  Zhangdian
//
//  Created by W z on 2019/1/2.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDTodayeusableView.h"

@interface ZDTodayeusableView ()

@property (weak, nonatomic) IBOutlet UILabel *lblDate;


@end

@implementation ZDTodayeusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setUpdateDate:(NSString *)date{
    _lblDate.text = [NSString stringWithFormat:@"更新于%@",date];
}

@end
