//
//  ZDEverydayController.m
//  Zhangdian
//
//  Created by xinmai on 2019/3/2.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDEverydayController.h"
#import "ZDCardCollectionFlowLayout.h"
#import "ZDEveryDayCell.h"

@interface ZDEverydayController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet ZDCardCollectionFlowLayout *flowLayout;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;
@property (assign, nonatomic) NSInteger currentRow;
@property (strong, nonatomic) NSMutableArray *arr;

@end

@implementation ZDEverydayController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
}

#pragma mark - Private

- (void)configSubViews {
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self.arr addObjectsFromArray:@[@"a",@"b",@"c",@"d",@"e",@"f",@"g"]];
}

- (NSMutableArray *)arr {
    if (!_arr) {
        _arr = [NSMutableArray array];
    }
    return _arr;
}

#pragma mark - CollectionView

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arr.count;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 45;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(kScreenWidth - 70*2, 400);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZDEveryDayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZDEveryDayCell" forIndexPath:indexPath];
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGPoint pInView = [self.view convertPoint:self.collectionView.center toView:self.collectionView];
    NSIndexPath *indexPathNow = [self.collectionView indexPathForItemAtPoint:pInView];
    NSLog(@"------%zd",indexPathNow.row);
    self.currentRow = indexPathNow.row;
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    CGPoint pInView = [self.view convertPoint:self.collectionView.center toView:self.collectionView];
    NSIndexPath *indexPathNow = [self.collectionView indexPathForItemAtPoint:pInView];
    NSLog(@"------%zd",indexPathNow.row);
    self.currentRow = indexPathNow.row;
}

- (IBAction)leftAction:(id)sender {
    NSInteger row = self.currentRow > 0?self.currentRow - 1:0;
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}

- (IBAction)rightAction:(id)sender {
    NSInteger row = self.currentRow < self.arr.count-1?self.currentRow + 1:self.arr.count - 1;
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];

}


@end
