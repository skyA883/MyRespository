//
//  WPMainViewController.m
//  WordPass
//
//  Created by liuxuan on 14-6-15.
//  Copyright (c) 2014年 hexuan.com. All rights reserved.
//

#import "WPMainViewController.h"
#import "WPSettingVC.h"
#import "WPAddWordVC.h"
#import "WPFirstWordListVC.h"
#import "WPSecondWordListVC.h"
#import "WPThirdWordListVC.h"
#import "WPFourthWordListVC.h"

@interface WPMainViewController ()

@property(strong,nonatomic)WPCommonWordListVC * currentVC;
@property(strong,nonatomic)WPPageMenu * menuView;
@end

@implementation WPMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    if (isIOS7) {
        self.automaticallyAdjustsScrollViewInsets=NO;
    }
    [self createUI];

}

-(void)viewDidAppear:(BOOL)animated
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self initViewControllers];
            [self.view bringSubviewToFront:self.menuView];

        });
    });
}

-(void)initViewControllers
{
    WPFirstWordListVC * firstVC=[[WPFirstWordListVC alloc]init];
    firstVC.editType=EditOptionBtnPass;
    firstVC.view.frame=CGRectMake(0, WPPageButtonHeight+20, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)-WPPageButtonHeight-20);
    self.currentVC=firstVC;
    [self addChildViewController:firstVC];
    [firstVC didMoveToParentViewController:self];
    [self.view addSubview:firstVC.view];
    
    WPSecondWordListVC * secondVC=[[WPSecondWordListVC alloc]init];
    secondVC.editType=EditOptionBtnPass_Forget;
    secondVC.view.frame=CGRectMake(0, WPPageButtonHeight+20, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)-WPPageButtonHeight-20);

    WPThirdWordListVC * thirdVC=[[WPThirdWordListVC alloc]init];
    thirdVC.editType=EditOptionBtnGet_Forget;
    thirdVC.view.frame=CGRectMake(0, WPPageButtonHeight+20, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)-WPPageButtonHeight-20);

    WPFourthWordListVC * fourthVC=[[WPFourthWordListVC alloc]init];
    fourthVC.editType=EditOptionBtnForget;
    fourthVC.view.frame=CGRectMake(0, WPPageButtonHeight+20, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)-WPPageButtonHeight-20);

    [self addChildViewController:secondVC];
    [secondVC didMoveToParentViewController:self];
    [self addChildViewController:thirdVC];
    [thirdVC didMoveToParentViewController:self];
    [self addChildViewController:fourthVC];
    [fourthVC didMoveToParentViewController:self];


}

-(void)createUI
{
    if (isIOS7) {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithContentsOfFile:[NSString getFilePathFomName:@"nav_bar"]] forBarPosition:UIBarPositionTopAttached barMetrics:UIBarMetricsDefault];
    }else{
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithContentsOfFile:[NSString getFilePathFomName:@"nav_bar"]] forBarMetrics:UIBarMetricsDefault];
    }
    
    
    UIButton * setting=[UIButton buttonWithType:UIButtonTypeCustom];
    [setting setFrame:CGRectMake(0, 0, 30, 30)];
    [setting setImage:[UIImage imageWithContentsOfFile:[NSString getFilePathFomName:@"btn_setting"]] forState:UIControlStateNormal];
    [setting addTarget:self action:@selector(doSetting) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * settingItem=[[UIBarButtonItem alloc]initWithCustomView:setting];
    self.navigationItem.leftBarButtonItem=settingItem;
    UIButton * addWord=[UIButton buttonWithType:UIButtonTypeCustom];
    [addWord setFrame:CGRectMake(0, 0, 30, 30)];
    [addWord setImage:[UIImage imageWithContentsOfFile:[NSString getFilePathFomName:@"btn_add"]] forState:UIControlStateNormal];
    [addWord addTarget:self action:@selector(doAddWord) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * addWordItem=[[UIBarButtonItem alloc]initWithCustomView:addWord];
    self.navigationItem.rightBarButtonItem=addWordItem;

    
    UIButton * titleView=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 17)];
    [titleView setImage:[UIImage imageWithContentsOfFile:[NSString getFilePathFomName:@"word_pass"]] forState:UIControlStateNormal];
    [titleView addTarget:self action:@selector(doTitleView) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView=titleView;

    WPPageMenu * pageMenu=[[WPPageMenu alloc]initWithFrame:CGRectZero];
    self.menuView=pageMenu;
    pageMenu.wpDelegate=self;
    [self.view addSubview:pageMenu];

}

-(void)doAddWord
{
    WPAddWordVC * addVC=[[WPAddWordVC alloc]init];
    addVC.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [[[[[UIApplication sharedApplication] delegate]window]rootViewController] presentViewController:addVC animated:YES completion:nil];
}

-(void)doSetting
{
    WPSettingVC * settingVC=[[WPSettingVC alloc]init];
    settingVC.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    [[[[[UIApplication sharedApplication] delegate]window]rootViewController] presentViewController:settingVC animated:YES completion:nil];
 
}

-(void)doTitleView
{
    ;
}


#pragma mark - WPPageMenu delegate method
-(void)wpPageMenuDelegate:(WPPageMenu *)pageMenu selectedPageNum:(NSInteger)pageNum
{
    WPCommonWordListVC * vc=[self.childViewControllers objectAtIndex:pageNum];
    if ([vc isEqual:self.currentVC]) {
        return;
    }
    [self transitionFromViewController:self.currentVC toViewController:vc duration:0.5 options:UIViewAnimationOptionBeginFromCurrentState animations:nil completion:nil];
    [self.view bringSubviewToFront:self.menuView];
    self.currentVC=vc;
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
