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

#define kNavStausH                   (kIPhoneX ? 88.f : 64.f)//
#define kTabBarH                       (kIPhoneX ? 83.f : 49.f)


// 常用字体
#define kFont(size)      [UIFont systemFontOfSize:size]
#define kFont_Bold(size) [UIFont boldSystemFontOfSize:size]
#define kFont_Medium(font)  [UIFont fontWithName:@"PingFangSC-Medium" size:font]
#define kFont_Light(font)   [UIFont fontWithName:@"PingFangSC-Light" size:font]
#define kFont_Regular(font) [UIFont fontWithName:@"PingFangSC-Regular" size:font]
#define kFont_HelveticaNeue_Medium(font) [UIFont fontWithName:@"HelveticaNeue-Medium" size:font]
#define kFont_HelveticaNeue_Bold(font) [UIFont fontWithName:@"HelveticaNeue-Bold" size:font]

//常用颜色
#define kColor_NavBg UIColorHex(0xffd50d)
#define kColor_f7f7f7 UIColorHex(0xf7f7f7)
#define kColor_NavTint UIColorHex(0x060606)

//StoryBoard
#define kStoryMain(VCID)   [[UIStoryboard storyboardWithName:@"MainPage" bundle:nil]instantiateViewControllerWithIdentifier:VCID]
#define kStoryLogin(VCID) [[UIStoryboard storyboardWithName:@"Login" bundle:nil]instantiateViewControllerWithIdentifier:VCID]
#define kStoryDetail(VCID) [[UIStoryboard storyboardWithName:@"Detail" bundle:nil]instantiateViewControllerWithIdentifier:VCID]
#define kStoryBilling(VCID) [[UIStoryboard storyboardWithName:@"Billing" bundle:nil]instantiateViewControllerWithIdentifier:VCID]
#define kStorySet(VCID)[[UIStoryboard storyboardWithName:@"Set" bundle:nil]instantiateViewControllerWithIdentifier:VCID]
#define kStoryForms(VCID)[[UIStoryboard storyboardWithName:@"Forms" bundle:nil]instantiateViewControllerWithIdentifier:VCID]
#endif /* ZDMacro_h */
