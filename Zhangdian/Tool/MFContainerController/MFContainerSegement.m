//
//  MFContainerSegement.m
//  MotorFans
//
//  Created by LiuFengting on 2017/4/24.
//  Copyright © 2017年 MotorFans, JDD. All rights reserved.
//

#import "MFContainerSegement.h"

static NSString *const MFContainerSegementCellIdentifier = @"MFContainerSegementCellIdentifier";

@interface MFContainerSegement () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIView *indicatorView;
@property (nonatomic, strong) NSArray<UIViewController *> *viewControllers;
@property (nonatomic, strong) NSArray<MFContainerTitleModel *> *dataArray;
@property (nonatomic, strong) id<MFContainerSegementDelegate> delegate;
@property (nonatomic, strong) MFContainerConfig *config;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, strong) NSMutableArray<NSNumber *> *badgeIndexArray;

@end

@implementation MFContainerSegement

- (instancetype)initWithFrame:(CGRect)frame
              viewControllers:(NSArray<UIViewController *> *)viewControllers
                     delegate:(id<MFContainerSegementDelegate>)delegate
                       config:(MFContainerConfig *)config
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
        self.viewControllers = viewControllers;
        self.delegate = delegate;
        self.config = config;

        [self addSubview:self.collectionView];
        self.indicatorView.frame = CGRectMake(0, self.bounds.size.height - config.segementIndicatorHeight, 30, config.segementIndicatorHeight);
        self.indicatorView.backgroundColor = config.segementIndicatorColor;
        self.collectionView.alwaysBounceHorizontal = config.segementEnableScrolling;
        [self.collectionView addSubview:self.indicatorView];

        [self reloadSegementView];
    }
    return self;
}

- (void)reloadSegementView
{
    if (!self.viewControllers || !self.config) {
        return;
    }
    NSMutableArray *array = [NSMutableArray array];
    for (UIViewController *controller in self.viewControllers) {
        MFContainerTitleModel *model = [[MFContainerTitleModel alloc] initWithTitle:controller.title
                                                                          titleFont:[UIFont systemFontOfSize:self.config.segementTitleDefaultFontSize]];
        [array addObject:model];
    }
    self.dataArray = [NSArray arrayWithArray:array];
    [self.collectionView reloadData];
}



