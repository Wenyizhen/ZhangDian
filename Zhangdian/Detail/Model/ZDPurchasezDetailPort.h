//
//  ZDPurchasezDetailPort.h
//  Zhangdian
//
//  Created by beice on 2019/3/28.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZDSuperPort.h"

typedef NS_ENUM(NSInteger,FetchDetail_Enum) {
    garlicPurchase = 0,//大蒜收购
    furPurchase,//原皮收购
    garlicSale,//大蒜出售
    furSale,//原皮出售
};


@interface ZDPurchasezDetailPort : ZDSuperPort

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
                                fail:(FailBlock)fail;

@property(nonatomic,copy) NSString *acquisitionTime;//时间 ,
@property(nonatomic,strong) NSNumber *amount;//金额 ,
@property(nonatomic,strong) NSNumber *avgPrice;//平均价 ,
@property(nonatomic,copy) NSString *companyName;//公司名称 ,
@property(nonatomic,copy) NSString *farmerName;//农户 ,
@property(nonatomic,copy) NSString *garlicGoodsName;//规格 ,
@property(nonatomic,assign) NSInteger pieces;//件数 ,
@property(nonatomic,strong) NSNumber *scatteredWeight;//零重量 ,
@property(nonatomic,strong) NSNumber *singleWeight;//每件重量 ,
@property(nonatomic,strong) NSNumber *totalAmount;//总金额 ,
@property(nonatomic,assign) NSInteger totalPieces;//总计件数 ,
@property(nonatomic,strong) NSNumber *totalScatteredWeight;//总计零重量 ,
@property(nonatomic,strong) NSNumber *totalWeight;//总重量 ,
@property(nonatomic,strong) NSNumber *unitPrice;//单价 ,
@property(nonatomic,strong) NSNumber *weight;//重量


@property(nonatomic,copy) NSString *buyerName;//收购商 ,,
@property(nonatomic,strong) NSNumber *grossWeight;//毛重 ,
@property(nonatomic,assign) NSInteger leatherWeight;//皮重  ,
@property(nonatomic,strong) NSNumber *netWeight;//净重 ,
@property(nonatomic,strong) NSNumber *poundWeight;//去称 ,
@property(nonatomic,assign) NSInteger tunnage;//吨数,
@property(nonatomic,copy) NSString *warehouseName;//仓库号 ,

@end

