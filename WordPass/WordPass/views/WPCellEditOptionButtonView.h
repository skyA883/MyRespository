//
//  WPCellEditOptionButton.h
//  WordPass
//
//  Created by liuxuan on 14-6-17.
//  Copyright (c) 2014年 hexuan.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WPCellEditOptionButtonView : UIView

/**
 @brief 按钮组合类型
 */
@property(assign,nonatomic)EditOptionBtnType btnType;

/**
 @brief 点击pass触发方法
 */
-(void)doPassWithAction:(WordCellEditOptionBtnClickedBlock)clicked;

/**
 @brief 点击forget触发方法
 */
-(void)doForgetWithAction:(WordCellEditOptionBtnClickedBlock)clicked;
@end
