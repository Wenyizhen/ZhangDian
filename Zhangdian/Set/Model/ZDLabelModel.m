//
//  ZDLabelModel.m
//  Zhangdian
//
//  Created by xinmai on 2019/3/3.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDLabelModel.h"

@implementation ZDLabelModel
- (instancetype)initWithStr0:(NSString *)str0 str1:(NSString *)str1 {
    self = [super init];
    if (self) {
        self.str_0 = str0;
        self.str_1 = str1;
    }
    return self;
}
@end
