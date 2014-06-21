//
//  WPWordInfo.h
//  WordPass
//
//  Created by liuxuan on 14-6-15.
//  Copyright (c) 2014年 hexuan.com. All rights reserved.
//


extern WordPagePosition * const firstPageInWordPass;
extern WordPagePosition * const secondPageInWordPass;
extern WordPagePosition * const thirdPageInWordPass;
extern WordPagePosition * const fourthPageInWordPass;
extern WordPagePosition * const fifthPageInWordPass;
extern WordPagePosition * const sixthPageInWordPass;
extern WordPagePosition * const seventhPageInWordPass;

#import <Foundation/Foundation.h>

@interface WPWordInfo : NSObject

@property(strong,nonatomic)NSString * wordID;
@property(strong,nonatomic)NSString * wordTitle;
@property(strong,nonatomic)NSString * wordDes;
@property(strong,nonatomic)WordPagePosition * wordPage;

-(instancetype)initWithWordID:(NSString*)wordID andWordTitle:(NSString*)wordTitle andWordDes:(NSString*)wordDes andWordPage:(WordPagePosition*)WordPage;
@end
