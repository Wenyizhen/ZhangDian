//
//  ZDIntrolduceView.m
//  Zhangdian
//
//  Created by xinmai on 2019/2/27.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDIntrolduceView.h"
#import "ZDIntrolduceCell.h"
@interface ZDIntrolduceView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) UICollectionView *collectionView;
@end

@implementation ZDIntrolduceView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.collectionView];
    }
    return self;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayot = [[UICollectionViewFlowLayout alloc]init];
        flowLayot.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayot.itemSize = self.size;
        flowLayot.minimumLineSpacing = 0;
        flowLayot.minimumInteritemSpacing = 0;
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowLayot];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.pagingEnabled = YES;
        [_collectionView registerNib:[UINib nibWithNibName:@"ZDIntrolduceCell" bundle:nil] forCellWithReuseIdentifier:@"ZDIntrolduceCell"];
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZDIntrolduceCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZDIntrolduceCell" forIndexPath:indexPath];
    cell.imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%zd",indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 3) {
        [self removeFromSuperview];
    }
}

@end
