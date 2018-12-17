//
//  ZDMacro.h
//  Zhangdian
//
//  Created by W z on 2018/12/7.
//  Copyright © 2018 wenyizhen. All rights reserved.
//

#ifndef ZDMacro_h
#define ZDMacro_h
//机型
#define kIPhoneX          (CGSizeEqualToSize(CGSizeMake(375, 812), [[UIScreen mainScreen] bounds].size) ||  CGSizeEqualToSize(CGSizeMake(414, 896), [[UIScreen mainScreen] bounds].size))

#define kNavStausH                   (IPhoneX ? 88.f : 64.f)//
#define kTabBarH                       (IPhoneX ? 83.f : 49.f)


// 常用字体
#define kFont(size)      [UIFont systemFontOfSize:size]
#define kFont_Bold(size) [UIFont boldSystemFontOfSize:size]
#define kFont_Medium(font)  [UIFont fontWithName:@"PingFangSC-Medium" size:font]
#define kFont_Light(font)   [UIFont fontWithName:@"PingFangSC-Light" size:font]
#define kFont_Regular(font) [UIFont fontWithName:@"PingFangSC-Regular" size:font]
#define kFont_HelveticaNeue_Medium(font) [UIFont fontWithName:@"HelveticaNeue-Medium" size:font]
#define kFont_HelveticaNeue_Bold(font) [UIFont fontWithName:@"HelveticaNeue-Bold" size:font]

//常用颜色
#define kColor_ffd50d UIColorHex(0xffd50d)

#endif /* ZDMacro_h */
