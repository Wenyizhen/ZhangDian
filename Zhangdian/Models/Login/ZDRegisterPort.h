//
//  ZDRegisterPort.h
//  
//
//  Created by beice on 2019/3/19.
//

#import <Foundation/Foundation.h>
#import "ZDSuperPort.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZDRegisterPort : ZDSuperPort

+ (void)fetchAuthCode:(NSString *)phone
                  pwd:(NSString *)pwd
             authCode:(NSString *)authCode
              success:(SuccessBlock)success
                 fail:(FailBlock)fail;



@end

NS_ASSUME_NONNULL_END
