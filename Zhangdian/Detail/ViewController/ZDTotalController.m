//
//  ZDTotalController.m
//  Zhangdian
//
//  Created by xinmai on 2019/3/2.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDTotalController.h"
#import "ZDTotalCell.h"
@interface ZDTotalController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ZDTotalController

#pragma mark - VC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
}

#pragma mark - Private

- (void)configSubViews {
    
}

#pragma mark - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDTotalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZDTotalCell" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.label_0.text = @"规格";
        cell.label_1.text = @"平均价";
        cell.label_2.text = @"总重量";
        cell.label_3.text = @"总金额";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (IBAction)printAction:(id)sender {
}
@end
