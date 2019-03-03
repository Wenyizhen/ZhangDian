//
//  ZDEveryController.m
//  Zhangdian
//
//  Created by xinmai on 2019/3/3.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDEveryController.h"
#import "ZDEveryCell.h"
@interface ZDEveryController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ZDEveryController

#pragma mark - VC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
}

#pragma mark - Private

- (void)configSubViews {
    self.title = @"每件重量";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(doneAction:)];
    self.navigationItem.rightBarButtonItem.tintColor = kColor_NavTint;
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
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDEveryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZDEveryCell" forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"%zd",10*indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
