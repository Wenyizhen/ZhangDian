//
//  ZDMemberInfo.m
//  Zhangdian
//
//  Created by beice on 2019/3/21.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDMemberInfo.h"

@implementation ZDMemberInfo

+ (BOOL)isLogin{
    return (((NSString *)[[NSUserDefaults standardUserDefaults]objectForKey:Default_Token]).length > 0);
}

+ (NSString *)token{
    return [[NSUserDefaults standardUserDefaults]objectForKey:Default_Token];
}

@end
