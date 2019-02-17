//
//  ZDSetController.m
//  Zhangdian
//
//  Created by W z on 2018/12/17.
//  Copyright © 2018 wenyizhen. All rights reserved.
//

#import "ZDSetController.h"
#import "ZDSetCell.h"
@interface ZDSetController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIView *detailBgView;
@property (weak, nonatomic) IBOutlet UIImageView *headIImgView;
@property (weak, nonatomic) IBOutlet UILabel *positionLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) NSArray *arr;
@end

@implementation ZDSetController
#pragma mark - VC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
    // Do any additional setup after loading the view.
}

#pragma mark - Private
- (NSDictionary *)getDict:(NSIndexPath *)index {
    if (index.section ==0) {
        return self.arr[0];
    }
    if (index.section == 1) {
        return self.arr[1+index.row];
    }
    if (index.section ==2) {
        return self.arr[self.arr.count-2];
    }
    return self.arr.lastObject;
}

- (void)configSubViews {
    [self setNavHidden:YES];
    self.tableView.backgroundColor = kColor_f7f7f7;
    [self contentBehaviorNever:self.tableView];
    
    self.detailBgView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.19].CGColor;
    self.detailBgView.layer.shadowOffset = CGSizeMake(0,2);
    self.detailBgView.layer.shadowOpacity = 1;
    self.detailBgView.layer.shadowRadius = 3;
    self.detailBgView.layer.cornerRadius = 16.7;
    self.headIImgView.layer.cornerRadius = 31;
    self.positionLabel.layer.cornerRadius = 7.5;
}

#pragma mark - Property
- (NSArray *)arr {
    if (nil == _arr) {
        _arr = @[@{@"icon":@"ku",@"name":@"通用设置"},@{@"icon":@"yuangong",@"name":@"员工设置"},@{@"icon":@"shequniuren",@"name":@"收购商管理"},@{@"icon":@"quanxian",@"name":@"角色权限"},@{@"icon":@"dayin",@"name":@"打印设置"},@{@"icon":@"fenxiang",@"name":@"分享给好友"}];
    }
    return _arr;
}

#pragma mark - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1) {
        return 3;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 0;
            break;
        case 1:
            return 31;
            break;
        case 2:
            return 26;
            break;
        case 3:
            return 43;
            break;
        default:
            return 0;
            break;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = kColor_f7f7f7;
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDSetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZDSetCell" forIndexPath:indexPath];
    [cell configCellWithDict:[self getDict:indexPath]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
