//
//  ZDProfitController.m
//  Zhangdian
//
//  Created by xinmai on 2019/3/2.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDProfitController.h"
#import "ZDProfitCell.h"
@interface ZDProfitController ()<UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *searchTF;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@end

@implementation ZDProfitController

#pragma mark - VC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
}

#pragma mark - Private

- (void)configSubViews {
    self.bgView.layer.cornerRadius = 19;
    if (self.type == ProfitType_jingsuan) {
        self.title = @"净蒜利润统计";
    }else {
        self.title = @"原皮利润统计";
    }
    self.view.backgroundColor = UIColor.blackColor;
    [self setNavBgColor:UIColorHex(0x404040)];
    [self setNavTitleColor:UIColor.whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"return"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    self.navigationItem.leftBarButtonItem.tintColor = UIColor.whiteColor;
}

#pragma mark - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDProfitCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZDProfitCell" forIndexPath:indexPath];
    NSString *imgStr = [NSString stringWithFormat:@"h%zd",indexPath.row%4];
    cell.imgView.image = [UIImage imageNamed:imgStr];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
