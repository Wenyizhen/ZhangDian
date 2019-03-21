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
    
    RACSignal *signalLogin = [[self.phoneTF.rac_textSignal merge:RACObserve(self.phoneTF, text)]
                         map:^id _Nullable(id  _Nullable value) {
                             NSString *phone = (NSString *)value;
                             return @(phone.length == 11);
                         }];
    RAC(self.nextBtn,enabled) = signalLogin;
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
    vc.strPhone = _phoneTF.text;
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
