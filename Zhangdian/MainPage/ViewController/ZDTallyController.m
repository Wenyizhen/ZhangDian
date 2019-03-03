//
//  ZDTallyController.m
//  Zhangdian
//
//  Created by xinmai on 2019/3/3.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDTallyController.h"
#import "ZDTallyHeader.h"
#import "ZDTallyCell.h"
@interface ZDTallyController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIDatePicker *datePicker;
@end

@implementation ZDTallyController

#pragma mark - VC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
}

#pragma mark - Private

- (void)configSubViews {
    self.title = @"记账本";
    
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    //设置地区: zh-中国
    datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker setDate:[NSDate date] animated:YES];
    [datePicker setMaximumDate:[NSDate date]];
    //监听DataPicker的滚动
    [datePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    
    self.datePicker = datePicker;
    self.datePicker.backgroundColor = [UIColor.grayColor colorWithAlphaComponent:.6];
    [self.view addSubview:self.datePicker];
    [self.datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
    }];
    self.datePicker.hidden = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(datePickerHandle)];
    [self.view addGestureRecognizer:tap];
}

- (void)dateChange:(UIDatePicker *)datePicker {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    //设置时间格式
    formatter.dateFormat = @"yyyy年 MM月 dd日";
    NSString *dateStr = [formatter  stringFromDate:datePicker.date];
}

#pragma mark - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDTallyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZDTallyCell" forIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 36;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ZDTallyHeader *view = [[NSBundle mainBundle]loadNibNamed:@"ZDTallyHeader" owner:nil options:nil].firstObject;
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (IBAction)dateAction:(id)sender {
    [self datePickerHandle];
}

- (void)datePickerHandle {
    if (self.datePicker.hidden == YES) {
        self.datePicker.hidden = NO;
        CATransition *transition = [[CATransition alloc]init];
        transition.duration = .1;
        transition.subtype = kCATransitionFromTop;
        transition.type = kCATransitionMoveIn;
        [self.datePicker.layer addAnimation:transition forKey:@"transition"];
    }else {
        self.datePicker.hidden = YES;
    }
}

@end
