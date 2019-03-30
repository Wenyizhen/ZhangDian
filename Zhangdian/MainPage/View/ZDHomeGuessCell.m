//
//  ZDHomeGuessCell.m
//  Zhangdian
//
//  Created by W z on 2019/1/2.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDHomeGuessCell.h"
@interface ZDHomeGuessCell ()
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblBrowse;
@property (weak, nonatomic) IBOutlet UILabel *lblAddress;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;

@end

@implementation ZDHomeGuessCell

- (void)setMainGuessPort:(ZDMainGuessPort *)guess{
    _lblName.text = guess.breedName;
    _lblPrice.text = [NSString stringWithFormat:@"%0.2f元/斤",guess.unitPrice.floatValue];
    _lblBrowse.text = [NSString stringWithFormat:@"%zd次浏览",guess.viewCount.integerValue];
    _lblAddress.text = guess.address;
    _lblTime.text = [NSString stringWithFormat:@"%@小时 | %@km",guess.timesAgo,guess.distance];
}

@end
