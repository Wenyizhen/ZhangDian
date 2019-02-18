//
//  ZDLoginController.m
//  Zhangdian
//
//  Created by xinmai on 2019/2/17.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDLoginController.h"
#import "ZDCodeLoginController.h"
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
    self.loginBtn.layer.cornerRadius = 23;
    self.registerBtn.layer.cornerRadius = 23;
    [self setNavHidden:YES];
    self.codeTF.secureTextEntry = YES;
    
    __weak typeof(self) weakSelf = self;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithActionBlock:^(id  _Nonnull sender) {
        [weakSelf.view endEditing:YES];
    }];
    [self.view addGestureRecognizer:tap];
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
    ZDCodeLoginController *vc =  [[UIStoryboard storyboardWithName:@"Login" bundle:nil]instantiateViewControllerWithIdentifier:@"ZDCodeLoginController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)wechatAction:(id)sender {
}

- (IBAction)forgetAction:(id)sender {
}

@end
