//
//  ZDSuperPort.h
//  Zhangdian
//
//  Created by beice on 2019/3/19.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZDNetwork.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZDSuperPort : NSObject

typedef void(^SuccessBlock)(id obejct);
typedef void(^FailBlock)(NSError *error);


@end

NS_ASSUME_NONNULL_END
