//
//  ZDBuyDetailCell.h
//  Zhangdian
//
//  Created by W z on 2019/2/28.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZDBuyDetailCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblWeight;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblSum;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;


- (void)setPurchaseDetail:(id)model;

@end

NS_ASSUME_NONNULL_END
