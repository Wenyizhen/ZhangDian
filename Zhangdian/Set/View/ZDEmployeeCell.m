//
//  ZDEmployeeCell.m
//  Zhangdian
//
//  Created by xinmai on 2019/2/24.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDEmployeeCell.h"
@interface ZDEmployeeCell()
@property (weak, nonatomic) IBOutlet UILabel *managerLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@end

@implementation ZDEmployeeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.bottomView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.14].CGColor;
    self.bottomView.layer.shadowOffset = CGSizeMake(0,4);
    self.bottomView.layer.shadowOpacity = 1;
    self.bottomView.layer.shadowRadius = 4;
    self.bottomView.layer.borderWidth = 0.3;
    self.bottomView.layer.borderColor = [UIColor colorWithRed:166/255.0 green:162/255.0 blue:162/255.0 alpha:1.0].CGColor;
    self.bottomView.layer.cornerRadius = 4;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
