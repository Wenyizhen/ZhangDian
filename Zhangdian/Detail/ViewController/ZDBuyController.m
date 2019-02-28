//
//  ZDBuyController.m
//  Zhangdian
//
//  Created by xinmai on 2019/1/27.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDBuyController.h"
#import "ZDBuyDetailController.h"
#import "ZDDetailCell.h"
@interface ZDBuyController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ZDBuyController
#pragma mark - VC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
    // Do any additional setup after loading the view.
}

#pragma mark - Private
- (void)configSubViews {
}

#pragma mark - TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 265;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZDDetailCell" forIndexPath:indexPath];
    cell.label.text = indexPath.row == 0?@"净蒜明细":@"原皮明细";
    cell.row = indexPath.row;
    @weakify(self);
    cell.selectedBlock = ^(NSInteger row) {
        @strongify(self);
        if (indexPath.row == 0) {
            [self jingsuan:row];
        }else {
            [self yuanpi:row];
        }
    };
    return cell;
}

- (void)jingsuan:(NSInteger)row {
    ZDBuyDetailController *vc = kStoryDetail(@"ZDBuyDetailController");
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)yuanpi:(NSInteger)row {
    ZDBuyDetailController *vc = kStoryDetail(@"ZDBuyDetailController");
    [self.navigationController pushViewController:vc animated:YES];
}

@end
