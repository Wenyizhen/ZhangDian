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
#import "ZDOverstockController.h"
#import "ZDEverydayController.h"
#import "ZDProfitController.h"
#import "ZDPendingController.h"
#import "ZDLoginController.h"

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
    switch (row) {
        case 0:{
            ZDBuyDetailController *vc = kStoryDetail(@"ZDBuyDetailController");
            vc.type = DetailType_jingsuan_shougou;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:{
            ZDBuyDetailController *vc = kStoryDetail(@"ZDBuyDetailController");
            vc.type = DetailType_jingsuan_chushou;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:{
            ZDOverstockController *vc = kStoryDetail(@"ZDOverstockController");
            vc.type = ProfitType_jingsuan;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:{
            ZDProfitController *vc = kStoryDetail(@"ZDProfitController");
            vc.type = ProfitType_jingsuan;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:{
            ZDEverydayController *vc = kStoryDetail(@"ZDEverydayController");
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 5:{
            
        }
            break;
        case 6:{
            
        }
            break;

        default:{
            ZDPendingController *vc = kStoryDetail(@"ZDPendingController");
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
    }
}

- (void)yuanpi:(NSInteger)row {
    switch (row) {
        case 0:{
            ZDBuyDetailController *vc = kStoryDetail(@"ZDBuyDetailController");
            vc.type = DetailType_yuanpi_shougou;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:{
            ZDBuyDetailController *vc = kStoryDetail(@"ZDBuyDetailController");
            vc.type = DetailType_yuanpi_chushou;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:{
            ZDOverstockController *vc = kStoryDetail(@"ZDOverstockController");
            vc.type = ProfitType_yuanpi;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:{
            ZDProfitController *vc = kStoryDetail(@"ZDProfitController");
            vc.type = ProfitType_yuanpi;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:{
            ZDEverydayController *vc = kStoryDetail(@"ZDEverydayController");
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 5:{
            
        }
            break;
        case 6:{
            
        }
            break;
            
        default:{
            ZDPendingController *vc = kStoryDetail(@"ZDPendingController");
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
    }
}

@end
