//
//  UIView+DrawCategory.m
//  drawRect
//
//  Created by dengyonghao on 15/8/26.
//  Copyright (c) 2015年 dengyonghao. All rights reserved.
//

#import "UIView+DrawCategory.h"

#define FOCUS_VIEW_TAG 930525   
#define BORDERWIDTH 5

@implementation UIView (DrawCategory)


- (void)drawFocus
{
    UIView *vi ;
    DrawView *drawView;
    if ([self.superview viewWithTag:FOCUS_VIEW_TAG] != nil) {
        
        vi = [self.superview viewWithTag:FOCUS_VIEW_TAG];
        for (UIView *subviews in [vi subviews]) {
            [subviews removeFromSuperview];
        }
        [vi setFrame:CGRectMake(self.frame.origin.x - BORDERWIDTH, self.frame.origin.y - BORDERWIDTH, self.frame.size.width + BORDERWIDTH * 2, self.frame.size.height + BORDERWIDTH * 2)];
        drawView = [[DrawView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width + BORDERWIDTH * 2, self.frame.size.height + BORDERWIDTH * 2)];
        [vi addSubview:drawView];

    } else {
        vi = [[UIView alloc] initWithFrame:CGRectMake(self.frame.origin.x - BORDERWIDTH, self.frame.origin.y - BORDERWIDTH, self.frame.size.width + BORDERWIDTH * 2, self.frame.size.height + BORDERWIDTH * 2)];
        drawView = [[DrawView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width + BORDERWIDTH * 2, self.frame.size.height + BORDERWIDTH * 2)];
        [vi setBackgroundColor:[UIColor clearColor]];
        [vi addSubview:drawView];
        vi.tag = FOCUS_VIEW_TAG;
    }
    [self.superview addSubview:vi];
    [self.superview insertSubview:self aboveSubview:vi];
    [vi setHidden:NO];
}

- (void)cancelFocus
{
    if ([self.superview viewWithTag:FOCUS_VIEW_TAG] != nil) {
        
        UIView *vi = [self.superview viewWithTag:FOCUS_VIEW_TAG];
        for (UIView *subviews in [vi subviews]) {
            [subviews removeFromSuperview];
        }
    }
    [[self.superview viewWithTag:FOCUS_VIEW_TAG] setHidden:YES];
}


@end
