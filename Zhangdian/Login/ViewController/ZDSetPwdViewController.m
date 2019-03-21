//
//  ZDSetPwdViewController.m
//  Zhangdian
//
//  Created by beice on 2019/3/19.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDSetPwdViewController.h"
#import "ZDRegisterPort.h"
#import "ZDLoginPort.h"

@interface ZDSetPwdViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textFieldPwd;
@property (weak, nonatomic) IBOutlet UIButton *btnSubmit;
@property (weak, nonatomic) IBOutlet UIButton *btnEye;

@end

@implementation ZDSetPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createBaseView];
    [self loadDefaultData];
}

- (void)createBaseView{
    self.title = @"设置登录密码";
    [self setNavBgAlpha:0];
    self.btnSubmit.layer.cornerRadius = 23;
}

- (void)loadDefaultData{
    [self setSignalEvent];
}

#pragma mark - event
- (void)setSignalEvent{
    RACSignal *signalPwd = [[self.textFieldPwd.rac_textSignal merge:RACObserve(self.textFieldPwd, text)]
                              map:^id _Nullable(id  _Nullable value) {
                                  NSString *pwd = (NSString *)value;
                                  return @(pwd.length >= 8 && pwd.length <= 20);
                              }];
    RAC(self.btnSubmit,enabled) = signalPwd;
    @weakify(self);
    [[self.btnSubmit rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(__kindof UIControl * _Nullable x) {
         @strongify(self);
         [self fetchRegister];
     }];
}

- (IBAction)securityAction:(id)sender {
    self.btnEye.selected = !self.btnEye.selected;
    self.textFieldPwd.secureTextEntry = !self.btnEye.selected;
}


#pragma mark - network
- (void)fetchRegister{
    @weakify(self);
    [ZDRegisterPort fetchAuthCode:_strPhone
                              pwd:_textFieldPwd.text
                         authCode:[_strCode uppercaseString]
                          success:^(id  _Nonnull obejct) {
                              @strongify(self);
                              [self fetchLogin];
                          } fail:^(NSError * _Nonnull error) {
                              NSLog(@"注册失败");
                          }];
}

- (void)fetchLogin{
    @weakify(self);
    [ZDLoginPort fetchLogin:_strPhone
                        pwd:_textFieldPwd.text
                    success:^(id  _Nonnull obejct) {
                        @strongify(self);
                        [self dismissViewControllerAnimated:YES completion:nil];
                    } fail:^(NSError * _Nonnull error) {
                        
                    }];
}




@end
