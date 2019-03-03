//
//  ZDFormsController.m
//  Zhangdian
//
//  Created by W z on 2018/12/17.
//  Copyright © 2018 wenyizhen. All rights reserved.
//

#import "ZDFormsController.h"
#import "JXCircleRatioView.h"
#import "ZDShareController.h"
#import "ZDFormsCell.h"
@interface ZDFormsController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *jiangsuanBtn;
@property (weak, nonatomic) IBOutlet UIButton *yuanpiBtn;
@property (weak, nonatomic) IBOutlet UIButton *shaixuanBtn;
@property (weak, nonatomic) IBOutlet UILabel *shougoushangLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *shougouLabel;
@property (weak, nonatomic) IBOutlet UILabel *shouchuLabel;
@property (weak, nonatomic) IBOutlet UILabel *yuhuoLabel;
@property (weak, nonatomic) IBOutlet UIView *circleBgView;
@property (weak, nonatomic) IBOutlet UILabel *centerNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *centerTypeLabel;

@property (strong, nonatomic) JXCircleRatioView *circleView;

@property (strong, nonatomic) NSArray *colorArr;
@property (strong, nonatomic) NSMutableArray *circleArr;


@end

@implementation ZDFormsController
#pragma mark - VC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
}

#pragma mark - Private

- (void)configSubViews {
    self.title = @"报表";
    for (NSInteger i = 0; i<5; i ++) {
        JXCircleModel *model = [[JXCircleModel alloc]init];
        model.color = [self getColorIndexPath:i];
        model.name = [NSString stringWithFormat:@"%.1f公分",i*1.0];
        model.number = @"25%";
        [self.circleArr addObject:model];
    }
    CGRect rect = CGRectMake(0, 0, kScreenWidth, 250);
    self.circleView = [[JXCircleRatioView alloc]initWithFrame:rect andDataArray:self.circleArr CircleRadius:85];
    self.circleView.center = CGPointMake(kScreenWidth/2., self.circleView.height/2.+10);
    [self.circleBgView addSubview:self.circleView];
    self.jiangsuanBtn.selected = YES;
}

- (NSArray *)colorArr {
    if (!_colorArr) {
        _colorArr = @[UIColorHex(0xD66336),UIColorHex(0x1AB395),UIColorHex(0x2183C5),UIColorHex(0x7A74D3),UIColorHex(0xDA8BEE),UIColorHex(0xFFD10F)];
    }
    return _colorArr;
}

- (NSMutableArray *)circleArr {
    if (! _circleArr) {
        _circleArr = [NSMutableArray array];
    }
    return _circleArr;
}

- (UIColor *)getColorIndexPath:(NSInteger)row {
    NSInteger i = row%self.colorArr.count;
    return self.colorArr[i];
}

#pragma mark - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 85;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDFormsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZDFormsCell" forIndexPath:indexPath];
    cell.progressView.tintColor = [self getColorIndexPath:indexPath.row];
    cell.progressView.progress = 0.5;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}



- (IBAction)jingsuanAction:(id)sender {
    self.jiangsuanBtn.selected = YES;
    self.yuanpiBtn.selected = NO;
}

- (IBAction)yuanpiAction:(id)sender {
    self.yuanpiBtn.selected = YES;
    self.jiangsuanBtn.selected = NO;
}

- (IBAction)filterAction:(id)sender {
}

- (IBAction)shareAction:(id)sender {
    ZDShareController * vc = kStoryForms(@"ZDShareController");
    [self.navigationController pushViewController:vc animated:YES];
}




@end
