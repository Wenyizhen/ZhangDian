//
//  ZDPriceController.m
//  Zhangdian
//
//  Created by xinmai on 2019/3/3.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDPriceController.h"
#import "ZDPriceCell.h"
@interface ZDPriceController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;



@end

@implementation ZDPriceController
#pragma mark - VC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
}

#pragma mark - Private

- (void)configSubViews {
    self.title = @"单价预设";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(doneAction:)];
    self.navigationItem.rightBarButtonItem.tintColor = kColor_NavTint;
    self.btn1.selected = YES;
    
    self.tableView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.27].CGColor;
    self.tableView.layer.shadowOffset = CGSizeMake(0,4);
    self.tableView.layer.shadowOpacity = 1;
    self.tableView.layer.shadowRadius = 3;
    self.tableView.layer.borderWidth = 0.7;
    self.tableView.layer.borderColor = [UIColor colorWithRed:201/255.0 green:200/255.0 blue:195/255.0 alpha:1.0].CGColor;
    self.tableView.layer.cornerRadius = 8;
}

- (void)doneAction:(id)sender {
    
}


#pragma mark - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDPriceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZDPriceCell" forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (IBAction)price1Action:(id)sender {
    [self btnHandel:sender];
}

- (IBAction)price2Action:(id)sender {
    [self btnHandel:sender];
}

- (IBAction)price3Action:(id)sender {
    [self btnHandel:sender];
}

- (void)btnHandel:(UIButton *)btn {
    self.btn1.selected = NO;
    self.btn2.selected = NO;
    self.btn3.selected = NO;
    btn.selected = YES;
}

@end
