//
//  MFContainerConfig.m
//  MotorFans
//
//  Created by LiuFengting on 2017/4/24.
//  Copyright © 2017年 MotorFans, JDD. All rights reserved.
//

#import "MFContainerConfig.h"

@implementation MFContainerConfig

+ (MFContainerConfig *)defaultConfig
{
    MFContainerConfig * config = [[MFContainerConfig alloc] initWithSegementViewFrame:CGRectMake(0, 0, SCREEN_WIDTH, HEAD_SEGEMENT_HEIGHT)
                                                                      scrollViewFrame:CGRectMake(0, HEAD_SEGEMENT_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - HEAD_SEGEMENT_HEIGHT - NAVIGATION_HEIGHT)
                                                                               margin:-8.f
                                                                      defaultFontSize:15.f
                                                                     selectedFontSize:15.f
                                                                         defaultColor:UIColor_TitleThirdColor_99
                                                                        selectedColor:UIColor_TitleGrayColor_55
                                                                         fillSegement:YES];
    config.segementIndicatorColor = UIColor_OrangeColor_ffa727;
    config.segementEnableScrolling = YES;
    config.contentEnableScrolling = YES;
    return config;
}

+ (MFContainerConfig *)navConfigWithTabbar:(BOOL)withTabbar
{
    CGFloat tabbarHeight = withTabbar ? TABBAR_HEIGHT : 0;
    MFContainerConfig * config = [[MFContainerConfig alloc] initWithSegementViewFrame:CGRectMake(0, 0, 120, 44.f)
                                                                   scrollViewFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - tabbarHeight - NAVIGATION_HEIGHT)
                                                                               margin:-8.f
                                                                      defaultFontSize:17.f
                                                                     selectedFontSize:17.f
                                                                         defaultColor:UIColor_TitleThirdColor_99
                                                                        selectedColor:UIColor_TitleGrayColor_55
                                                                         fillSegement:YES];
    config.segementIndicatorColor = UIColor_OrangeColor_ffa727;
    config.segementEnableScrolling = NO;
    config.contentEnableScrolling = YES;
    return config;
}


- (instancetype)initWithSegementViewFrame:(CGRect)segementViewframe scrollViewFrame:(CGRect)scrollViewFrame margin:(CGFloat)margin defaultFontSize:(CGFloat)defaultFontSize selectedFontSize:(CGFloat)selectedFontSize defaultColor:(UIColor *)defaultColor selectedColor:(UIColor *)selectedColor fillSegement:(BOOL)fillSegement
{
    self = [super init];
    if (self) {
        self.segementViewFrame = segementViewframe;
        self.scrollViewFrame = scrollViewFrame;
        self.segementTitleMargin = margin;
        self.segementTitleDefaultFontSize = defaultFontSize;
        self.segementTitleSelectedFontSize = selectedFontSize;
        self.segementTitleDefaultColor = defaultColor;
        self.segementTitleSelectedColor = selectedColor;
        self.fillSegement = fillSegement;
    }
    return self;
}

- (CGFloat)segementIndicatorHeight
{
    return MAX(_segementIndicatorHeight, 2);
}

- (UIColor *)segementIndicatorColor
{
    if (!_segementIndicatorColor) {
        _segementIndicatorColor = [UIColor redColor];
    }
    return _segementIndicatorColor;
}

@end

@interface MFContainerTitleModel ()

@end

@implementation MFContainerTitleModel

- (instancetype)initWithTitle:(NSString *)title titleFont:(UIFont *)titleFont
{
    self = [super init];
    if (self) {
        self.title = title;
        self.titleFont = titleFont;
    }
    return self;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    [self calculateTitleWidth];
}

- (void)setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    [self calculateTitleWidth];
}

- (void)calculateTitleWidth
{
    if (!_title || !_titleFont) {
        return;
    }

    CGRect rect = [_title boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 20)
                                       options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                    attributes:@{NSFontAttributeName : _titleFont}
                                       context:nil];
    _titleWidth = rect.size.width;
    _titleHeight = rect.size.height;
}

@end
