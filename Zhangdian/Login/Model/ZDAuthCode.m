//
//  ZDAuthCode.m
//  Zhangdian
//
//  Created by beice on 2019/3/19.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDAuthCode.h"

@implementation ZDAuthCode

+ (void)fetchAuthCode:(NSString *)phone
              success:(SuccessBlock)success
                 fail:(FailBlock)fail{

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:phone forKey:@"phone"];
    [Network fetchMethod:GET params:params
                     url:@"api/getAuthCode"
                 success:^(NSDictionary * _Nonnull response) {
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
