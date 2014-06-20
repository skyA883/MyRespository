//
//  WPWordListCell.h
//  WordPass
//
//  Created by liuxuan on 14-6-17.
//  Copyright (c) 2014年 hexuan.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WPWordInfo;
@interface WPWordListCell : UITableViewCell

@property(retain,nonatomic)WPWordInfo * infoModel;

@property(readonly,nonatomic)EditOptionBtnType type;

/**
 @brief 当前cell处于第几行
 @discussion  编码时必须制定的
 */
@property(assign,nonatomic)NSInteger row;

@property(readonly,nonatomic,getter = isShowEdit)BOOL showEdit;

/**
 @brief 初始化cell
 @param type:要创建的cell，在编辑时显示哪几个类型的按钮
 */
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withEditBtnType:(EditOptionBtnType)type;

/**
 @brief 展示编辑按钮视图
 */
-(void)showEditBtnView:(UIView*)v annimate:(BOOL)isAnimate;

/**
 @brief 隐藏编辑按钮视图
 */
-(void)disappearEditBtnView:(UIView*)v annimate:(BOOL)isAnimate;
@end
