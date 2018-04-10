//
//  ViewController.h
//  TopInternetOfVehicles
//
//  Created by feng on 15/10/17.
//  Copyright (c) 2015年 fengbaodong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
#import "AppDefineHeader.h"
#import "AppFileHeader.h"

@interface BaseViewController : UIViewController
@property (nonatomic,strong) BaseView* containedView;
// VC视图控制器是否有 TabBar
- (void) containViewControllerIsHaveTabBar:(BOOL)isHave;
// 设置标题
- (void) setNavTitle:(NSString*)title;

@end

