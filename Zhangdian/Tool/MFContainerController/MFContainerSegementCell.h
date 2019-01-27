//
//  MFContainerSegementCell.h
//  MotorFans
//
//  Created by LiuFengting on 2017/4/24.
//  Copyright © 2017年 MotorFans, JDD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFContainerConfig.h"

@interface MFContainerSegementCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (void)setupWithTitle:(NSString *)title config:(MFContainerConfig *)config;

- (void)updateWithPercentage:(CGFloat)percentage;

@end
