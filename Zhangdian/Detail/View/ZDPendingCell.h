//
//  ZDPendingCell.h
//  Zhangdian
//
//  Created by xinmai on 2019/3/2.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZDPendingCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *carLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;



@end

NS_ASSUME_NONNULL_END
