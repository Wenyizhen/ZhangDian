//
//  ZDMemberInfo.h
//  Zhangdian
//
//  Created by beice on 2019/3/21.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*NSNotification*/
static NSString *const NSNotification_LoginSuccess = @"LoginSuccess";

/*NSUserDefaults*/
static NSString *const Default_UserID = @"user_ID";
static NSString *const Default_Token = @"token";

@interface ZDMemberInfo : NSObject

+ (BOOL)isLogin;
+ (NSString *)token;

@end

NS_ASSUME_NONNULL_END
