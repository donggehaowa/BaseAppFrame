//
//  ViewController.m
//  TopInternetOfVehicles
//
//  Created by feng on 15/10/17.
//  Copyright (c) 2015年 fengbaodong. All rights reserved.
//


/*
 * 基础的视图控制器
 */

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
@synthesize containedView=_containedView;
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBackGroud"] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
//    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];

    self.automaticallyAdjustsScrollViewInsets=NO;
   
    
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    
    }

   
    return self;
    

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    _containedView=[[BaseView alloc] initWithFrame:CGRectMake(0, 64, ScreenW, ScreenH-64)];
    _containedView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_containedView];
    
}

// VC视图控制器是否有 TabBar
- (void) containViewControllerIsHaveTabBar:(BOOL)isHave
{
    CGRect haveCGRect=  CGRectMake(0, 64, ScreenW, ScreenH-44-64);
    CGRect noHaveCGRect =CGRectMake(0, 64, ScreenW, ScreenH-64);
    
    if (isHave)
    {
        [_containedView setFrame:haveCGRect];
        
    }else
    {
      [_containedView setFrame:noHaveCGRect];
    }
    

}
- (void)setNavTitle:(NSString*)title
{
    self.title=title;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
