//
//  ZDReferenceController.m
//  Zhangdian
//
//  Created by xinmai on 2019/3/3.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDReferenceController.h"
#import "ZDReferenceCell.h"
@interface ZDReferenceController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *jingsuanBtn;
@property (weak, nonatomic) IBOutlet UIButton *yuanpiBtn;

@end

@implementation ZDReferenceController

#pragma mark - VC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
}

#pragma mark - Private

- (void)configSubViews {
    self.title = @"参考价";
    self.tableView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.27].CGColor;
    self.tableView.layer.shadowOffset = CGSizeMake(0,4);
    self.tableView.layer.shadowOpacity = 1;
    self.tableView.layer.shadowRadius = 3;
    self.tableView.layer.borderWidth = 0.7;
    self.tableView.layer.borderColor = [UIColor colorWithRed:201/255.0 green:200/255.0 blue:195/255.0 alpha:1.0].CGColor;
    self.tableView.layer.cornerRadius = 8;
    
    self.jingsuanBtn.selected = YES;
}

#pragma mark - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 57;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDReferenceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZDReferenceCell" forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (IBAction)yuanpiAction:(id)sender {
    self.jingsuanBtn.selected = NO;
    self.yuanpiBtn.selected = YES;
}

- (IBAction)jingsuanAction:(id)sender {
    self.yuanpiBtn.selected = NO;
    self.jingsuanBtn.selected = YES;
}
@end
