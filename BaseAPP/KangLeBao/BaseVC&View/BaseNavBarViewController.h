//
//  BaseNavBarViewController.h
//  KangLeBao
//
//  Created by feng on 2016/11/15.
//  Copyright © 2016年 冯宝东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TypeHeader.h"
#import "AppFileHeader.h"
@interface BaseNavBarViewController : UIViewController
@property (nonatomic,strong)UIView*containedView;

/**
 设置自定义的导航条的标题和右边按钮

 @param title 标题
 @param right rightItem
 */
-(void)setNavBarTitle:(NSString*)title right:(NSString*)right;

/**
 设置自定义的导航条的标题和右边按钮
 
 @param title 标题
 @param right rightItem
 @param backBlock  返回回调
 @param rightBlock 右边回调
 
 */
-(void)setNavBarTitle:(NSString*)title right:(NSString*)right backBlock:(ActionNoneCBlock)backBlock rightBlock:(ActionNoneCBlock)rightBlock;

@end
