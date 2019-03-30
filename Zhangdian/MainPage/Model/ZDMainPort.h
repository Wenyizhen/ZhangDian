//
//  ZDMainPort.h
//  Zhangdian
//
//  Created by beice on 2019/3/19.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZDSuperPort.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZDMainPort : ZDSuperPort

+ (void)fetchMainInfoWithSuccess:(void(^)(NSArray *arr,NSString *strDate))success
                            fail:(FailBlock)fail;

@property(nonatomic,strong) NSNumber *netGarlicBuyPrice;//净蒜收购金额 ,
@property(nonatomic,strong) NSNumber *netGarlicBuyWeight;//净蒜收购吨数 ,
@property(nonatomic,strong) NSNumber *netGarlicInboundCount;// 净蒜入库笔数 ,
@property(nonatomic,strong) NSNumber *netGarlicInboundPoundsWeight;//净蒜入库斤重 ,
@property(nonatomic,strong) NSNumber *netGarlicInboundTonWeight;//净蒜入库吨数 ,
@property(nonatomic,strong) NSNumber *netGarlicUnitPrice;//净蒜平均价 ,
@property(nonatomic,strong) NSNumber *orignalLeatherBuyPrice;//原皮收购金额 ,
@property(nonatomic,strong) NSNumber *orignalLeatherBuyUnitPrice;//原皮平均价 ,
@property(nonatomic,strong) NSNumber *orignalLeatherBuyWeight;//原皮收购吨数 ,
@property(nonatomic,strong) NSNumber *orignalLeatherInboundCount;//原皮入库笔数 ,
@property(nonatomic,strong) NSNumber *orignalLeatherInboundPoundsWeight;//原皮入库斤重 ,
@property(nonatomic,strong) NSNumber *orignalLeatherInboundTonWeight;//原皮入库吨数 ,
@property(nonatomic,copy) NSString *updateTime;//更新时间


@end

NS_ASSUME_NONNULL_END
