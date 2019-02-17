//
//  ZDSetCell.m
//  Zhangdian
//
//  Created by xinmai on 2019/1/27.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDSetCell.h"
@interface ZDSetCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImgView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UIView *topLineView;

@end

@implementation ZDSetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configCellWithDict:(NSDictionary *)dict {
    self.iconImgView.image = [UIImage imageNamed:dict[@"icon"]];
    self.label.text = dict[@"name"];
    if ([dict[@"name"] isEqualToString:@"通用设置"]) {
        self.lineView.hidden = YES;
        self.topLineView.hidden = YES;
    }else if ([dict[@"name"] isEqualToString:@"打印设置"]){
        self.lineView.hidden = NO;
        self.topLineView.hidden = NO;
    }else {
        self.lineView.hidden = NO;
        self.topLineView.hidden = YES;
    }
}

@end
