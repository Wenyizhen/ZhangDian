//
//  ZDMainPageController.m
//  Zhangdian
//
//  Created by W z on 2018/12/17.
//  Copyright © 2018 wenyizhen. All rights reserved.
//

#import "ZDMainPageController.h"
#import "SDCycleScrollView.h"
#import "ZDCarouselReusableView.h"
#import "ZDTodayeusableView.h"
#import "ZDGuessReusableView.h"
#import "ZDHomeItemCell.h"
#import "ZDHomeTodayCell.h"
#import "ZDHomeGuessCell.h"
#import "ZDLoginController.h"
@interface ZDMainPageController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ZDMainPageController
#pragma mark - VC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
    // Do any additional setup after loading the view.
}

#pragma mark - Private
- (void)configSubViews {
    [self setNavBgAlpha:0];
    [self.collectionView registerNib:[UINib nibWithNibName:@"ZDCarouselReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ZDCarouselReusableView"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"ZDTodayeusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ZDTodayeusableView"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"ZDGuessReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ZDGuessReusableView"];
    [self contentBehaviorNever:self.collectionView];
}

#pragma mark - CollectionView
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section ==0) {
        return CGSizeMake(95, 95);
    }
    if (indexPath.section == 1) {
        return CGSizeMake(kScreenWidth/3., 70);
    }
    return CGSizeMake(kScreenWidth, 170);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGSizeMake(kScreenWidth, 224);
    }
    if (section == 1) {
        return CGSizeMake(kScreenWidth, 35);
    }
    return CGSizeMake(kScreenWidth, 48+35);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section ==0) {
        return 3;
    }
    if (section == 1) {
        return 9;
    }
    return 5;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        CGFloat w = (kScreenWidth -95*3)/4.;
        return UIEdgeInsetsMake(25, w, 25, w);
    }
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return (kScreenWidth -95*3)/4.;
    }
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        ZDCarouselReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ZDCarouselReusableView" forIndexPath:indexPath];
        return view;
    }
    if (indexPath.section ==1) {
        ZDTodayeusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ZDTodayeusableView" forIndexPath:indexPath];
        return view;
    }
    ZDGuessReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ZDGuessReusableView" forIndexPath:indexPath];
    return view;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        ZDHomeItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZDHomeItemCell" forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.section == 1) {
        ZDHomeTodayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZDHomeTodayCell" forIndexPath:indexPath];
        return cell;
    }
    ZDHomeGuessCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZDHomeGuessCell" forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ZDLoginController *vc = [[UIStoryboard storyboardWithName:@"Login" bundle:nil]instantiateViewControllerWithIdentifier:@"ZDLoginController"];
    [self.navigationController pushViewController:vc animated:YES];
}



@end
