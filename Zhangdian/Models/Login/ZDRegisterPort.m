//
//  ZDRegisterPort.m
//  
//
//  Created by beice on 2019/3/19.
//

#import "ZDRegisterPort.h"

@implementation ZDRegisterPort

+ (void)fetchAuthCode:(NSString *)phone
                  pwd:(NSString *)pwd
             authCode:(NSString *)authCode
              success:(SuccessBlock)success
                 fail:(FailBlock)fail{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:phone forKey:@"mobile"];
    [params setValue:pwd forKey:@"password"];
    [params setValue:authCode forKey:@"authCode"];
    
    [Network fetchMethod:POST params:params
                     url:@"api/register"
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
