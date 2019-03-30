//
//  ZDAuthCode.h
//  Zhangdian
//
//  Created by beice on 2019/3/19.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZDSuperPort.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZDAuthCode : ZDSuperPort

+ (void)fetchAuthCode:(NSString *)phone
              success:(SuccessBlock)success
                 fail:(FailBlock)fail;

@end

NS_ASSUME_NONNULL_END
