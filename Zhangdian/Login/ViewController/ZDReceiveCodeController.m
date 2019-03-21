//
//  ZDReceiveCodeController.m
//  Zhangdian
//
//  Created by xinmai on 2019/2/17.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDReceiveCodeController.h"
#import "ZDSetPwdViewController.h"
#import "ZDAuthCode.h"

@implementation ZDNoMenuTextField
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    UIMenuController *menu = [UIMenuController sharedMenuController];
    if (menu) {
        menu.menuVisible = NO;
    }
    return NO;
}

@end

static NSInteger maxNum = 4;
@interface ZDReceiveCodeController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIView *bottomView0;
@property (weak, nonatomic) IBOutlet UIView *bottomView1;
@property (weak, nonatomic) IBOutlet UIView *bottomView2;
@property (weak, nonatomic) IBOutlet UIView *bottomView3;
@property (weak, nonatomic) IBOutlet UILabel *numLabelo;
@property (weak, nonatomic) IBOutlet UILabel *numLabel1;
@property (weak, nonatomic) IBOutlet UILabel *numLabel2;
@property (weak, nonatomic) IBOutlet UILabel *numLabel3;

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) UIColor *selectedColor;
@property (strong, nonatomic) UIColor *unSeletedColor;
@property (strong, nonatomic) NSMutableArray *arr;
@end

@implementation ZDReceiveCodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
    // Do any additional setup after loading the view.
}

- (void)configSubViews {
    self.textField.delegate = self;
    self.selectedColor = UIColorHex(0xFFCF15);
    self.unSeletedColor = UIColorHex(0xC9C9C7);
    self.title = @"输入验证码";
    [self setNavBgAlpha:0];
    [self configNumView];
    [self.textField becomeFirstResponder];
    
    @weakify(self);
    if (_strPhone.length > 0) {
        [ZDAuthCode fetchAuthCode:_strPhone success:^(id  _Nonnull obejct) {
            dispatch_async(dispatch_get_main_queue(), ^{
                @strongify(self);
                self.lblTitle.text = [NSString stringWithFormat:@"我们已向 %@ 发送验证码 请及时查看短信，输入验证码",self.strPhone];
            });
        } fail:^(NSError * _Nonnull error) {

        }];
    }
}

- (NSMutableArray *)arr {
    if (!_arr) {
        _arr = [NSMutableArray array];
    }
    return _arr;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (self.arr.count >= maxNum && string.length) {
        return NO;
    }
    else {
        if (string.length) {
            if (string.length ==1) {
                [self.arr addObject:string];
            }else {
                [self.arr removeAllObjects];
                NSMutableString *str = [NSMutableString stringWithString:string];
                while (str.length) {
                    NSString *tmpStr = [str substringToIndex:1];
                    [self.arr addObject:tmpStr];
                    [str deleteCharactersInRange:NSMakeRange(0, 1)];
                }
            }
        }else {
            if (self.arr.count) {
                [self.arr removeLastObject];
            }
        }
        [self configNumView];
    }
    NSString *strCode = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (strCode.length >= maxNum) {
        ZDSetPwdViewController *setPwdVC = kStoryLogin(@"ZDSetPwdViewController");
        setPwdVC.strCode = strCode;
        setPwdVC.strPhone = self.strPhone;
        [self.navigationController pushViewController:setPwdVC animated:YES];
    }
    return YES;
}

- (void)configNumView {
    self.bottomView0.backgroundColor = self.unSeletedColor;
    self.bottomView1.backgroundColor = self.unSeletedColor;
    self.bottomView2.backgroundColor = self.unSeletedColor;
    self.bottomView3.backgroundColor = self.unSeletedColor;
    self.numLabelo.text = @"";
    self.numLabel1.text = @"";
    self.numLabel2.text = @"";
    self.numLabel3.text = @"";
    if (self.arr.count >0) {
        self.numLabelo.text = self.arr[0];
        self.bottomView0.backgroundColor = self.selectedColor;
    }
    if (self.arr.count >1) {
        self.numLabel1.text = self.arr[1];
        self.bottomView1.backgroundColor = self.selectedColor;
    }
    if (self.arr.count >2) {
        self.numLabel2.text = self.arr[2];
        self.bottomView2.backgroundColor = self.selectedColor;
    }
    if (self.arr.count >3) {
        self.numLabel3.text = self.arr[3];
        self.bottomView3.backgroundColor = self.selectedColor;
    }
}

@end
