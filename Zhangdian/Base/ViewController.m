//
//  ViewController.m
//  Zhangdian
//
//  Created by W z on 2018/12/5.
//  Copyright © 2018 wenyizhen. All rights reserved.
//

#import "ViewController.h"
#import "ZDTitleView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ZDTitleView *view = [[ZDTitleView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
    view.backgroundColor = [UIColor redColor];
    self.navigationItem.titleView = view;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:@"1" forKey:@"platform"];
    [dict setValue:@"20121" forKey:@"action"];
    [ZDNetWork getWithUrlStr:@"/forum/public/forumController.do" params:dict success:^(NSDictionary * _Nonnull response) {
        NSLog(@"sss");
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
@end
