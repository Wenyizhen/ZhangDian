//
//  ZDBuyDetailController.m
//  Zhangdian
//
//  Created by W z on 2019/2/28.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDBuyDetailController.h"
#import "ZDBuyDetailCell.h"
#import "ZDScreenCell.h"
#import "ZDScreenReusableView.h"
@interface ZDBuyDetailController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UIView *screenView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionViewFlowLayout;
@property (weak, nonatomic) IBOutlet UIView *headerBgView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *trailingLayoutConstraint;

@end

@implementation ZDBuyDetailController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
}

- (void)configSubViews {
    self.headerBgView.clipsToBounds = YES;
    self.headerBgView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.39].CGColor;
    self.headerBgView.layer.shadowOffset = CGSizeMake(0,2);
    self.headerBgView.layer.shadowOpacity = 1;
    self.headerBgView.layer.shadowRadius = 5;
    self.headerBgView.layer.borderWidth = 0.3;
    self.headerBgView.layer.borderColor = [UIColor colorWithRed:203/255.0 green:204/255.0 blue:204/255.0 alpha:1.0].CGColor;
    self.headerBgView.layer.cornerRadius = 7;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"筛选" style:UIBarButtonItemStylePlain target:self action:@selector(screenAction:)];
    self.navigationItem.rightBarButtonItem.tintColor = kColor_NavTint;
    
    self.collectionViewFlowLayout.minimumInteritemSpacing = 7;
    self.collectionViewFlowLayout.itemSize =CGSizeMake((kScreenWidth - 80 - 4*7)/3., 41);
    self.collectionViewFlowLayout.sectionInset = UIEdgeInsetsMake(0, 7, 25, 7);
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"ZDScreenReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ZDScreenReusableView_1"];
    self.screenView.hidden = YES;
    self.trailingLayoutConstraint.constant = 80 -kScreenWidth;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDBuyDetailCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"ZDBuyDetailCell" forIndexPath:indexPath];
    return cell;
}

-  (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)screenAction:(id)sender {
    if ( self.trailingLayoutConstraint.constant == 0) {
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

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 7;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZDScreenCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZDScreenCell" forIndexPath:indexPath];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    CGFloat height =section ==0?162:50;
    return CGSizeMake(kScreenWidth - 80, height);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    CGFloat height = section == 0?0:184;
    return CGSizeMake(kScreenWidth - 80, height);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        NSString *idStr = indexPath.section == 0?@"ZDScreenReusableView_0":@"ZDScreenReusableView_1";
        ZDScreenReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:idStr forIndexPath:indexPath];
        return view;
    }else {
        ZDScreenReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"ZDScreenReusableView_footer" forIndexPath:indexPath];
        return view;
    }
}

@end
