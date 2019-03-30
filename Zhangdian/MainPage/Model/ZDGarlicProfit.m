//
//  ZDGarlicProfit.m
//  Zhangdian
//
//  Created by beice on 2019/3/25.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDGarlicProfit.h"
#import "XLMDateFormatter.h"

@implementation ZDGarlicProfit

static NSString *strCreateTime;
+ (void)fetchGarlicProfitWithKeyword:(NSString *)keyword
                             isFirst:(BOOL)isFirst
                             success:(void(^)(NSArray *arrList,BOOL isHaveMore))success
                                fail:(FailBlock)fail{
    if (isFirst) {
        strCreateTime = [XLMDateFormatter timestamp];
    }
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:strCreateTime forKey:@"createTime"];
    [params setValue:@"20" forKey:@"pageSize"];
    [params setValue:keyword forKey:@"searchTerms"];
    [Network fetchMethod:POST params:params
                     url:@"api/netGarlicBuy/profitInfo"
                 success:^(NSDictionary * _Nonnull response) {
                     NSArray *arr = [NSArray yy_modelArrayWithClass:[ZDGarlicProfit class] json:response[@"list"]];
                     if (arr.count > 0) {
                         ZDGarlicProfit *garlicProfit = arr[arr.count-1];
                         strCreateTime = garlicProfit.createTime;
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

+ (void)fetchLeatherProfitWithKeyword:(NSString *)keyword
                              isFirst:(BOOL)isFirst
                              success:(void(^)(NSArray *arrList,BOOL isHaveMore))success
                                 fail:(FailBlock)fail{
    if (isFirst) {
        strCreateTime = [XLMDateFormatter timestamp];
    }
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:strCreateTime forKey:@"createTime"];
    [params setValue:@"20" forKey:@"pageSize"];
    [params setValue:keyword forKey:@"searchTerms"];
    [Network fetchMethod:POST params:params
                     url:@"api/orignalLeatherBuy/profitInfo"
                 success:^(NSDictionary * _Nonnull response) {
                     NSArray *arr = [NSArray yy_modelArrayWithClass:[ZDGarlicProfit class] json:response[@"list"]];
                     if (arr.count > 0) {
                         ZDGarlicProfit *garlicProfit = arr[arr.count-1];
                         strCreateTime = garlicProfit.createTime;
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
