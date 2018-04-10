//
//  BaseNavBarRefreshViewController.h
//  KangLeBao
//
//  Created by feng on 2016/11/16.
//  Copyright © 2016年 冯宝东. All rights reserved.
//

#import "BaseNavBarViewController.h"
#import "AppFileHeader.h"
@interface BaseNavBarRefreshViewController:BaseNavBarViewController
@property (nonatomic,strong)UITableView*listTableView;

/**
 保持 autoRefreshTime 秒刷新的状态 (控制自动消失的时间)
 */
@property (nonatomic,assign)NSUInteger autoRefreshTime;
@end
