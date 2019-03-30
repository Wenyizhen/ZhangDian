//
//  ZDMainGuessPort.m
//  Zhangdian
//
//  Created by beice on 2019/3/21.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDMainGuessPort.h"
#import "XLMDateFormatter.h"


@implementation ZDMainGuessPort


static NSString *strCreateTime;
+ (void)fetchMainGuessWithFirst:(BOOL)isFirst
                        success:(void(^)(NSArray *arrList,BOOL isHaveMore))success
                           fail:(FailBlock)fail{
    
    if (isFirst) {
        strCreateTime = [XLMDateFormatter timestamp];
    }
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:strCreateTime forKey:@"createTime"];
    [params setValue:@"20" forKey:@"pageSize"];
    [Network fetchMethod:POST params:params
                     url:@"api/supplyDemandInfo/list"
                 success:^(NSDictionary * _Nonnull response) {
                     NSArray *arr = [NSArray yy_modelArrayWithClass:[ZDMainGuessPort class] json:response[@"list"]];
                     if (arr.count > 0) {
                         ZDMainGuessPort *mainGuessPort = arr[arr.count-1];
                         strCreateTime = mainGuessPort.createTime;
                     }
                     if (success) {
                         success(arr,(arr.count >= 20));
                     }
                 } fail:^(NSError * _Nonnull error) {
                     if (fail) {
                         fail(error);
                     }
                 }];
}

@end
