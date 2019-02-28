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
    @weakify(self);
    cell.selectedBlock = ^(NSInteger row) {
        @strongify(self);
        if (row == 0) {
            ZDBuyDetailController *vc = kStoryDetail(@"ZDBuyDetailController");
            vc.title = [NSString stringWithFormat:@"净蒜收购明细%zd",indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
    };
    return cell;
}


@end
