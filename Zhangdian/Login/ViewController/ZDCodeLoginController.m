//
//  ZDCodeLoginController.m
//  Zhangdian
//
//  Created by xinmai on 2019/2/17.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDCodeLoginController.h"
#import "ZDReceiveCodeController.h"
@interface ZDCodeLoginController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@end

@implementation ZDCodeLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
    // Do any additional setup after loading the view.
}

- (void)configSubViews {
    self.nextBtn.layer.cornerRadius = 23;
    [self setNavBgAlpha:0];
    
    __weak typeof(self) weakSelf = self;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithActionBlock:^(id  _Nonnull sender) {
        [weakSelf.view endEditing:YES];
    }];
    [self.view addGestureRecognizer:tap];
}

- (IBAction)clearAction:(id)sender {
    self.phoneTF.text =@"";
}


- (IBAction)qqAction:(id)sender {
}

- (IBAction)wechatAction:(id)sender {
}

- (IBAction)nextAction:(id)sender {
    ZDReceiveCodeController *vc = kStoryLogin(@"ZDReceiveCodeController");
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)policyAction:(id)sender {
}

- (IBAction)clauseAction:(id)sender {
}

- (IBAction)userPasswordAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
