//
//  ZDFormsCell.h
//  Zhangdian
//
//  Created by xinmai on 2019/3/3.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZDProgressView.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZDFormsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet ZDProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *label_left;
@property (weak, nonatomic) IBOutlet UILabel *label_center;
@property (weak, nonatomic) IBOutlet UILabel *label_right;
@end

NS_ASSUME_NONNULL_END
