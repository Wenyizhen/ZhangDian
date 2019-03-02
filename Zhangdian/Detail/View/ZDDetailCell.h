//
//  ZDDetailCell.h
//  Zhangdian
//
//  Created by xinmai on 2019/1/27.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface ZDDetail : NSObject
@property (strong, nonatomic) NSString *img;
@property (strong, nonatomic) NSString *str;
- (instancetype)initWithImg:(NSString *)img str:(NSString *)str;
@end

@interface ZDDetailCell : UITableViewCell
@property (assign, nonatomic) NSInteger row;
@property (weak, nonatomic) IBOutlet UIButton *waitBtn;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (copy, nonatomic) void (^selectedBlock)(NSInteger row);//-1 待处理
@end

NS_ASSUME_NONNULL_END
