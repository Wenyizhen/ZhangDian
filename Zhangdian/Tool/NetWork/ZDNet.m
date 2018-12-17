//
//  ZDNet.m
//  Zhangdian
//
//  Created by W z on 2018/12/5.
//  Copyright © 2018 wenyizhen. All rights reserved.
//

#import "ZDNet.h"
static NSString *kBaseUrl = @"https://api.jddmoto.com";
static NSInteger kTimeoutInterval = 15;
static ZDNet *sharedInstance = nil;

@interface ZDNet()
@property (strong, nonatomic) AFHTTPSessionManager *manager;

@end

@implementation ZDNet
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc]init];
    });
    return sharedInstance;
}


- (instancetype)init {
    self = [super init];
    if (self) {
        self.manager = [AFHTTPSessionManager manager];
        self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain",@"image/webp", nil];
        self.manager.requestSerializer.timeoutInterval = kTimeoutInterval;
        
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
        securityPolicy.validatesDomainName =YES;
        [securityPolicy setAllowInvalidCertificates:NO];
        self.manager.securityPolicy = securityPolicy;
    }
    return self;
}

- (NSString *)getWholeUrlStr:(NSString *)urlStr {
    return [kBaseUrl stringByAppendingString:urlStr];
}

- (NSURLSessionDataTask *)getWithUrlStr:(NSString *)urlStr params:(NSMutableDictionary *)params success:(void (^)(NSDictionary * _Nonnull))successBlock failure:(void (^)(NSError * _Nonnull))failureBlock {
    NSLog(@"请求开始\n%@\n参数%@",[self getWholeUrlStr:urlStr],params);
    NSURLSessionDataTask *dataTask = [self.manager GET:[self getWholeUrlStr:urlStr] parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error;
        NSDictionary *dict = nil;
//        [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:&error];
        NSLog(@"请求成功%@",responseObject);
        if (error) {
            if (failureBlock) {
                failureBlock(error);
            }
        }else {
            if (successBlock) {
                successBlock(dict);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureBlock) {
            failureBlock(error);
        }
        NSLog(@"请求失败%@",error);
    }];
    return dataTask;
}

- (NSURLSessionDataTask *)postWithUrlStr:(NSString *)urlStr params:(NSMutableDictionary *)params success:(void (^)(NSDictionary * _Nonnull))successBlock failure:(void (^)(NSError * _Nonnull))failureBlock {
    NSLog(@"请求开始\n%@\n参数%@",[self getWholeUrlStr:urlStr],params);
    NSURLSessionDataTask *dataTask = [self.manager POST:[self getWholeUrlStr:urlStr] parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error;
        NSDictionary *dict = nil;
        //        [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:&error];
        NSLog(@"请求成功%@",responseObject);
        if (error) {
            if (failureBlock) {
                failureBlock(error);
            }
        }else {
            if (successBlock) {
                successBlock(dict);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureBlock) {
            failureBlock(error);
        }
        NSLog(@"请求失败%@",error);
    }];
    return dataTask;
}

- (NSURLSessionDataTask *)postImgsWithUrlStr:(NSString *)urlStr params:(NSMutableDictionary *)params images:(NSArray<UIImage *>*)images progress:(void(^)(NSProgress *progress))progressBlock success:(void(^)(NSDictionary *response))successBlock failure:(void(^)(NSError *error))failureBlock {
    NSLog(@"请求开始\n%@\n参数%@",[self getWholeUrlStr:urlStr],params);
    NSError *error = nil;
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer]multipartFormRequestWithMethod:@"POST" URLString:[self getWholeUrlStr:urlStr] parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (UIImage *image in images) {
            NSData *imgData = UIImageJPEGRepresentation(image, 0.8);
            [formData appendPartWithFileData:imgData name:@"file" fileName:@"jpg" mimeType:@"multipart/form-data"];
        }
    } error:&error];
    
    if (error && failureBlock) {
        failureBlock(error);
    }
    
    NSURLSessionDataTask *dataTask = [self.manager uploadTaskWithStreamedRequest:request progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"请求进度----%f",uploadProgress.fractionCompleted);

        if (progressBlock) {
            progressBlock(uploadProgress);
        }
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        NSLog(@"请求成功%@",responseObject);
    }];
    return dataTask;
}
@end
