//
//  WPWordInfo.m
//  WordPass
//
//  Created by liuxuan on 14-6-15.
//  Copyright (c) 2014年 hexuan.com. All rights reserved.
//


WordPagePosition * const firstPageInWordPass=@"1";
WordPagePosition * const secondPageInWordPass=@"2";
WordPagePosition * const thirdPageInWordPass=@"3";
WordPagePosition * const fourthPageInWordPass=@"4";
WordPagePosition * const fifthPageInWordPass=@"5";
WordPagePosition * const sixthPageInWordPass=@"6";
WordPagePosition * const seventhPageInWordPass=@"7";


#import "WPWordInfo.h"

@implementation WPWordInfo

-(instancetype)initWithWordID:(NSString *)wordID andWordTitle:(NSString *)wordTitle andWordDes:(NSString *)wordDes andWordPage:(NSString *)wordPage
{
    if (self=[super init]) {
        self.wordTitle=wordTitle;
        self.wordID=wordID;
        self.wordDes=wordDes;
        self.wordPage=wordPage;
    }
    return self;
}
@end
