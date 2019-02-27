//
//  ZDPublishView.m
//  Zhangdian
//
//  Created by xinmai on 2019/2/24.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDPublishView.h"
#import "ZDPublishCollectionCell.h"
#import "ZDJSSGController.h"
#import "ZDYPSGController.h"
@interface ZDPublishView ()<UICollectionViewDelegate,UICollectionViewDataSource,UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionViewFlowLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *spaceLayoutConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionHConstraint;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *weekLabel;
@property (strong, nonatomic) NSArray *arr;
@end
@implementation ZDPublishView
- (void)awakeFromNib {
    [super awakeFromNib];
    self.alpha = 0;
    
    NSCalendar *calendar= [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
    self.dayLabel.text = [NSString stringWithFormat:@"%zd",components.day];
    self.weekLabel.text = [NSString stringWithFormat:@"%@\n/\n%zd-%2zd",[self weekDayStr:components.weekday],components.year,components.month];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"ZDPublishCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"ZDPublishCollectionCell"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionViewFlowLayout.itemSize = CGSizeMake((kScreenWidth-80)/4., self.collectionHConstraint.constant/2.);
    self.collectionViewFlowLayout.minimumLineSpacing = 0;
    self.collectionViewFlowLayout.minimumInteritemSpacing = 0;
    self.arr = @[@"jssg",@"ypsg",@"jscs",@"ypcs",@"jsrk",@"yprk",@"jsck",@"ypck"];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissAction:)];
    tap.delegate = self;
    [self addGestureRecognizer:tap];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    CGPoint point = [gestureRecognizer locationInView:self];
    if (CGRectContainsPoint(self.collectionView.frame, point)) {
        return NO;
    }
    return YES;
}

- (NSString *)weekDayStr:(NSInteger)day {
    switch (day) {
        case 1:
            return @"星期一";
            break;
        case 2:
            return @"星期二";
            break;
        case 3:
            return @"星期三";
            break;
        case 4:
            return @"星期四";
            break;
        case 5:
            return @"星期五";
            break;
        case 6:
            return @"星期六";
            break;
        default:
            return @"星期日";
            break;
    }
}
- (void)show {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.frame = window.bounds;
    [window addSubview:self];
    
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = self.frame;
    [self insertSubview:effectView atIndex:0];
    [self layoutIfNeeded];
    self.spaceLayoutConstraint.constant = 60;
    [UIView animateWithDuration:.5 delay:0 usingSpringWithDamping:0.65 initialSpringVelocity:0 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
    }];
    
    [UIView animateWithDuration:.5 animations:^{
        self.alpha = 1;
    }];
}

- (IBAction)dismissAction:(id)sender {
    self.spaceLayoutConstraint.constant = -280;
    [UIView animateWithDuration:.2 animations:^{
        [self layoutIfNeeded];
        self.alpha = 0;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *imgStr = self.arr[indexPath.row];
    ZDPublishCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZDPublishCollectionCell" forIndexPath:indexPath];
    cell.imgView.image = [UIImage imageNamed:imgStr];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    self.arr = @[@"jssg",@"ypsg",@"jscs",@"ypcs",@"jsrk",@"yprk",@"jsck",@"ypck"];
    [self removeFromSuperview];
    NSString *str = [self.arr objectAtIndex:indexPath.row];
    UIViewController *vc = nil;
    if ([str isEqualToString:@"jssg"]) {
        vc = kStoryBilling(@"ZDJSSGController");
    }else if ([str isEqualToString:@"ypsg"]){
        vc = kStoryBilling(@"ZDYPSGController");
    }else if ([str isEqualToString:@"jscs"]) {
        
    }
    UIViewController *currentVc = [UIViewController currentViewController];
    if (vc)
        [currentVc.navigationController pushViewController:vc animated:YES];
}

@end
