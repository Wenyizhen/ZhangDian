//
//  ZDEmployeeController.m
//  Zhangdian
//
//  Created by xinmai on 2019/2/24.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDEmployeeController.h"
#import "ZDEmployeeCell.h"
#import "ZDAddEmployeeController.h"
@interface ZDEmployeeController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *searchBgView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ZDEmployeeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"ZDEmployeeCell" bundle:nil] forCellReuseIdentifier:@"ZDEmployeeCell"];
    self.searchBgView.layer.cornerRadius = 19;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"jiahao"] style:UIBarButtonItemStylePlain target:self action:@selector(addAction:)];
    self.navigationItem.rightBarButtonItem.tintColor = kColor_NavTint;
    self.title = @"员工设置";
    // Do any additional setup after loading the view.
}

- (IBAction)stopAction:(id)sender {
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
@end
