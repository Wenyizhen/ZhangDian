//
//  ZDBuyerController.m
//  Zhangdian
//
//  Created by xinmai on 2019/3/3.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDBuyerController.h"
#import "ZDEmployeeCell.h"
#import "ZDAddEmployeeController.h"
@interface ZDBuyerController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *searchBgView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadingLayout;


@end

@implementation ZDBuyerController

#pragma mark - VC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
}

#pragma mark - Private

- (void)configSubViews {
    self.searchBgView.layer.cornerRadius = 19;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"jiahao"] style:UIBarButtonItemStylePlain target:self action:@selector(addAction:)];
    self.navigationItem.rightBarButtonItem.tintColor = kColor_NavTint;
    self.title = @"收购商";
    [self.tableView registerNib:[UINib nibWithNibName:@"ZDEmployeeCell" bundle:nil] forCellReuseIdentifier:@"ZDEmployeeCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDEmployeeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZDEmployeeCell" forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)addAction:(id)sender {
    ZDAddEmployeeController *vc = kStorySet(@"ZDAddEmployeeController");
    [self.navigationController pushViewController:vc animated:YES];

}

- (IBAction)yuanpiAction:(id)sender {
    self.leadingLayout.constant = (kScreenWidth - 160)/2.;
}

- (IBAction)jiangsuanAction:(id)sender {
    self.leadingLayout.constant = 0;
}


@end
