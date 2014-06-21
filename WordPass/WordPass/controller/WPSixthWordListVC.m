//
//  WPSixthWordListVC.m
//  WordPass
//
//  Created by liuxuan on 14-6-15.
//  Copyright (c) 2014年 hexuan.com. All rights reserved.
//

#import "WPSixthWordListVC.h"

@interface WPSixthWordListVC ()

@end

@implementation WPSixthWordListVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    WPWordInfo * info1=[[WPWordInfo alloc]initWithWordID:@"1" andWordTitle:@"hunt for" andWordDes:@"寻找" andWordPage:@"1"];
    WPWordInfo * info2=[[WPWordInfo alloc]initWithWordID:@"1" andWordTitle:@"hunt for" andWordDes:@"寻找" andWordPage:@"1"];
    WPWordInfo * info3=[[WPWordInfo alloc]initWithWordID:@"1" andWordTitle:@"hunt for" andWordDes:@"寻找" andWordPage:@"1"];
    WPWordInfo * info4=[[WPWordInfo alloc]initWithWordID:@"1" andWordTitle:@"hunt for" andWordDes:@"寻找" andWordPage:@"1"];
    WPWordInfo * info5=[[WPWordInfo alloc]initWithWordID:@"1" andWordTitle:@"hunt for" andWordDes:@"寻找" andWordPage:@"1"];
    WPWordInfo * info6=[[WPWordInfo alloc]initWithWordID:@"1" andWordTitle:@"hunt for" andWordDes:@"寻找" andWordPage:@"1"];
    
    NSArray * dataArray=[[NSArray alloc]initWithObjects:info1,info2,info3,info4,info5,info6, nil];
    self.dataArray=dataArray;
    [self.wordListTable reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
