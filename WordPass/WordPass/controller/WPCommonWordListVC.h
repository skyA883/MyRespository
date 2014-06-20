//
//  WPCommonWordListVC.h
//  WordPass
//
//  Created by liuxuan on 14-6-15.
//  Copyright (c) 2014年 hexuan.com. All rights reserved.
//



/**
 @overview  所有table vc 基类
 *
 */

#import "WPWordListTable.h"
#import <UIKit/UIKit.h>

@interface WPCommonWordListVC : UIViewController<UITableViewDelegate,UITableViewDataSource>

/**
 @brief 显示单词的table
 *
 */
@property(strong,nonatomic)WPWordListTable * wordListTable;
/**
 @brief 数据源
 *
 */
@property(copy,nonatomic)NSArray * dataArray;

/**
 @brief  编辑状态按钮类型
 */
@property(assign,nonatomic)EditOptionBtnType editType;
@end
