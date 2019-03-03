
//
//  ZDCompanyController.m
//  Zhangdian
//
//  Created by xinmai on 2019/3/3.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDCompanyController.h"
#import "ZDLabelModel.h"
#import "ZDCompanyCell.h"
@interface ZDCompanyController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *arr;

@end

@implementation ZDCompanyController
#pragma mark - VC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
}

#pragma mark - Private

- (void)configSubViews {
    self.title = @"公司信息";
}

- (NSArray *)arr {
    if (!_arr) {
        _arr = @[[[ZDLabelModel alloc]initWithStr0:@"公司头像" str1:@""],
                [[ZDLabelModel alloc]initWithStr0:@"公司名称" str1:@"公司名称"],
                [[ZDLabelModel alloc]initWithStr0:@"联系人" str1:@"联系人"],
                [[ZDLabelModel alloc]initWithStr0:@"联系电话" str1:@"联系电话"],
                [[ZDLabelModel alloc]initWithStr0:@"公司地址" str1:@"公司地址"],
                [[ZDLabelModel alloc]initWithStr0:@"详细地址" str1:@"详细地址"]
                ];
    }
    return _arr;
}

#pragma mark - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *str = indexPath.row == 0?@"ZDCompanyCell_header":@"ZDCompanyCell";
    ZDCompanyCell * cell = [tableView dequeueReusableCellWithIdentifier:str forIndexPath:indexPath];
    ZDLabelModel *model = self.arr[indexPath.row];
    cell.leftLabel.text = model.str_0;
    cell.rightLabel.text = model.str_1;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
