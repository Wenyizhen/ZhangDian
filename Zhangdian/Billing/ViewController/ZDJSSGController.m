//
//  ZDJSSGController.m
//  Zhangdian
//
//  Created by xinmai on 2019/2/27.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDJSSGController.h"
#import "ZDJSSGCell.h"
@interface ZDJSSGController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *headerBgView;
@property (weak, nonatomic) IBOutlet UIButton *printBtn;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerXConstraint;
@property (assign, nonatomic) CGFloat btnW;
@end

@implementation ZDJSSGController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
    // Do any additional setup after loading the view.
}

- (void)configSubViews {
    self.title = @"净蒜收购";
    self.headerBgView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.09].CGColor;
    self.headerBgView.layer.shadowOffset = CGSizeMake(2,4);
    self.headerBgView.layer.shadowOpacity = 1;
    self.headerBgView.layer.shadowRadius = 7;
    self.headerBgView.layer.borderWidth = 0.3;
    self.headerBgView.layer.borderColor = [UIColor colorWithRed:215/255.0 green:213/255.0 blue:213/255.0 alpha:1.0].CGColor;
    self.headerBgView.layer.cornerRadius = 8.3;
    [self.printBtn.layer setCornerRadius:24.];
    [self.saveBtn.layer setCornerRadius:24.];
    self.btnW = (kScreenWidth - 90)/4.;
}
- (IBAction)printAction:(id)sender {
}
- (IBAction)saveAction:(id)sender {
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDJSSGCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZDJSSGCell" forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (IBAction)hexiAction:(id)sender {
    self.centerXConstraint.constant = 0;
}
- (IBAction)dianjianAction:(id)sender {
    self.centerXConstraint.constant = self.btnW;
}
- (IBAction)meijianAction:(id)sender {
    self.centerXConstraint.constant = 2*self.btnW;
}
- (IBAction)lingtouAction:(id)sender {
    self.centerXConstraint.constant = 3*self.btnW;
}
@end
