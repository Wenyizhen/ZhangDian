//
//  ZDLoginController.m
//  Zhangdian
//
//  Created by xinmai on 2019/2/17.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDLoginController.h"
#import "ZDCodeLoginController.h"
#import "ZDLoginPort.h"

@interface ZDLoginController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *codeTF;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIButton *securityBtn;

@end

@implementation ZDLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
    // Do any additional setup after loading the view.
}


- (void)configSubViews {
//    UIButton *btnClose = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btnClose setImage:[UIImage imageNamed:@"guanbi"] forState:UIControlStateNormal];
//    btnClose.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    btnClose.size = CGSizeMake(30, 30);
//    @weakify(self);
//    [[btnClose rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
//        @strongify(self);
//        [self dismissViewControllerAnimated:YES completion:nil];
//    }];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btnClose];
    self.loginBtn.layer.cornerRadius = 23;
    self.registerBtn.layer.cornerRadius = 23;
    [self setNavBgAlpha:0];
    self.codeTF.secureTextEntry = YES;
}

- (IBAction)clearAction:(id)sender {
    self.phoneTF.text =@"";
}

- (IBAction)securityAction:(id)sender {
    self.securityBtn.selected = !self.securityBtn.selected;
    self.codeTF.secureTextEntry = !self.securityBtn.selected;
}

- (IBAction)qqAction:(id)sender {
}

- (IBAction)messageAction:(id)sender {
    
    ZDCodeLoginController *vc =  kStoryLogin(@"ZDCodeLoginController");
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)wechatAction:(id)sender {
}

- (IBAction)forgetAction:(id)sender {
}

- (IBAction)didPressedLogin:(id)sender {
    [ZDLoginPort fetchLogin:_phoneTF.text pwd:_codeTF.text success:^(id  _Nonnull obejct) {
        [[NSNotificationCenter defaultCenter]postNotificationName:NSNotification_LoginSuccess object:nil];
        [ZDToast showSuccessWithMessage:@"登录成功!"];
    } fail:^(NSError * _Nonnull error) {
        [ZDToast showFailWithMessage:@"登录失败!"];
    }];
}

@end