- (void)selectIndex:(NSInteger)index animated:(BOOL)animated
{
    CGRect indicatorFrame = [self indicatorFrameForIndex:index];
    if (animated) {
        [UIView animateWithDuration:0.3
                         animations:^{
                             self.indicatorView.frame = indicatorFrame;
                         } completion:^(BOOL finished) {
                             self.selectedIndex = index;
                             [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
                             [self.collectionView reloadData];
                         }];
    }else{
        self.indicatorView.frame = indicatorFrame;
        self.selectedIndex = index;
        [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
        [self.collectionView reloadData];
    }


}

- (void)updateScrollOffsetPercent:(CGFloat)offsetPercent
{
    NSInteger formerIndex = floor(offsetPercent * self.viewControllers.count);
    NSInteger latterIndex = ceil(offsetPercent * self.viewControllers.count);

    if (formerIndex != latterIndex) {
        CGRect formerFrame = [self indicatorFrameForIndex:formerIndex];
        CGRect latterFrame = [self indicatorFrameForIndex:latterIndex];

        CGFloat percent = 0.0;
        CGFloat maxPercent = (self.viewControllers.count - 1.0)/self.viewControllers.count;

        if (offsetPercent < 0.0) {
            percent = (maxPercent - fabs(offsetPercent)) * (self.viewControllers.count);
        }else if (offsetPercent > maxPercent) {
            percent = (offsetPercent - maxPercent) * (self.viewControllers.count);
        }else{
            percent = ((formerIndex/self.viewControllers.count) * 1.0 - offsetPercent) * (self.viewControllers.count * 1.0);



        }


        CGRect rect = CGRectZero;
        rect.origin.x = formerFrame.origin.x + (latterFrame.origin.x - formerFrame.origin.x)*percent;
        rect.origin.y = latterFrame.origin.y;
        rect.size.width = formerFrame.size.width + (latterFrame.size.width - formerFrame.size.width)*percent;
        rect.size.height = formerFrame.size.height + (latterFrame.size.height - formerFrame.size.height)*percent;

        self.indicatorView.frame = rect;
    }
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 0.f;
        layout.minimumInteritemSpacing = 0.f;

        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([MFContainerSegementCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:MFContainerSegementCellIdentifier];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.alwaysBounceHorizontal = YES;
        _collectionView.scrollsToTop = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (UIView *)indicatorView
{
    if (!_indicatorView) {
        _indicatorView = [[UIView alloc]initWithFrame:CGRectZero];
        _indicatorView.backgroundColor = [UIColor redColor];
    }
    return _indicatorView;
}

#pragma mark - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

- (NSInteger )collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake([self itemWidthForIndex:indexPath.item], collectionView.bounds.size.height);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MFContainerSegementCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MFContainerSegementCellIdentifier forIndexPath:indexPath];
    [cell setupWithTitle:self.dataArray[indexPath.row].title
                  config:self.config];
    [cell setSelected:(indexPath.item == self.selectedIndex)];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item != self.selectedIndex && self.delegate && [self.delegate respondsToSelector:@selector(mfContainerSegementDidSelectedIndex:)]) {
        self.selectedIndex = indexPath.item;
        [self.collectionView reloadData];
        [self.delegate mfContainerSegementDidSelectedIndex:indexPath.row];
    }
}

- (CGFloat)itemWidthForIndex:(NSInteger )index
{
    if (self.config.fillSegement) {
        return self.collectionView.bounds.size.width/self.viewControllers.count;
    }else{
        return self.dataArray[index].titleWidth + self.config.segementTitleMargin;
    }
}

- (CGRect)indicatorFrameForIndex:(NSInteger)index
{
    NSInteger realIndex = MIN(MAX(0.0, index), self.viewControllers.count - 1);

    CGFloat x = 0.0;
    CGFloat width = 22;

    for (NSInteger i = 0; i < realIndex; i ++) {
        x += [self itemWidthForIndex:i];
    }

    if (self.config.fillSegement) {
        x += ([self itemWidthForIndex:realIndex]/2.0 - width/2.0);
    }else{
        x += self.config.segementTitleMargin/2.0;
    }

    CGFloat height = self.config.segementIndicatorHeight;
    CGFloat y = self.bounds.size.height - height;

    if (index < 0) {
        x = 0.0;
        width = 0.0;
    }else if (index > self.viewControllers.count - 1) {
        x = self.collectionView.bounds.size.width;
        width = 0.0;
    }

    CGRect rect = CGRectMake(x, y, 22, height);
    return rect;
}

- (NSMutableArray<NSNumber *> *)badgeIndexArray
{
    if (!_badgeIndexArray) {
        _badgeIndexArray = [NSMutableArray array];
    }
    return _badgeIndexArray;
}

- (void)showBadgeToIndex:(NSInteger)index visable:(BOOL)visable
{
    if (visable) {
        [self addBadgeIndex:index];
    }else{
        [self removeBadgeIndex:index];
    }
    [self.collectionView reloadData];
}

- (void)addBadgeIndex:(NSInteger)index
{
    BOOL hasAlready = [self hasBadgeIndex:index];

    if (!hasAlready) {
        [self.badgeIndexArray addObject:[NSNumber numberWithInteger:index]];
    }
}

- (void)removeBadgeIndex:(NSInteger)index
{
    BOOL hasAlready = [self hasBadgeIndex:index];
    if (hasAlready) {
        [self.badgeIndexArray enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.integerValue == index) {
                [self.badgeIndexArray removeObject:obj];
            }
        }];
    }
}

- (BOOL)hasBadgeIndex:(NSInteger)index
{
    BOOL hasAlready = NO;
    for (NSNumber *number in self.badgeIndexArray) {
        if (number.integerValue == index) {
            hasAlready = YES;
        }
    }
    return hasAlready;
}

@end
