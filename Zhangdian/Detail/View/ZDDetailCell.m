//
//  ZDDetailCell.m
//  Zhangdian
//
//  Created by xinmai on 2019/1/27.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDDetailCell.h"
#import "ZDDetailCollectionCell.h"

@implementation ZDDetail
- (IBAction)waitBtn:(id)sender {
}

- (instancetype)initWithImg:(NSString *)img str:(NSString *)str {
    self = [super init];
    if (self) {
        self.img = img;
        self.str = str;
    }
    return self;
}

@end

@interface ZDDetailCell()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (strong, nonatomic) NSArray *arr;
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
    return self.arr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZDDetailCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZDDetailCollectionCell" forIndexPath:indexPath];
    ZDDetail *m = self.arr[indexPath.row];
    cell.titleLabel.text = m.img;
    cell.imgView.image = [UIImage imageNamed:m.str];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.selectedBlock) {
        self.selectedBlock(indexPath.row);
    }
}

- (void)setRow:(NSInteger)row {
    _row = row;
    if (row ==0) {
        self.arr = @[[[ZDDetail alloc]initWithImg:@"收购明细" str:@"shougoumingxi"],
                     [[ZDDetail alloc]initWithImg:@"出售明细" str:@"chushoumingxi"],
                     [[ZDDetail alloc]initWithImg:@"余货明细" str:@"yuhuomingxi"],
                     [[ZDDetail alloc]initWithImg:@"利润信息" str:@"lirunxinxi"],
                     [[ZDDetail alloc]initWithImg:@"每日报表" str:@"meiribaobiao"],
                     [[ZDDetail alloc]initWithImg:@"财务统计" str:@"caiwutongji"]
                     ];
        self.waitBtn.hidden = YES;

    }else {
        self.arr = @[[[ZDDetail alloc]initWithImg:@"收购明细" str:@"chushoumingxilv"],
                     [[ZDDetail alloc]initWithImg:@"出售明细" str:@"chushou"],
                     [[ZDDetail alloc]initWithImg:@"余货明细" str:@"yuhuo"],
                     [[ZDDetail alloc]initWithImg:@"利润信息" str:@"lirun"],
                     [[ZDDetail alloc]initWithImg:@"每日报表" str:@"lan"],
                     [[ZDDetail alloc]initWithImg:@"财务统计" str:@"caiwu"]
                     ];
        self.waitBtn.hidden = NO;
    }
}
- (IBAction)waitAction:(id)sender {
    if (self.selectedBlock) {
        self.selectedBlock(-1);
    }
}

@end
