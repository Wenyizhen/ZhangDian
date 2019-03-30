//
//  ZDLoginPort.m
//  Zhangdian
//
//  Created by beice on 2019/3/19.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDLoginPort.h"

@implementation ZDLoginPort

+ (void)fetchLogin:(NSString *)phone
               pwd:(NSString *)pwd
           success:(SuccessBlock)success
              fail:(FailBlock)fail{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:phone forKey:@"mobile"];
    [params setValue:pwd forKey:@"password"];
    [Network fetchMethod:POST params:params
                     url:@"api/login"
                 success:^(NSDictionary * _Nonnull response) {
                     if (response) {
                         NSInteger iUserID = [response[@"userId"]integerValue];
                         if (iUserID > 0) {
                             [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%zd",iUserID] forKey:Default_UserID];
                         }
                         NSString *strToken = response[@"token"];
                         if (strToken.length > 0) {
                             [[NSUserDefaults standardUserDefaults]setValue:strToken forKey:Default_Token];
                         }
                     }
                     if (success) {
                         success(response);
                     }
                 } fail:^(NSError * _Nonnull error) {
                     if (fail) {
                         fail(error);
                     }
                 }];
    
}

@end
