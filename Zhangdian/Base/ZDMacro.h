//
//  ZDMacro.h
//  Zhangdian
//
//  Created by W z on 2018/12/7.
//  Copyright © 2018 wenyizhen. All rights reserved.
//

#ifndef ZDMacro_h
#define ZDMacro_h

#define kIPhoneX          (CGSizeEqualToSize(CGSizeMake(375, 812), [[UIScreen mainScreen] bounds].size) ||  CGSizeEqualToSize(CGSizeMake(414, 896), [[UIScreen mainScreen] bounds].size))

#define kNavStausH                   (IPhoneX ? 88.f : 64.f)//self.navigationController.navigationBar.bounds.size.height
#define kTabBarH                       (IPhoneX ? 83.f : 49.f)

#endif /* ZDMacro_h */
