//
//  WPPageMenu.h
//  WordPass
//
//  Created by liuxuan on 14-6-15.
//  Copyright (c) 2014年 hexuan.com. All rights reserved.
//


/**
 @overview page num 菜单视图
 */

#import <UIKit/UIKit.h>

@protocol WPPageMenuDelegate;

@interface WPPageMenu : UIView

@property(weak,nonatomic)id<WPPageMenuDelegate>wpDelegate;

- (id)initWithFrame:(CGRect)frame;

@end


@protocol WPPageMenuDelegate <NSObject>

/**
 @brief 点击page num按钮回调
 @prama pageNum 点击的第几个
 */
@required
-(void)wpPageMenuDelegate:(WPPageMenu*)pageMenu selectedPageNum:(NSInteger)pageNum;
@end