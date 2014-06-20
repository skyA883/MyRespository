//
//  WPCommonWordListDef.h
//  WordPass
//
//  Created by liuxuan on 14-6-15.
//  Copyright (c) 2014年 hexuan.com. All rights reserved.
//

#ifndef WordPass_WPCommonWordListDef_h
#define WordPass_WPCommonWordListDef_h

#define isIOS7 [[[UIDevice  currentDevice]systemVersion] doubleValue]>=7.0

#define NavBar_ios7 (isIOS7?64:44)
#define Origin_X (isIOS7?64:0)

//定义一个新类型
typedef NSString WordPagePosition;

//定义编辑cell的事件block类型
typedef void(^WordCellEditOptionBtnClickedBlock)(void);

//定义编辑按钮出现类型
typedef enum: NSInteger{
    EditOptionBtnPass,
    EditOptionBtnForget,
    EditOptionBtnGet,
    EditOptionBtnGet_Forget,
    EditOptionBtnPass_Forget
}EditOptionBtnType;


//page number
#define WPPageNumber 4
#define WPPageButtonHeight 30
#define WPPageButtonWidth 60
#define WPPageButtonSpace 16
#endif
