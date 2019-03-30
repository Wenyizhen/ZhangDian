//
//  ZDPurchasezDetailPort.m
//  Zhangdian
//
//  Created by beice on 2019/3/28.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDPurchasezDetailPort.h"

@implementation ZDPurchasezDetailPort

static NSString *strCreateTime;
+ (void)fetchPurchaseDetailWithFirst:(BOOL)isFirst
                           fetchEnum:(FetchDetail_Enum)fetchEnum
                           beginTime:(NSString *)begin
                             endTime:(NSString *)end
                          garlicName:(NSString *)name
                            garlicID:(NSString *)garlicID
                            minPrice:(CGFloat)min
                            maxPrice:(CGFloat)max
                         warehouseID:(NSString *)warehouseID//原皮赋值
                             success:(void(^)(NSArray *arrList,BOOL isHaveMore))success
                                fail:(FailBlock)fail{
    
    if (isFirst) {
        strCreateTime = [XLMDateFormatter timestamp];
    }
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:strCreateTime forKey:@"acquisitionTime"];
    [params setValue:begin forKey:@"startTime"];
    [params setValue:end forKey:@"endTime"];
    [params setValue:name forKey:@"garlicBuyerName"];
    [params setValue:garlicID forKey:@"garlicGoodsId"];
    [params setValue:@(min) forKey:@"minPrice"];
    [params setValue:@(max) forKey:@"maxPrice"];
    [params setValue:@"20" forKey:@"pageSize"];
    
    if (fetchEnum == furPurchase || fetchEnum == furSale) {
        [params setValue:warehouseID forKey:@"warehouseId"];
    }
    
    NSString *strKeyword = nil;
    NSString *strUrl = nil;
    switch (fetchEnum) {
        case garlicPurchase:{
            strUrl = @"api/netGarlicBuy/list";
            strKeyword = @"netGarlicBuyDetailFormList";
        }break;
        case furPurchase:{
            strUrl = @"api/orignalLeatherBuy/list";
            strKeyword = @"orignalLeatherBuyDetailFormList";
        }break;
        case garlicSale:{
            strUrl = @"api/netGarlicSell/list";
            strKeyword = @"netGarlicSellDetailFormList";
        }break;
        case furSale:{
            strUrl = @"api/orignalLeatherSell/list";
            strKeyword = @"orignalLeatherBuyDetailFormList";
        }break;
        default:break;
    }
    [Network fetchMethod:POST params:params
                     url:strUrl
                 success:^(NSDictionary * _Nonnull response) {
                     NSArray *arr = [NSArray yy_modelArrayWithClass:[ZDPurchasezDetailPort class] json:response[strKeyword]];
                     if (arr.count > 0) {
                         ZDPurchasezDetailPort *purchaseDetail = arr[arr.count-1];
                         strCreateTime = purchaseDetail.acquisitionTime;
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
