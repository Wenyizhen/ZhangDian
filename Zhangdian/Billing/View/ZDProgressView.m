//
//  ZDProgressView.m
//  circleViewDome
//
//  Created by W z on 2019/3/1.
//  Copyright © 2019 Mr.Gao. All rights reserved.
//

#import "ZDProgressView.h"
static CGFloat dotH = 19;
static CGFloat viewH = 10;
@implementation ZDProgressView

- (void)awakeFromNib {
    [super awakeFromNib];
//    self.layer.cornerRadius = 3;
//    [self setClipsToBounds:YES];
}

- (void)drawRect:(CGRect)rect {
    CGFloat width = self.frame.size.width;
    CGFloat progressY = ( dotH - viewH)/2.;
    UIBezierPath *fullPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0,progressY, width, viewH) cornerRadius:5];
    [UIColor.grayColor set];
    [fullPath fill];
    
    UIBezierPath *progressPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, progressY, width*self.progress, viewH) cornerRadius:5];
    [self.tintColor setFill];
    [progressPath fill];
    
    UIBezierPath *arcPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(width*self.progress, dotH/2.) radius:dotH/2. startAngle:0 endAngle:M_PI*2 clockwise:YES];
    [UIColor.blueColor set];
    [arcPath fill];
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    [self setNeedsDisplay];
}
@end
