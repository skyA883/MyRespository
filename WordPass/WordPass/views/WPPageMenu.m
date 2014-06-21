//
//  WPPageMenu.m
//  WordPass
//
//  Created by liuxuan on 14-6-15.
//  Copyright (c) 2014年 hexuan.com. All rights reserved.
//

#import "WPPageMenu.h"
#import "WPPageMenuButton.h"
#import <QuartzCore/QuartzCore.h>
@implementation WPPageMenu


-(id)initWithFrame:(CGRect)frame
{
    
    frame=CGRectMake(0, 0, 320, WPPageButtonHeight+20);
    self = [super initWithFrame:frame];
    if (self) {
        [self addShadow];
        
        [self setBackgroundColor:[UIColor greenColor]];
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[NSString getFilePathFomName:@"nav_bar"]]]];

//        self.contentSize=CGSizeMake(WPPageButtonWidth*WPPageNumber+(WPPageNumber+1)*WPPageButtonSpace, 0);
//        self.showsHorizontalScrollIndicator=NO;
//        self.bounces=YES;
        
        for (int i=0; i<WPPageNumber; i++) {
            WPPageMenuButton * button=[[WPPageMenuButton alloc]initWithFrame:CGRectMake(((i+1)*WPPageButtonSpace+i*WPPageButtonWidth), 10, WPPageButtonWidth, WPPageButtonHeight) Index:i+1];
            if (i==0) {
                [button setTouched:YES];
            }
            [button addTarget:self action:@selector(doButton:) forControlEvents:UIControlEventTouchDown];
            button.tag=i;
            [button setBackgroundColor:[UIColor clearColor]];
            [self addSubview:button];
            
        }

    }
    
    return self;
}

//UIScrollView不能添加阴影？
-(void)addShadow
{
    [self.layer setShadowColor:[[UIColor grayColor] CGColor]];
    [self.layer setShadowOffset:CGSizeMake(0, 0.5)];
    [self.layer setShadowOpacity:1];
}

#pragma mark - 恢复之前选中按钮状态
-(void)resetButCurrentBtn:(WPPageMenuButton*)current
{

    for(UIView * btn in self.subviews)
    {
        if ([btn isKindOfClass:[WPPageMenuButton class]]) {
            WPPageMenuButton * b=(WPPageMenuButton*)btn;
            if ([b isTouched]) {
                b.touched=NO;
            }
        }
    }
    
    if ([current isTouched]) {
        current.touched=NO;
    }else{
        current.touched=YES;
    }

}

-(void)doButton:(WPPageMenuButton*)button
{
    [self resetButCurrentBtn:button];
    [self.wpDelegate wpPageMenuDelegate:self selectedPageNum:button.tag];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
}

@end
