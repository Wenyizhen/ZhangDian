//
//  ZDRoleController.m
//  Zhangdian
//
//  Created by xinmai on 2019/3/3.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDRoleController.h"
#import "ZDRoleCell.h"
@interface ZDRoleController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView0;
@property (weak, nonatomic) IBOutlet UITableView *tableView1;

@end

@implementation ZDRoleController

#pragma mark - VC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
}

#pragma mark - Private

- (void)configSubViews {
    self.title = @"角色权限";
}

#pragma mark - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.tableView0) {
        ZDRoleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZDRoleCell_0" forIndexPath:indexPath];
        return cell;
    }else {
        ZDRoleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZDRoleCell_1" forIndexPath:indexPath];
        return cell;

    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
