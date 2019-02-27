//
//  ZDYPSG.m
//  Zhangdian
//
//  Created by xinmai on 2019/2/27.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDYPSG.h"

@implementation ZDYPSG
- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        self.title = title;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title uinit:(NSString *)unit {
    self = [super init];
    if (self) {
        self.title = title;
        self.uint = unit;
    }
    return self;
}
@end
