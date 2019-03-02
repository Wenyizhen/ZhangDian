//
//  ZDOverstockController.m
//  Zhangdian
//
//  Created by xinmai on 2019/3/2.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDOverstockController.h"
#import "ZDOverstockCell.h"
#import "ZDScreenCell.h"
@interface ZDOverstockController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (weak, nonatomic) IBOutlet UILabel *tonneLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *tapView;

@property (weak, nonatomic) IBOutlet UIView *screenView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionViewFlowLayout;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *trailingLayoutConstraint;

@end

@implementation ZDOverstockController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
}

#pragma mark - Private
- (void)configSubViews {
    if (self.type == OverstockType_yuanpi) {
        self.title = @"净蒜余货信息";
    }else if (self.type == OverstockType_jingsuan) {
        self.title = @"原皮余货信息";
    }
    [self setNavBgColor:UIColorHex(0x404040)];
    [self setNavTitleColor:UIColor.whiteColor];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, -400, self.view.width, 400)];
    view.backgroundColor = UIColorHex(0x404040);
    [self.tableView addSubview:view];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"return"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"baishai"] style:UIBarButtonItemStylePlain target:self action:@selector(filterAction:)];
    self.navigationItem.leftBarButtonItem.tintColor = UIColor.whiteColor;
    self.navigationItem.rightBarButtonItem.tintColor = UIColor.whiteColor;
    
    self.collectionViewFlowLayout.minimumInteritemSpacing = 7;
    self.collectionViewFlowLayout.itemSize =CGSizeMake((kScreenWidth - 80 - 4*7)/3., 41);
    self.collectionViewFlowLayout.sectionInset = UIEdgeInsetsMake(0, 7, 25, 7);
    
    self.screenView.hidden = YES;
    self.screenView.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:.0];
    self.trailingLayoutConstraint.constant = 80 -kScreenWidth;
    @weakify(self);
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithActionBlock:^(id  _Nonnull sender) {
        @strongify(self);
        self.trailingLayoutConstraint.constant = 80 - kScreenWidth;
        [UIView animateWithDuration:.3 animations:^{
            [self.view layoutIfNeeded];
            self.screenView.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:.0];
        }completion:^(BOOL finished) {
            self.screenView.hidden = YES;
        }];
    }];
    [self.tapView addGestureRecognizer:tap];
}

- (void)filterAction:(id)sender {
    if (self.trailingLayoutConstraint.constant == 0) {
        self.trailingLayoutConstraint.constant = 80 - kScreenWidth;
        [UIView animateWithDuration:.3 animations:^{
            [self.view layoutIfNeeded];
            self.screenView.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:.0];
        }completion:^(BOOL finished) {
            self.screenView.hidden = YES;
        }];
    }else{
        self.screenView.hidden = NO;
        self.trailingLayoutConstraint.constant = 0;
        [UIView animateWithDuration:.3 animations:^{
            [self.view layoutIfNeeded];
            self.screenView.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:.6];
        }];
    }
}

#pragma mark - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDOverstockCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZDOverstockCell" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.label_0.text = @"规格（吨）";
        cell.label_1.text = @"重量（斤）";
        cell.label_2.text = @"吨数";
    }else {
        cell.label_0.text = @"3.4";
        cell.label_1.text = @"5.6";
        cell.label_2.text = @"4";

    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - CollectionView

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZDScreenCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZDScreenCell" forIndexPath:indexPath];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(kScreenWidth - 80, 50);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeZero;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        return view;
    }
    return nil;
}

- (IBAction)printAction:(id)sender {
}

- (IBAction)resetAction:(id)sender {
}

- (IBAction)confirmAction:(id)sender {
}

@end
