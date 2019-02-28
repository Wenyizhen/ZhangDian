//
//  ZDDetailCell.m
//  Zhangdian
//
//  Created by xinmai on 2019/1/27.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDDetailCell.h"
#import "ZDDetailCollectionCell.h"
@interface ZDDetailCell()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@end

@implementation ZDDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.flowLayout.minimumLineSpacing = 0;
    self.flowLayout.minimumInteritemSpacing =0;
    self.flowLayout.itemSize = CGSizeMake((kScreenWidth -88)/4., 75);
    self.collectionView.scrollEnabled = NO;
    self.bgView.layer.shadowColor = [UIColor colorWithRed:4/255.0 green:4/255.0 blue:4/255.0 alpha:0.1].CGColor;
    self.bgView.layer.shadowOffset = CGSizeMake(1,1);
    self.bgView.layer.shadowOpacity = 1;
    self.bgView.layer.shadowRadius = 13;
    self.bgView.layer.cornerRadius = 6.7;

    // Initialization code
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZDDetailCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZDDetailCollectionCell" forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.selectedBlock) {
        self.selectedBlock(indexPath.row);
    }
}

@end
