//
//  ZDMainGuessPort.h
//  Zhangdian
//
//  Created by beice on 2019/3/21.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZDSuperPort.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZDMainGuessPort : ZDSuperPort

+ (void)fetchMainGuessWithFirst:(BOOL)isFirst
                        success:(void(^)(NSArray *arrList,BOOL isHaveMore))success
                           fail:(FailBlock)fail;

@property(nonatomic,copy) NSString *address;//地址 ,
@property(nonatomic,copy) NSString *breedName;// 品种 ,
@property(nonatomic,copy) NSString *categoryName;//类别 ,
@property(nonatomic,copy) NSString *content;//文本内容 ,
@property(nonatomic,copy) NSString *createTime;//
@property(nonatomic,strong) NSNumber *distance;// 距离(单位公里) ,
@property(nonatomic,copy) NSString *environmentName;//存储环境 ,
@property(nonatomic,copy) NSString *goodsSizeName;//规格 ,
//id (integer, optional),
@property(nonatomic,copy) NSString *statusName;//状态 ,
//sysOssEntityList (Array[SysOssEntity], optional): 供求图片 ,
@property(nonatomic,copy) NSString *timesAgo;//几个小时前 ,
@property(nonatomic,copy) NSString *title;//标题 ,
@property(nonatomic,copy) NSString *typeName;//类型 ,
@property(nonatomic,strong) NSNumber *unitPrice;//单价 ,
@property(nonatomic,strong) NSNumber *viewCount;//浏览次数

@end

NS_ASSUME_NONNULL_END
