//
//  ZDCommonController.m
//  Zhangdian
//
//  Created by xinmai on 2019/2/19.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDCommonController.h"
#import "ZDSetCell.h"
#import "ZDCompanyController.h"
#import "ZDWayController.h"
#import "ZDEveryController.h"
#import "ZDPriceController.h"
#import "ZDNumberController.h"

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
        _arr = @[@{@"icon":@"l0",@"name":@"公司资料"},@{@"icon":@"l1",@"name":@"结算方式"},@{@"icon":@"l2",@"name":@"每件重量"},@{@"icon":@"l3",@"name":@"单价预设"},@{@"icon":@"l4",@"name":@"库号设置"}];
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
    switch (indexPath.row) {
        case 0:{
            ZDCompanyController *vc = kStorySet(@"ZDCompanyController");
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:{
            ZDWayController *vc = kStorySet(@"ZDWayController");
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2: {
            ZDEveryController *vc = kStorySet(@"ZDEveryController");
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:{
            ZDPriceController *vc = kStorySet(@"ZDPriceController");
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4: {
            ZDNumberController *vc = kStorySet(@"ZDNumberController");
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;

        default:
            break;
    }
}

@end
