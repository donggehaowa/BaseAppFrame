//
//  BaseNavBarViewController.m
//  KangLeBao
//
//  Created by feng on 2016/11/15.
//  Copyright © 2016年 冯宝东. All rights reserved.
//

/**
 *
 *自定义的NavBar 导航条
 *
 */
#import "BaseNavBarViewController.h"
#import "BaseNavBarRefreshViewController.h"
@interface BaseNavBarViewController ()
{
    UIView*  _costomNavBar;
    UILabel* _titleLabel;
    UIButton* _backButton;
    UIButton* _rightButton;
    ActionNoneCBlock _backActionBlock;
    ActionNoneCBlock _rightActionBlock;
}
@end

@implementation BaseNavBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor brownColor];
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.containedView=[UIView new];
    self.containedView.frame=CGRectMake(0, 64, ScreenW, ScreenH-64);
    [self.view addSubview:_containedView];
    
}
/**
 设置自定义的导航条的标题和右边按钮
 
 @param title 标题
 @param right rightItem
 */
-(void)setNavBarTitle:(NSString*)title right:(NSString*)right
{
    if (!_costomNavBar)
    {
        [self settingCostomNavBar];
    }
    _titleLabel.text=title;
    if (right&&![right isEqualToString:@""]&&![right hasSuffix:@"png"])
    {
        [_rightButton setTitle:right forState:UIControlStateNormal];
        
    }else
    if (right&&[right hasSuffix:@"png"]){
        UIImage* buttonBackImage=[UIImage imageNamed:right];
        [_rightButton setImage:buttonBackImage forState:UIControlStateNormal];
        [_rightButton setTitle:nil forState:UIControlStateNormal];
    }else{
        _rightButton.hidden=YES;
        
    }
    

}

/**
 设置自定义的导航条的标题和右边按钮
 
 @param title 标题
 @param right rightItem
 @param backBlock  返回回调
 @param rightBlock 右边回调
 
 */
-(void)setNavBarTitle:(NSString*)title right:(NSString*)right backBlock:(ActionNoneCBlock)backBlock rightBlock:(ActionNoneCBlock)rightBlock
{
    [self setNavBarTitle:title right:right];
    _backActionBlock=[backBlock copy];
    _rightActionBlock=[rightBlock copy];
    
}

-(void)settingCostomNavBar
{
    _costomNavBar=[UIView new];
    _titleLabel=[UILabel new];
    _backButton=[UIButton new];
    _rightButton=[UIButton new];
    _titleLabel.text=@"默认的标题";
    _titleLabel.font=[UIFont systemFontOfSize:20];
    _titleLabel.textAlignment=NSTextAlignmentCenter;
    _costomNavBar.backgroundColor=[UIColor purpleColor];
    
    [self.view addSubview:_costomNavBar];
    [_costomNavBar addSubview:_titleLabel];
    [_costomNavBar addSubview:_backButton];
    [_costomNavBar addSubview:_rightButton];
    [_backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_backButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [_backButton setTitle:@"返回" forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(_backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];

    [_rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_rightButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [_rightButton setTitle:@"待定" forState:UIControlStateNormal];
    [_rightButton addTarget:self action:@selector(_rightButtonPressed:) forControlEvents:UIControlEventTouchUpInside];

    
    [_costomNavBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.offset(0);
        make.height.offset(64);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.offset(20);
        make.height.offset(40);
        
    }];
    [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(20);
        make.size.mas_equalTo(CGSizeMake(50, 40));
        
    }];
    [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.top.offset(20);
        make.size.mas_equalTo(CGSizeMake(40, 40));

    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)_backButtonPressed:(UIButton*)sender
{
    if (_backActionBlock)
    {
        _backActionBlock();
    }
    if (self.navigationController.viewControllers.count>1)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
-(void)_rightButtonPressed:(UIButton*)sender
{
    NSLog(@"___________%s",__func__);
    if (_rightActionBlock)
    {
        _rightActionBlock();
    }

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    BaseNavBarRefreshViewController* mainRefreshVC=[[NSClassFromString(@"BaseNavBarRefreshViewController") alloc] init];
    mainRefreshVC.autoRefreshTime=2;
    [mainRefreshVC setNavBarTitle:@"带有列表的RefreshVC" right:@"YES" backBlock:^{
        
    } rightBlock:^{
        
    }];
    [self.navigationController pushViewController:mainRefreshVC animated:YES];
    
}

// VC视图控制器是否有 TabBar
- (void) containViewControllerIsHaveTabBar:(BOOL)isHave
{
    CGRect haveCGRect=  CGRectMake(0, 64, ScreenW, ScreenH-49-64);
    CGRect noHaveCGRect =CGRectMake(0, 64, ScreenW, ScreenH-64);
    
    if (isHave)
    {
        [_containedView setFrame:haveCGRect];
        
    }else
    {
        [_containedView setFrame:noHaveCGRect];
    }
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
