//
//  MFContainerSegementCell.m
//  MotorFans
//
//  Created by LiuFengting on 2017/4/24.
//  Copyright © 2017年 MotorFans, JDD. All rights reserved.
//

#import "MFContainerSegementCell.h"

@interface MFContainerSegementCell ()

@property (nonatomic, assign)MFContainerConfig *config;

@end

@implementation MFContainerSegementCell

- (void)setupWithTitle:(NSString *)title config:(MFContainerConfig *)config
{
    self.config = config;
    self.titleLabel.text = title;
    self.backgroundColor = UIColor.clearColor;
    self.titleLabel.textColor = config.segementTitleDefaultColor;
//    self.titleLabel.font = [UIFont systemFontOfSize:config.segementTitleDefaultFontSize];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];

    if (!self.config) {
        return;
    }
    self.titleLabel.textColor = selected ? self.config.segementTitleSelectedColor : self.config.segementTitleDefaultColor;
    self.titleLabel.font = selected ? [UIFont boldSystemFontOfSize:self.config.segementTitleSelectedFontSize] : [UIFont systemFontOfSize:self.config.segementTitleDefaultFontSize];
}

- (void)updateWithPercentage:(CGFloat)percentage
{

}

@end
