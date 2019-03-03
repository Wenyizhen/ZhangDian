//
//  ZDPrintController.m
//  Zhangdian
//
//  Created by xinmai on 2019/2/19.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDPrintController.h"
#import "ZDSetCell.h"
#import "ZDPrintSetController.h"
@interface ZDPrintController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *arr;

@end

@implementation ZDPrintController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"打印设置";
    // Do any additional setup after loading the view.
}

#pragma mark - Property
- (NSArray *)arr {
    if (nil == _arr) {
        _arr = @[@"打印设置",@"设备管理",@"使用教程"];
    }
    return _arr;
}

#pragma mark - TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDSetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZDSetCell" forIndexPath:indexPath];
    cell.titleLabel.text = self.arr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: {
            ZDPrintSetController *vc = kStorySet(@"ZDPrintSetController");
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1: {
            
        }
            break;
        case 2: {
            
        }
            break;
        default:
            break;
    }
}
@end
