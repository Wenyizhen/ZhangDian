//
//  MFContainerConfig.h
//  MotorFans
//
//  Created by LiuFengting on 2017/4/24.
//  Copyright © 2017年 MotorFans, JDD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MFContainerConfig : NSObject

@property (nonatomic, assign)CGRect segementViewFrame;
@property (nonatomic, assign)CGRect scrollViewFrame;
@property (nonatomic, assign)CGFloat segementTitleMargin;
@property (nonatomic, assign)CGFloat segementTitleDefaultFontSize;
@property (nonatomic, assign)CGFloat segementTitleSelectedFontSize;
@property (nonatomic, strong)UIColor *segementTitleDefaultColor;
@property (nonatomic, strong)UIColor *segementTitleSelectedColor;
@property (nonatomic, assign)BOOL fillSegement;

@property (nonatomic, assign)CGFloat segementIndicatorHeight; // min is 2.0
@property (nonatomic, strong)UIColor *segementIndicatorColor; // default is red
@property (nonatomic, assign)BOOL segementEnableScrolling;
@property (nonatomic, assign)BOOL contentEnableScrolling;

+ (MFContainerConfig *)defaultConfig;

+ (MFContainerConfig *)navConfigWithTabbar:(BOOL)withTabbar;

- (instancetype)initWithSegementViewFrame:(CGRect)segementViewframe
                          scrollViewFrame:(CGRect)scrollViewFrame
                                   margin:(CGFloat)margin
                          defaultFontSize:(CGFloat)defaultFontSize
                         selectedFontSize:(CGFloat)selectedFontSize
                             defaultColor:(UIColor *)defaultColor
                            selectedColor:(UIColor *)selectedColor
                             fillSegement:(BOOL)fillSegement;


@end

@interface MFContainerTitleModel : NSObject

@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)UIFont *titleFont;
@property (nonatomic, readonly, assign)CGFloat titleWidth;
@property (nonatomic, readonly, assign)CGFloat titleHeight;

- (instancetype)initWithTitle:(NSString *)title titleFont:(UIFont *)titleFont;

@end
