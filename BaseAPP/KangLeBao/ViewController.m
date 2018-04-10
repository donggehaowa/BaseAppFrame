//
//  ViewController.m
//  KangLeBao
//
//  Created by feng on 2016/10/14.
//  Copyright © 2016年 冯宝东. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+ShowHUB.h"
#import "MainRefreshViewController.h"
#import "BaseNavBarViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor brownColor];
    
    
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    BaseNavBarViewController* mainRefreshVC=[BaseNavBarViewController new];
    [mainRefreshVC setNavBarTitle:@"测试自定义Bar" right:@"股市"];
    [mainRefreshVC setNavBarTitle:@"再次定义Bar" right:@"基金" backBlock:^{
    } rightBlock:^{
        
        NSLog(@"______>>>>>>>>>%s",__func__);
    }];
    
    [self.navigationController pushViewController:mainRefreshVC animated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
