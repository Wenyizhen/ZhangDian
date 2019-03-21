//
//  ZDNetwork.m
//  Zhangdian
//
//  Created by beice on 2019/3/19.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDNetwork.h"
#import <AFNetworking/AFNetworking.h>

static NSString * const HTTP_URL = @"http://pai-api.beeplay123.com";//正式地址
static NSString * const DEV_HTTP_URL = @"http://47.110.39.79:8080/renren-api";//测试地址

@interface ZDNetwork ()

@property(nonatomic,strong) AFURLSessionManager *manager;

@end

@implementation ZDNetwork

+ (instancetype)sharedManager{
    static ZDNetwork *network;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        network = [[ZDNetwork alloc]init];
    });
    return network;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        _manager = [[AFURLSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    }
    return self;
}


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
               fail:(void (^)(NSError *error))fail{
    
#if DEBUG
    url = [NSString stringWithFormat:@"%@/%@",DEV_HTTP_URL,url];
#else
    url = [NSString stringWithFormat:@"%@/%@",HTTP_URL,url];
#endif
    if (method == POST) {
        [self fetchWithParams:params url:url method:@"POST" success:success fail:fail];
    }
    else if (method == GET) {
        [self fetchWithParams:params url:url method:@"GET" success:success fail:fail];
    }
}

#pragma mark - private
- (void)fetchWithParams:(NSDictionary *)params
                    url:(NSString *)url
                 method:(NSString *)method
                success:(void (^)(NSDictionary *response))success
                   fail:(void (^)(NSError *error))fail{
    
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:method URLString:url parameters:params error:nil];
    req.timeoutInterval = 15;
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    if ([ZDMemberInfo token].length > 0) {
        [req setValue:[ZDMemberInfo token] forHTTPHeaderField:@"token"];
    }
    NSURLSessionDataTask *task = [_manager dataTaskWithRequest:req uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            if (fail) {
                fail(error);
            }
        }
        else{
            if (responseObject) {
                if ([responseObject isKindOfClass:[NSDictionary class]]) {
                    NSDictionary *dict = (NSDictionary *)responseObject;
                    NSInteger iCode = [dict[@"code"]integerValue];
                    if (iCode == 0) {
                        if (success) {
                            success(responseObject);
                        }
                    }
                    else{
                        NSString *strMsg = dict[@"msg"];
                        NSError *error = [NSError errorWithDomain:strMsg code:iCode userInfo:nil];
                        if (fail) {
                            fail(error);
                        }
                    }
                }
            }
        }
    }];
    [task resume];
}

@end
