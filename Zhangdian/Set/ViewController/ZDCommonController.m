//
//  ZDCommonController.m
//  Zhangdian
//
//  Created by xinmai on 2019/2/19.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDCommonController.h"
#import "ZDSetCell.h"

@interface ZDCommonController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *arr;

@end

@implementation ZDCommonController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通用设置";
    // Do any additional setup after loading the view.
}

#pragma mark - Property
- (NSArray *)arr {
    if (nil == _arr) {
        _arr = @[@{@"icon":@"ku",@"name":@"公司资料"},@{@"icon":@"yuangong",@"name":@"结算方式"},@{@"icon":@"shequniuren",@"name":@"每件重量"},@{@"icon":@"quanxian",@"name":@"单价预设"},@{@"icon":@"dayin",@"name":@"库号设置"}];
    }
    return _arr;
}

#pragma mark - TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDSetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZDSetCell" forIndexPath:indexPath];
    [cell configCellWithDict:self.arr[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

@end
