//
//  WPPageMenuButton.h
//  WordPass
//
//  Created by liuxuan on 14-6-16.
//  Copyright (c) 2014年 hexuan.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WPPageMenuButton : UIButton

@property(assign,nonatomic,getter = isTouched)BOOL touched;

- (id)initWithFrame:(CGRect)frame  Index:(NSInteger)index;

@end
