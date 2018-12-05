//
//  ZDNet.h
//  Zhangdian
//
//  Created by W z on 2018/12/5.
//  Copyright © 2018 wenyizhen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
#define ZDNetWork [ZDNet sharedInstance]

@interface ZDNet : NSObject
+ (instancetype)sharedInstance;

- (NSURLSessionDataTask *)getWithUrlStr:(NSString *)urlStr params:(NSMutableDictionary *)params success:(void(^)(NSDictionary *response))successBlock failure:(void(^)(NSError *error))failureBlock;


- (NSURLSessionDataTask *)postWithUrlStr:(NSString *)urlStr params:(NSMutableDictionary *)params success:(void(^)(NSDictionary *response))successBlock failure:(void(^)(NSError *error))failureBlock;

- (NSURLSessionDataTask *)postImgsWithUrlStr:(NSString *)urlStr params:(NSMutableDictionary *)params images:(NSArray<UIImage *>*)images progress:(void(^)(NSProgress *progress))progressBlock success:(void(^)(NSDictionary *response))successBlock failure:(void(^)(NSError *error))failureBlock;

@end

NS_ASSUME_NONNULL_END
