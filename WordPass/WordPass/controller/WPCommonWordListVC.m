//
//  WPCommonWordListVC.m
//  WordPass
//
//  Created by liuxuan on 14-6-15.
//  Copyright (c) 2014年 hexuan.com. All rights reserved.
//



/**
 @brief 单词列表普通cell重用标示符
 *
 */
static NSString * const WordPassCustomCellIndentiffier=@"customWordPassCell";

NS_ENUM(NSInteger, NewTeger){
    aa,
    bb
};

NS_OPTIONS(NSInteger, NewDouble)
{
    cc,
    dd
};

#import "WPCommonWordListVC.h"
#import "WPWordListCell.h"

@interface WPCommonWordListVC ()

@end

@implementation WPCommonWordListVC

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
    
    WPWordListTable * table=[[WPWordListTable alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.wordListTable=table;
    table.dataSource=self;
    table.delegate=self;
    [self.view addSubview:table];
}

-(void)viewDidAppear:(BOOL)animated
{
    self.wordListTable.frame=self.view.bounds;
}


#pragma mark - table 数据相关代理方法实现
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WPWordListCell * customCell=[tableView dequeueReusableCellWithIdentifier:WordPassCustomCellIndentiffier];
    if (!customCell) {
        customCell=[[WPWordListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:WordPassCustomCellIndentiffier withEditBtnType:self.editType];
    }
    customCell.row=indexPath.row;
    customCell.textLabel.text=[NSString stringWithFormat:@"%ld",indexPath.row];
    return customCell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}


#pragma mark - table 操作相关代理
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - table 编辑相关代理
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WPWordListCell * cell=(WPWordListCell*)[self tableView:tableView cellForRowAtIndexPath:indexPath];
//    [cell showEditBtnView];
    
    return UITableViewCellEditingStyleNone;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle==UITableViewCellEditingStyleNone) {
        ;
    }
}

//编辑结束
-(void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    WPWordListCell * cell=(WPWordListCell*)[self tableView:tableView cellForRowAtIndexPath:indexPath];
//    [cell disappearEditBtnView];
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
