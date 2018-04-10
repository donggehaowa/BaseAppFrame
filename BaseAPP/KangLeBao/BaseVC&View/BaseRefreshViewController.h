//
//  Created by feng on 2016/10/14.
//  Copyright © 2016年 冯宝东. All rights reserved.
//

#import "BaseViewController.h"
#import <MJRefresh.h>
#import "AppFileHeader.h"
#import "UIViewController+ShowHUB.h"
@interface BaseRefreshViewController: BaseViewController

//基础的listTableView
@property (nonatomic,strong)UITableView*listTableView;

/**
 保持 autoRefreshTime 秒刷新的状态 (控制自动消失的时间)
 */
@property (nonatomic,assign)NSUInteger autoRefreshTime;
#pragma mark- as

#pragma mark- model

#pragma mark- view

#pragma mark- api

/**
 头部的下拉刷新

 @param headBlock 头部block回调
 */
-(void)baseViewControllerRefreshHeadBlock:(MJRefreshComponentRefreshingBlock)headBlock;

/**
 尾部的下拉刷新

 @param footBlock 尾部block回调
 */
-(void)baseViewControllerRefreshFootBlock:(MJRefreshComponentRefreshingBlock)footBlock;



@end
