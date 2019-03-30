//
//  ZDProfitController.m
//  Zhangdian
//
//  Created by xinmai on 2019/3/2.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDProfitController.h"
#import "ZDProfitCell.h"
#import "ZDGarlicProfit.h"

@interface ZDProfitController ()
<
UITableViewDelegate,
UITableViewDataSource,
UITextFieldDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *tableViewList;
@property (weak, nonatomic) IBOutlet UITextField *searchTF;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@property(nonatomic,strong) NSMutableArray *arrProfit;

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
    self.searchTF.delegate = self;
    if (self.type == ProfitType_jingsuan) {
        self.title = @"净蒜利润统计";
        [self fetchGarlicProfit:YES];
    }
    else {
        self.title = @"原皮利润统计";
        [self fetchLeatherProfit:YES];
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
    return _arrProfit.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDProfitCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZDProfitCell" forIndexPath:indexPath];
    NSString *imgStr = [NSString stringWithFormat:@"h%zd",indexPath.row%4];
    cell.imgView.image = [UIImage imageNamed:imgStr];
    if (indexPath.row < _arrProfit.count) {
        [cell setGarlicProfit:_arrProfit[indexPath.row]];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - textField
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (self.type == ProfitType_jingsuan) {
        [self fetchGarlicProfit:YES];
    }
    else {
        [self fetchLeatherProfit:YES];
    }
    return YES;
}

#pragma mark - network
- (void)fetchGarlicProfit:(BOOL)isFirst{
    @weakify(self);
    if (isFirst) {
        _arrProfit = [NSMutableArray array];
    }
    ZDProgressToast(@"正在查询数据...");
    [ZDGarlicProfit fetchGarlicProfitWithKeyword:_searchTF.text
                                         isFirst:isFirst
                                         success:^(NSArray * _Nonnull arrList, BOOL isHaveMore) {
                                             @strongify(self);
                                             [self.arrProfit addObjectsFromArray:arrList];
                                             [self.tableViewList reloadData];
                                             ZDDismissToast;
                                         } fail:^(NSError * _Nonnull error) {
                                             ZDFailToast(error.domain);
                                             ZDDismissToast;
                                         }];
}

- (void)fetchLeatherProfit:(BOOL)isFirst{
    @weakify(self);
    if (isFirst) {
        _arrProfit = [NSMutableArray array];
    }
    ZDProgressToast(@"正在查询数据...");
    [ZDGarlicProfit fetchGarlicProfitWithKeyword:_searchTF.text
                                         isFirst:isFirst
                                         success:^(NSArray * _Nonnull arrList, BOOL isHaveMore) {
                                             @strongify(self);
                                             [self.arrProfit addObjectsFromArray:arrList];
                                             [self.tableViewList reloadData];
                                             ZDDismissToast;
                                         } fail:^(NSError * _Nonnull error) {
                                             ZDFailToast(error.domain);
                                             ZDDismissToast;
                                         }];
}


@end
