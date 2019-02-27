//
//  ZDYPSGController.m
//  Zhangdian
//
//  Created by xinmai on 2019/2/27.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDYPSGController.h"
#import "ZDYPSGCell.h"
#import "ZDYPSG.h"
#import "ZDWarehouseController.h"
@interface ZDYPSGController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *printBtn;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UIButton *accountBtn;
@property (strong,nonatomic) NSArray *arr;
@end

@implementation ZDYPSGController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
    // Do any additional setup after loading the view.
}

- (void)configSubViews {
    self.title = @"原皮收购";
    self.printBtn.layer.cornerRadius = 24.;
    self.saveBtn.layer.cornerRadius = 24.;
    self.accountBtn.layer.cornerRadius = 24.;
}

- (NSArray *)arr {
    if (!_arr) {
        _arr = @[[[ZDYPSG alloc]initWithTitle:@"收购商"],
                 [[ZDYPSG alloc]initWithTitle:@"仓库号"],
                 [[ZDYPSG alloc]initWithTitle:@"规格"],
                 [[ZDYPSG alloc]initWithTitle:@"农户"],
                 [[ZDYPSG alloc]initWithTitle:@"榜底"],
                 [[ZDYPSG alloc]initWithTitle:@"单间"],
                 [[ZDYPSG alloc]initWithTitle:@"毛重"],
                 [[ZDYPSG alloc]initWithTitle:@"皮重"],
                 [[ZDYPSG alloc]initWithTitle:@"净重"],
                 [[ZDYPSG alloc]initWithTitle:@"吨数"]];
    }
                 return _arr;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *idStr = indexPath.row<3?@"ZDYPSGCell_click":@"ZDYPSGCell";
    ZDYPSGCell *cell = [tableView dequeueReusableCellWithIdentifier:idStr forIndexPath:indexPath];
    ZDYPSG *model = self.arr[indexPath.row];
    cell.titleLabel.text = model.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        ZDWarehouseController *vc = kStoryBilling(@"ZDWarehouseController");
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (IBAction)printAction:(id)sender {
}
- (IBAction)saveAction:(id)sender {
}
- (IBAction)accountAction:(id)sender {
}

@end
