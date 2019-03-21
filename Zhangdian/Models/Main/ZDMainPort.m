//
//  ZDMainPort.m
//  Zhangdian
//
//  Created by beice on 2019/3/19.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDMainPort.h"
#import "XLMDateFormatter.h"

@implementation ZDMainPort

+ (void)fetchMainInfoWithSuccess:(void(^)(NSArray *arr,NSString *strDate))success
                            fail:(FailBlock)fail{
    [Network fetchMethod:GET params:@{}
                     url:@"api/indexInfoController/getLatestData"
                 success:^(NSDictionary * _Nonnull response) {
                     NSDictionary *dictMain = response[@"indexData"];
                     ZDMainPort *mainPort = [ZDMainPort yy_modelWithJSON:dictMain];
                     NSMutableArray *arrMain = [NSMutableArray array];
                     [arrMain addObject:@{@"title":@"净蒜收购吨数",@"price":mainPort.netGarlicBuyWeight}];
                     [arrMain addObject:@{@"title":@"净蒜收购金额",@"price":mainPort.netGarlicBuyPrice}];
                     [arrMain addObject:@{@"title":@"净蒜平均价",@"price":mainPort.netGarlicUnitPrice}];
                     [arrMain addObject:@{@"title":@"原皮收购吨数",@"price":mainPort.orignalLeatherBuyWeight}];
                     [arrMain addObject:@{@"title":@"原皮收购金额",@"price":mainPort.orignalLeatherBuyPrice}];
                     [arrMain addObject:@{@"title":@"原皮平均价",@"price":mainPort.orignalLeatherBuyUnitPrice}];
                     [arrMain addObject:@{@"title":@"净蒜入库斤量",@"price":mainPort.netGarlicInboundPoundsWeight}];
                     [arrMain addObject:@{@"title":@"净蒜入库吨数",@"price":mainPort.netGarlicInboundTonWeight}];
                     [arrMain addObject:@{@"title":@"净蒜入库笔数",@"price":mainPort.netGarlicInboundCount}];
                     [arrMain addObject:@{@"title":@"原皮入库斤量",@"price":mainPort.orignalLeatherInboundPoundsWeight}];
                     [arrMain addObject:@{@"title":@"原皮入库吨数",@"price":mainPort.orignalLeatherInboundTonWeight}];
                     [arrMain addObject:@{@"title":@"原皮入库笔数",@"price":mainPort.orignalLeatherInboundCount}];
                     
                     if (success) {
                         success(arrMain,mainPort.updateTime);
                     }
                 } fail:^(NSError * _Nonnull error) {
                     if (fail) {
                         fail(error);
                     }
                 }];
}

@end
