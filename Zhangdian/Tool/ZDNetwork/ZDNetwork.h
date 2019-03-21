//
//  ZDNetwork.h
//  Zhangdian
//
//  Created by beice on 2019/3/19.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define Network ([ZDNetwork sharedManager])

typedef NS_ENUM(NSInteger,HTTPMethod) {
    POST,
    GET
};

@interface ZDNetwork : NSObject

+ (instancetype)sharedManager;

/**
 接口请求
 
 @param method 接口请求方法
 @param params 请求参数
 @param url 请求地址
 @param success 请求成功
 @param fail 请求失败
 */
- (void)fetchMethod:(HTTPMethod)method
             params:(NSDictionary *)params
                url:(NSString *)url
            success:(void (^)(NSDictionary *response))success
               fail:(void (^)(NSError *error))fail;

@end

NS_ASSUME_NONNULL_END
