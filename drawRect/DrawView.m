//
//  DrawView.m
//  drawRect
//
//  Created by dengyonghao on 15/8/26.
//  Copyright (c) 2015年 dengyonghao. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    
    CGContextSaveGState(context);
    CGRect newRect = CGRectMake(0, 0, rect.size.width, rect.size.height);

    UIBezierPath *newPath = [UIBezierPath bezierPathWithRoundedRect:newRect cornerRadius:5];
    [newPath addClip];
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    NSArray *colors = @[(__bridge id)[UIColor colorWithRed:0.0 green:0.1 blue:0.2 alpha:0.5].CGColor,
                        (__bridge id)[UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:1.0].CGColor];
    const CGFloat locations[] = {0.0, 1.0};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, locations);

    CGContextDrawRadialGradient(context, gradient, CGPointMake(rect.size.width / 2, rect.size.height / 2), 0,CGPointMake(rect.size.width / 2, rect.size.height / 2), rect.size.width + rect.size.height, 0);
    
    CGContextRestoreGState(context);
    
    CFRelease(colorSpace);
    CFRelease(gradient);
}

@end
