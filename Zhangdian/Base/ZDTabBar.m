//
//  ZDTabBar.m
//  Zhangdian
//
//  Created by xinmai on 2019/3/10.
//  Copyright © 2019 wenyizhen. All rights reserved.
//

#import "ZDTabBar.h"

@implementation ZDTabBar

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    CGFloat itemW = kScreenWidth/5.;
    if (CGRectContainsPoint(CGRectMake(itemW*2, -20, itemW, 20), point)) {
        for (UIView *button in self.subviews) {
            if (![button isKindOfClass:NSClassFromString(@"UITabBarButton")])continue;
            // 计算按钮的x值
            if (button.center.x > 2*itemW && button.center.x< itemW*3) {
                return button;
            }
        }
    }
    return [super hitTest:point withEvent:event];
}
@end
