//
//  ZDPendingController.m
//  Zhangdian
//
//  Created by xinmai on 2019/3/2.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDPendingController.h"
#import "ZDPendingCell.h"
@interface ZDPendingController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *shougouBtn;
@property (weak, nonatomic) IBOutlet UIButton *shouchuBtn;
@property (weak, nonatomic) IBOutlet UIButton *rukuBtn;
@property (weak, nonatomic) IBOutlet UIButton *chukuBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIView *searBgView;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *shougouLabel;
@property (weak, nonatomic) IBOutlet UILabel *shouchuLabel;
@property (weak, nonatomic) IBOutlet UILabel *rukuLabel;
@property (weak, nonatomic) IBOutlet UILabel *chukuLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerX;
@property (weak, nonatomic) IBOutlet UIButton *yuanpiBtn;

@end

@implementation ZDPendingController

#pragma mark - VC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
}

#pragma mark - Private

- (void)configSubViews {
    self.searBgView.layer.cornerRadius = 11.5;
    self.searBgView.layer.borderColor = UIColorHex(0xB5B5B5).CGColor;
    self.searBgView.layer.borderWidth = 0.5
    ;
    
    self.bgView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    self.bgView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.34].CGColor;
    self.bgView.layer.shadowOffset = CGSizeMake(0,5);
    self.bgView.layer.shadowOpacity = 1;
    self.bgView.layer.shadowRadius = 8;
    self.bgView.layer.borderWidth = 0.7;
    self.bgView.layer.borderColor = [UIColor colorWithRed:181/255.0 green:181/255.0 blue:181/255.0 alpha:1.0].CGColor;
    self.bgView.layer.cornerRadius = 12.7;
    self.bgView.clipsToBounds = YES;
    
    self.shougouLabel.text = @"收\n购";
    self.chukuLabel.text = @"出\n库";
    self.rukuLabel.text = @"入\n库";
    self.shouchuLabel.text =@"售\n出";
    self.shougouBtn.selected = YES;
    self.shougouBtn.transform = CGAffineTransformMakeScale(1.42, 1.2);
    
    self.title = @"待处理";

}

#pragma mark - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDPendingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZDPendingCell" forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (IBAction)shougouAction:(id)sender {
    [self btnHandle:sender];
}

- (IBAction)shouchuAction:(id)sender {
    [self btnHandle:sender];
}

- (IBAction)rukuAction:(id)sender {
    [self btnHandle:sender];
}

- (IBAction)chukuAction:(id)sender {
    [self btnHandle:sender];
}

- (IBAction)yuanpiAction:(id)sender {
    self.centerX.constant = 0;
}

- (IBAction)jingsuanAction:(id)sender {
    self.centerX.constant = self.yuanpiBtn.width;
}

- (void)btnHandle:(UIButton *)btn {
    self.shougouBtn.selected = NO;
    self.shougouBtn.transform = CGAffineTransformMakeScale(1, 1);
    self.shouchuBtn.selected = NO;
    self.shouchuBtn.transform = CGAffineTransformMakeScale(1, 1);

    self.rukuBtn.selected = NO;
    self.rukuBtn.transform = CGAffineTransformMakeScale(1, 1);

    self.chukuBtn.selected = NO;
    self.chukuBtn.transform = CGAffineTransformMakeScale(1, 1);

    
    btn.selected = YES;
    btn.transform = CGAffineTransformMakeScale(1.42, 1.2);
}
@end
