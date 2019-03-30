//
//  ZDGarlicProfit.h
//  Zhangdian
//
//  Created by beice on 2019/3/25.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZDSuperPort.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZDGarlicProfit : ZDSuperPort

+ (void)fetchGarlicProfitWithKeyword:(NSString *)keyword
                             isFirst:(BOOL)isFirst
                             success:(void(^)(NSArray *arrList,BOOL isHaveMore))success
                                fail:(FailBlock)fail;

+ (void)fetchLeatherProfitWithKeyword:(NSString *)keyword
                             isFirst:(BOOL)isFirst
                             success:(void(^)(NSArray *arrLisr,BOOL isHaveMore))success
                                fail:(FailBlock)fail;

@property(nonatomic,strong) NSNumber *buyAmount;//收购金额 ,
@property(nonatomic,copy) NSString *createTime;//分页用的时间 ,
@property(nonatomic,copy) NSString *garlicBuyerName;//收购商 ,
@property(nonatomic,strong) NSNumber *profit;//利润 ,
@property(nonatomic,strong) NSNumber *sellAmount;//出售金额

@end

NS_ASSUME_NONNULL_END
