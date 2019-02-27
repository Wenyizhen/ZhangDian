//
//  ZDYPSG.h
//  Zhangdian
//
//  Created by xinmai on 2019/2/27.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZDYPSG : NSObject
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *value;
@property (strong, nonatomic) NSString *uint;
- (instancetype)initWithTitle:(NSString *)title;
- (instancetype)initWithTitle:(NSString *)title uinit:(NSString *)unit;
@end

NS_ASSUME_NONNULL_END
