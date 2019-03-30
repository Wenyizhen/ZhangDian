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
#import "ZDGoodsDetailController.h"
#import "ZDTallyController.h"
#import "ZDPendingController.h"
#import "ZDReferenceController.h"
#import "ZDMainPort.h"
#import "ZDMainGuessPort.h"

@interface ZDMainPageController ()
<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property(nonatomic,strong) __block NSMutableArray *arrMain;
@property(nonatomic,copy) __block NSString *strUpdateDate;
@property(nonatomic,strong) __block NSMutableArray *arrGuess;

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
    [self fetchMainData];
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
    switch (section) {
        case 0:return 3;break;
        case 1:return _arrMain.count;break;
        case 2:return _arrGuess.count;break;
        default:return 0;break;
    }
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
        [view setUpdateDate:_strUpdateDate];
        return view;
    }
    ZDGuessReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ZDGuessReusableView" forIndexPath:indexPath];
    return view;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:{
            ZDHomeItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZDHomeItemCell" forIndexPath:indexPath];
            NSString *str = indexPath.row == 0?@"daichuli":(indexPath.row ==1?@"jizhangben":@"cankaojia");
            cell.imgView.image = [UIImage imageNamed:str];
            return cell;
        }break;
        case 1:{
            ZDHomeTodayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZDHomeTodayCell" forIndexPath:indexPath];
            if (indexPath.row < _arrMain.count) {
                [cell setHomeTodayDict:_arrMain[indexPath.row]];
            }
            return cell;
        }break;
        case 2:{
            ZDHomeGuessCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZDHomeGuessCell" forIndexPath:indexPath];
            [cell setMainGuessPort:_arrGuess[indexPath.row]];
            return cell;
        }break;
        default:
            return nil;
            break;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section ==0) {
        if (indexPath.row == 0) {
            ZDPendingController *vc = kStoryDetail(@"ZDPendingController");
            [self.navigationController pushViewController:vc animated:YES];
        }
        if (indexPath.row == 1) {
            ZDTallyController *vc = kStoryMain(@"ZDTallyController");
            [self.navigationController pushViewController:vc animated:YES];
        }
        if (indexPath.row == 2) {
            ZDReferenceController *vc = kStoryMain(@"ZDReferenceController");
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    if (indexPath.section == 1) {
        ZDLoginController *vc = kStoryLogin(@"ZDLoginController");
        ZDNavigationController *nav = [[ZDNavigationController alloc]initWithRootViewController:vc];
        [self presentViewController:nav animated:YES completion:nil];
    }
    if (indexPath.section == 2) {
        ZDGoodsDetailController *vc = kStoryMain(@"ZDGoodsDetailController");
        [self.navigationController pushViewController:vc animated:YES];
    }
}


#pragma mark - network
- (void)fetchMainData{
    @weakify(self);
    ZDProgressToast(@"正在查询数据...");
    [ZDMainPort fetchMainInfoWithSuccess:^(NSArray * _Nonnull arr, NSString * _Nonnull strDate) {
        @strongify(self);
        ZDDismissToast;
        [self fetchMainGuess:YES];
        self.arrMain = [arr mutableCopy];
        self.strUpdateDate = strDate;
        [self.collectionView reloadData];
    } fail:^(NSError * _Nonnull error) {
        ZDFailToast(error.domain);
        ZDDismissToast;
    }];
}

- (void)fetchMainGuess:(BOOL)isFirst{
    @weakify(self);
    if (isFirst) {
        _arrGuess = [NSMutableArray array];
    }
    [ZDMainGuessPort fetchMainGuessWithFirst:isFirst
                                     success:^(NSArray * _Nonnull arrList, BOOL isHaveMore) {
                                         @strongify(self);
                                         [self.arrGuess addObjectsFromArray:arrList];
                                         [self.collectionView reloadData];
                                     } fail:^(NSError * _Nonnull error) {
                                         ZDFailToast(error.domain);
                                     }];
}


@end
