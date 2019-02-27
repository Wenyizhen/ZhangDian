//
//  ZDWarehouseController.m
//  Zhangdian
//
//  Created by xinmai on 2019/2/27.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDWarehouseController.h"
#import "ZDYPSGCell.h"
@interface ZDWarehouseController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *footerBgView;

@end

@implementation ZDWarehouseController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
    // Do any additional etup after loading the view.
}

- (void)configSubViews {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"jiahao"] style:UIBarButtonItemStylePlain target:self action:@selector(addAction:)];
    self.navigationItem.rightBarButtonItem.tintColor = UIColorHex(0x060606);
    self.title = @"选择仓库号";
    
    self.footerBgView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.18].CGColor;
    self.footerBgView.layer.shadowOffset = CGSizeMake(0,2);
    self.footerBgView.layer.shadowOpacity = 1;
    self.footerBgView.layer.shadowRadius = 4;
    self.footerBgView.layer.borderWidth = 0.7;
    self.footerBgView.layer.borderColor = [UIColor colorWithRed:191/255.0 green:193/255.0 blue:193/255.0 alpha:1.0].CGColor;
    self.footerBgView.layer.cornerRadius = 13.7;

}

- (void)addAction:(id)sender {
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDYPSGCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZDYPSGCell" forIndexPath:indexPath];
    cell.titleLabel.text = @"有个仓库";
    return cell;
}
@end
