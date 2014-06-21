//
//  WPCellEditOptionButton.m
//  WordPass
//
//  Created by liuxuan on 14-6-17.
//  Copyright (c) 2014年 hexuan.com. All rights reserved.
//

#import "WPCellEditOptionButtonView.h"

@interface WPCellEditOptionButtonView ()
{
    WordCellEditOptionBtnClickedBlock _passClickedBlock;
    WordCellEditOptionBtnClickedBlock _forgetClickedBlock;

}
@property(retain,nonatomic)UIButton * passButton;
@property(retain,nonatomic)UIButton * forgetButton;
@end

@implementation WPCellEditOptionButtonView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIButton * passButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, (CGRectGetWidth(frame)-10)/2, CGRectGetHeight(frame))];
        [passButton setImage:[UIImage imageWithContentsOfFile:[NSString getFilePathFomName:@"btn_pass"]] forState:UIControlStateNormal];
        [passButton addTarget:self action:@selector(doPass) forControlEvents:UIControlEventTouchDown];
        self.passButton=passButton;
        [self addSubview:passButton];
        
        UIButton * forgetButton=[[UIButton alloc]initWithFrame:CGRectMake((CGRectGetWidth(frame)-10)/2+10, 0, (CGRectGetWidth(frame)-10)/2, CGRectGetHeight(frame))];
        [forgetButton setImage:[UIImage imageWithContentsOfFile:[NSString getFilePathFomName:@"btn_forget"]] forState:UIControlStateNormal];
        [forgetButton addTarget:self action:@selector(doForget) forControlEvents:UIControlEventTouchDown];
        self.forgetButton=forgetButton;
        [self addSubview:forgetButton];
        
    }
    return self;
}




#pragma mark - 编辑相关按钮相关

-(void)doPassWithAction:(WordCellEditOptionBtnClickedBlock)clicked
{
    _passClickedBlock=[clicked copy];
}

-(void)doForgetWithAction:(WordCellEditOptionBtnClickedBlock)clicked
{
    _forgetButton=[clicked copy];
}

-(void)doPass
{
    if (_passClickedBlock) {
        _passClickedBlock();
    }
}

-(void)doForget
{
    if (_forgetClickedBlock) {
        _forgetClickedBlock();
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
