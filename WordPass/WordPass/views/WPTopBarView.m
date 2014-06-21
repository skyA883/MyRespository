//
//  WPTopBarView.m
//  WordPass
//
//  Created by liuxuan on 14-6-16.
//  Copyright (c) 2014年 hexuan.com. All rights reserved.
//

#import "WPTopBarView.h"

@interface WPTopBarView()

@property(strong,nonatomic)UIButton * button;
@end
@implementation WPTopBarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[NSString getFilePathFomName:@"nav_bar"]]]];
        
        CGFloat h=7;
        if (isIOS7) {
            h=27;
        }
        UIButton * button=[UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(15, h, 30, 30)];
        [button setImage:[UIImage imageWithContentsOfFile:[NSString getFilePathFomName:@"btn_back"]] forState:UIControlStateNormal];
        self.button=button;
        [self addSubview:button];
    }
    return self;
}

-(void)addAction:(SEL)action  withTarget:(id)target
{
    [_button addTarget:target action:action forControlEvents:UIControlEventTouchDown];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1);
    CGContextSetStrokeColorWithColor(context, [[UIColor grayColor] CGColor]);
    CGContextMoveToPoint(context, CGRectGetMinX(self.frame), CGRectGetMaxY(self.frame));
    CGContextAddLineToPoint(context, CGRectGetMaxX(self.frame), CGRectGetHeight(self.bounds));
    CGContextStrokePath(context);
}

@end
