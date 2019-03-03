//
//  ZDWayController.m
//  Zhangdian
//
//  Created by xinmai on 2019/3/3.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDWayController.h"
#import "ZDWayCell.h"
@interface ZDWayController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (assign, nonatomic) NSInteger selectRow;

@end

@implementation ZDWayController

#pragma mark - VC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
}

#pragma mark - Private

- (void)configSubViews {
    self.title = @"结算方式";
}


#pragma mark - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDWayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZDWayCell" forIndexPath:indexPath];
    cell.label.text = indexPath.row ==0?@"直接抹零":@"四舍五入";
    NSString *str = indexPath.row == self.selectRow?@"xuanzhong":@"meiyou";
    cell.imgView.image = [UIImage imageNamed:str];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectRow = indexPath.row;
    [self.tableView reloadData];
}

@end
