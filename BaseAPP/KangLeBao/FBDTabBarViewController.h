//
//  FBDTabBarViewController.h
//  TopInternetOfVehicles
//
//  Created by feng on 15/10/19.
//  Copyright (c) 2015年 fengbaodong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FBDTabBarViewController : UITabBarController

/**
 *      @author 冯宝东
 *
 *      得到TabBar的索引导航控制器
 *
 *      @param index 索引
 *
 *      @return 指定的导航控制器
 */
-(UINavigationController*)getItemNavgationControllerIndex:(NSInteger)index;


@end
