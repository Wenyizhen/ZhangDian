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
#import "ZDTotalController.h"
#import "ZDPurchasezDetailPort.h"

@interface ZDBuyDetailController ()
<
UITableViewDelegate,
UITableViewDataSource,
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
>

@property (weak, nonatomic) IBOutlet UIView *screenView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionViewFlowLayout;
@property (weak, nonatomic) IBOutlet UIView *headerBgView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *trailingLayoutConstraint;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *tapView;
@property (weak, nonatomic) IBOutlet UILabel *lblAvgWeight;
@property (weak, nonatomic) IBOutlet UILabel *lblAvgAmount;
@property (weak, nonatomic) IBOutlet UILabel *lblAvgPrice;

@property(nonatomic,strong) NSMutableArray *arrList;
@property(nonatomic,copy) NSString *strBeginTime;
@property(nonatomic,copy) NSString *strEndTime;
@property(nonatomic,copy) NSString *strCompany;
@property(nonatomic,copy) NSString *strGarlicID;
@property(nonatomic,assign) CGFloat fMaxPrice;
@property(nonatomic,assign) CGFloat fMinPrice;
@property(nonatomic,copy) NSString *strWarehouseID;

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
    self.headerBgView.backgroundColor = [UIColor.whiteColor colorWithAlphaComponent:.85];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"shaixuan"] style:UIBarButtonItemStylePlain target:self action:@selector(screenAction:)];
    self.navigationItem.rightBarButtonItem.tintColor = kColor_NavTint;
    
    self.collectionViewFlowLayout.minimumInteritemSpacing = 7;
    self.collectionViewFlowLayout.itemSize =CGSizeMake((kScreenWidth - 80 - 4*7)/3., 41);
    self.collectionViewFlowLayout.sectionInset = UIEdgeInsetsMake(0, 7, 25, 7);
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"ZDScreenReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ZDScreenReusableView_1"];
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
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, -400, self.view.width, 400)];
    view.backgroundColor = kColor_NavBg;
    [self.tableView addSubview:view];
    
    switch (self.type) {
        case DetailType_yuanpi_chushou:{
            self.title = @"原皮出售明细";
        }
            break;
        case DetailType_yuanpi_shougou:{
            self.title = @"原皮收购明细";
        }
            break;
        case DetailType_jingsuan_chushou:{
            self.title = @"净蒜出售明细";
        }
            break;
        case DetailType_jingsuan_shougou:{
            self.title = @"净蒜收购明细";
        }
            break;
        default:
            break;
    }
    [self fetchPurchaseDetail:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDBuyDetailCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"ZDBuyDetailCell" forIndexPath:indexPath];
    if (indexPath.row < _arrList.count) {
        [cell setPurchaseDetail:_arrList[indexPath.row]];
    }
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

- (IBAction)resetAction:(id)sender {
}

- (IBAction)confirmAction:(id)sender {
}

- (IBAction)totalAction:(id)sender {
    ZDTotalController *vc = kStoryDetail(@"ZDTotalController");
    switch (self.type) {
        case DetailType_yuanpi_chushou:{
            vc.title = @"原皮出售明细";
        }
            break;
        case DetailType_yuanpi_shougou:{
            vc.title = @"原皮收购明细";
        }
            break;
        case DetailType_jingsuan_chushou:{
            vc.title = @"净蒜出售明细";
        }
            break;
        case DetailType_jingsuan_shougou:{
            vc.title = @"净蒜收购明细";
        }
            break;
        default:
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma mark - network
- (void)fetchPurchaseDetail:(BOOL)_isFirst{
    if (_isFirst) {
        _arrList = [NSMutableArray array];
    }
    @weakify(self);
    ZDProgressToast(@"正在查询数据...");
    if (_type == DetailType_yuanpi_shougou || _type == DetailType_yuanpi_chushou) {
        _strWarehouseID = nil;
    }
    
    [ZDPurchasezDetailPort fetchPurchaseDetailWithFirst:_isFirst
                                              fetchEnum:(FetchDetail_Enum)_type
                                              beginTime:_strBeginTime
                                                endTime:_strEndTime
                                             garlicName:_strCompany
                                               garlicID:_strGarlicID
                                               minPrice:_fMinPrice
                                               maxPrice:_fMaxPrice
                                            warehouseID:_strWarehouseID
                                                success:^(NSArray * _Nonnull arrList, BOOL isHaveMore) {
                                                    @strongify(self);
                                                    [self.arrList addObjectsFromArray:arrList];
                                                    [self.tableView reloadData];
                                                    
                                                    if (self.arrList.count > 0) {
                                                        ZDPurchasezDetailPort *detailModel = self.arrList[0];
                                                        dispatch_async(dispatch_get_main_queue(), ^{
                                                            @strongify(self);
                                                            self.lblAvgWeight.text = [NSString stringWithFormat:@"%zd",detailModel.totalWeight.integerValue];
                                                            self.lblAvgAmount.text = [NSString stringWithFormat:@"%zd",detailModel.totalAmount.integerValue];
                                                            self.lblAvgPrice.text = [NSString stringWithFormat:@"%0.2f",detailModel.avgPrice.floatValue];
                                                        });
                                                    }
                                                    ZDDismissToast;
                                                }
                                                   fail:^(NSError * _Nonnull error) {
                                                       ZDFailToast(error.domain);
                                                       ZDDismissToast;
                                                   }];
}

@end
