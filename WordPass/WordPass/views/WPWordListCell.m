//
//  WPWordListCell.m
//  WordPass
//
//  Created by liuxuan on 14-6-17.
//  Copyright (c) 2014年 hexuan.com. All rights reserved.
//

#import "WPWordListCell.h"
#import "WPCellEditOptionButtonView.h"
#import "WPWordInfo.h"
@interface WPWordListCell ()

//单词title
@property(retain,nonatomic)UILabel * wordTitleLabel;
//编辑按钮视图
@property(retain,nonatomic)WPCellEditOptionButtonView * editBtnView;

@property(retain,nonatomic)NSArray * showEditBtnCellRows;
@end

@implementation WPWordListCell

#pragma mark - 初始化方法
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withEditBtnType:(EditOptionBtnType)type{
    self=[self initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        WPCellEditOptionButtonView * editBtnView=[[WPCellEditOptionButtonView alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.bounds)-100, 2, 100, 40)];
        [editBtnView setBackgroundColor:[UIColor clearColor]];
        self.editBtnView=editBtnView;
        [self.contentView addSubview:editBtnView];

        UILabel * wordTitleLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 310, 44)];
        self.wordTitleLabel=wordTitleLabel;
        wordTitleLabel.userInteractionEnabled=YES;
        [wordTitleLabel setBackgroundColor:[UIColor purpleColor]];
        [self.contentView addSubview:wordTitleLabel];
        [self addGestureForView:wordTitleLabel];
        
        
        _type=type;
        switch (type) {
                
                //page1
            case EditOptionBtnPass:{
                [editBtnView doPassWithAction:^{
                    ;
                }];
            }
                break;
                
                //page2
            case EditOptionBtnPass_Forget:{
                [editBtnView  doForgetWithAction:^{
                    ;
                }];
            }
                break;
                
                //page3
            case EditOptionBtnGet_Forget:{
                [editBtnView doPassWithAction:^{
                    ;
                }];
                [editBtnView  doForgetWithAction:^{
                    ;
                }];
            }
                break;
                
                //page4
            case EditOptionBtnForget:{
                [editBtnView  doForgetWithAction:^{
                    ;
                }];
            }
                break;


            default:
                break;
        }
           }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        ;
    }
    return self;
}


#pragma  mark - 展示/隐藏编辑按钮视图
-(void)showEditBtnView:(UIView*)v annimate:(BOOL)isAnimate
{
    if (isAnimate) {
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            v.frame=CGRectMake(CGRectGetMinX(v.frame)-CGRectGetWidth(self.editBtnView.bounds), CGRectGetMinY(v.frame), CGRectGetWidth(v.bounds), CGRectGetHeight(v.frame));
        } completion:^(BOOL finished) {
            ;
        }];
    }else{
        v.frame=CGRectMake(CGRectGetMinX(v.frame)-CGRectGetWidth(self.editBtnView.bounds), CGRectGetMinY(v.frame), CGRectGetWidth(v.bounds), CGRectGetHeight(v.frame));
    }
}


-(void)disappearEditBtnView:(UIView*)v annimate:(BOOL)isAnimate
{
    if (isAnimate) {
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            v.frame=CGRectMake(10, CGRectGetMinY(v.frame), CGRectGetWidth(v.frame), CGRectGetHeight(v.frame));
        } completion:^(BOOL finished) {
            ;
        }];
    }else{
        v.frame=CGRectMake(10, CGRectGetMinY(v.frame), CGRectGetWidth(v.frame), CGRectGetHeight(v.frame));
    }
    
}


#pragma mark - 添加手势
-(void)addGestureForView:(UIView*)v
{
    UISwipeGestureRecognizer * swipeLeft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(doSwipe:)];
    swipeLeft.direction=UISwipeGestureRecognizerDirectionLeft;
    [v addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer * swipeRight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(doSwipe:)];
    swipeRight.direction=UISwipeGestureRecognizerDirectionRight;
    [v addGestureRecognizer:swipeRight];

}

-(void)doSwipe:(UISwipeGestureRecognizer*)swipe
{
    
    if (swipe.direction==UISwipeGestureRecognizerDirectionRight) {
        [self disappearEditBtnView:swipe.view annimate:YES];
    }else{
        if (swipe.direction==UISwipeGestureRecognizerDirectionLeft) {
            [self showEditBtnView:swipe.view annimate:YES];

        }
    }
}

#pragma mark - 重写infoModel setter 指定数据源
-(void)setInfoModel:(WPWordInfo *)infoModel
{
    if (_infoModel!=infoModel) {
        _infoModel =nil;
        _infoModel=infoModel;
    }
    self.wordTitleLabel.text=[infoModel wordTitle];
}


#pragma mark - 重写row setter 标记wordTitle位置
-(void)setRow:(NSInteger)row
{
    _row=row;
    self.wordTitleLabel.tag=2014+row;
}



- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
//    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
