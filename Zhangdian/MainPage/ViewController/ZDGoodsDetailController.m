//
//  ZDGoodsDetailController.m
//  Zhangdian
//
//  Created by xinmai on 2019/2/21.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDGoodsDetailController.h"
#import "ZDGoodsDetailHeaderView.h"
#import "ZDGoodsDetailCell.h"
@interface ZDGoodsDetailController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *approveLabel;

@end

@implementation ZDGoodsDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
    // Do any additional setup after loading the view.
}

- (void)configSubViews {
    [self setNavBgAlpha:0];
    [self contentBehaviorNever:self.tableView];
    self.approveLabel.textColor = UIColorHex(0xFFB100);
    self.approveLabel.layer.borderColor = UIColorHex(0xFFB100).CGColor;
    self.approveLabel.layer.borderWidth =1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 38;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 6;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 37;
    }
    return 260;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ZDGoodsDetailHeaderView *view = [[UINib nibWithNibName:@"ZDGoodsDetailHeaderView" bundle:nil]instantiateWithOwner:nil options:nil].firstObject;
    if (section == 1) {
        view.titleLabel.text = @"产品详情";
    }
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        ZDGoodsDetailCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ZDGoodsDetailCell" forIndexPath:indexPath];
        return cell;
    }
    else {
        ZDGoodsDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZDGoodsDetailCellPic" forIndexPath:indexPath];
        return cell;
    }
}


@end
