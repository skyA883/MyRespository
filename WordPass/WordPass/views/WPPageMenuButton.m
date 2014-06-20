//
//  WPPageMenuButton.m
//  WordPass
//
//  Created by liuxuan on 14-6-16.
//  Copyright (c) 2014年 hexuan.com. All rights reserved.
//

#import "WPPageMenuButton.h"

@interface WPPageMenuButton ()
{
    NSInteger _index;
}
@end

@implementation WPPageMenuButton

- (id)initWithFrame:(CGRect)frame  Index:(NSInteger)index
{
    self = [super initWithFrame:frame];
    if (self) {
        _index=index;
        if (index==1) {
            [self setImage:[UIImage imageWithContentsOfFile:[NSString getFilePathFomName:[NSString stringWithFormat:@"teb_1st_s"]]] forState:UIControlStateNormal];
        }else{
        [self setImage:[UIImage imageWithContentsOfFile:[NSString getFilePathFomName:[NSString stringWithFormat:@"teb_%ldst",index]]] forState:UIControlStateNormal];
        }
        [self addObserver:self forKeyPath:@"self.touched" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    BOOL isTouched=[[change valueForKey:NSKeyValueChangeNewKey] boolValue];
    if (isTouched) {
        [self setImage:[UIImage imageWithContentsOfFile:[NSString getFilePathFomName:[NSString stringWithFormat:@"teb_%ldst_s",_index]]] forState:UIControlStateNormal];
    }else{
        [self setImage:[UIImage imageWithContentsOfFile:[NSString getFilePathFomName:[NSString stringWithFormat:@"teb_%ldst",_index]]] forState:UIControlStateNormal];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
