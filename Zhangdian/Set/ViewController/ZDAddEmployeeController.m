//
//  ZDAddEmployeeController.m
//  Zhangdian
//
//  Created by xinmai on 2019/2/24.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDAddEmployeeController.h"
#import "ZDAddEmployeeHeaderView.h"
#import "ZDAddEmployeeCell.h"
@interface ZDAddEmployeeController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ZDAddEmployeeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(doneAction:)];
    self.navigationItem.rightBarButtonItem.tintColor = UIColorHex(0x060606);
    self.title = @"员工";
    // Do any additional setup after loading the view.
}

- (void)doneAction:(id)sender {
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return 60;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section ==1) {
        ZDAddEmployeeHeaderView *view = [[UINib nibWithNibName:@"ZDAddEmployeeHeaderView" bundle:nil]instantiateWithOwner:nil options:nil].firstObject;
        return view;
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 6;
    }
    return 2;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDAddEmployeeCell *cell = nil;
    if (indexPath.section ==0) {
        switch (indexPath.row) {
            case 0:
            {
                cell = [tableView dequeueReusableCellWithIdentifier:@"ZDAddEmployeeCell_input" forIndexPath:indexPath];
                return cell;
            }
                break;
            case 1:
            {
                cell = [tableView dequeueReusableCellWithIdentifier:@"ZDAddEmployeeCell_input" forIndexPath:indexPath];
                return cell;
            }
                break;
            case 2:
            {
                cell = [tableView dequeueReusableCellWithIdentifier:@"ZDAddEmployeeCell_choose" forIndexPath:indexPath];
                return cell;
            }
                break;
            case 3:
            {
                cell = [tableView dequeueReusableCellWithIdentifier:@"ZDAddEmployeeCell_input" forIndexPath:indexPath];
                return cell;
            }
                break;
            case 4:
            {
                cell = [tableView dequeueReusableCellWithIdentifier:@"ZDAddEmployeeCell_choose" forIndexPath:indexPath];
                return cell;
            }
                break;

            default:
            {
                cell = [tableView dequeueReusableCellWithIdentifier:@"ZDAddEmployeeCell_switch" forIndexPath:indexPath];
                return cell;
            }
                break;
        }
    }else {
         cell = [tableView dequeueReusableCellWithIdentifier:@"ZDAddEmployeeCell_set" forIndexPath:indexPath];
    }
    return cell;
}
@end
