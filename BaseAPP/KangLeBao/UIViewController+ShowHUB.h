//
//  UIViewController+ShowHUB.h
//  EDCsfzs
//
//  Created by feng on 16/8/29.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ShowHUB)

/**
 *      @author 冯宝东
 *
 *      显示提示信息
 *
 *      @param tipStr 提示信息
 */
-(void)fbd_Show:(NSString*)tipStr;
/**
 *      @author 冯宝东
 *
 *      显示成功信息
 *
 *      @param tipStr 成功信息
 */
-(void)fbd_Success:(NSString*)tipStr;
/**
 *      @author 冯宝东
 *
 *      让HUB消失
 */
-(void)fbd_Dismiss;
@end
