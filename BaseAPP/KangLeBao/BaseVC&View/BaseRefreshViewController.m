//
//
//  Created by feng on 2016/10/14.
//  Copyright © 2016年 冯宝东. All rights reserved.
//

#import "BaseRefreshViewController.h"

@interface BaseRefreshViewController ()<UITableViewDataSource,UITableViewDelegate>
{

}
@property(nonatomic,copy)MJRefreshComponentRefreshingBlock headBlock;
@property(nonatomic,copy)MJRefreshComponentRefreshingBlock footBlock;
@end

@implementation BaseRefreshViewController

#pragma mark - def

#pragma mark - override
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.containedView.backgroundColor=[UIColor whiteColor];
    [self containViewControllerIsHaveTabBar:YES];
    [self.containedView addSubview:self.listTableView];
    
}
-(UITableView*)listTableView
{
    if (!_listTableView) {
        _listTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, CGRectGetHeight(self.containedView.frame)) style:UITableViewStylePlain];
        _listTableView.delegate=self;
        _listTableView.dataSource=self;
        _listTableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            if (self.headBlock) {
                self.headBlock();
            }
            
            if (self.autoRefreshTime)
            {
                [self autoTimeEndRefreshHeadView];
            }
            
            
        }];
        
        _listTableView.mj_footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            
            if (self.footBlock)
            {
                self.footBlock();
            }
            if (self.autoRefreshTime)
            {
                [self autoTimeEndRefreshFootView];
            }
        }];
        _listTableView.backgroundColor=[UIColor whiteColor];
        
    }
    return _listTableView;
}

-(void)autoTimeEndRefreshHeadView
{
    if (self.autoRefreshTime) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(_autoRefreshTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.listTableView.mj_header endRefreshing];
            [self fbd_Dismiss];
        });
        
    }
}


-(void)autoTimeEndRefreshFootView
{
    if (self.autoRefreshTime) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(_autoRefreshTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.listTableView.mj_footer endRefreshing];
            [self fbd_Dismiss];
        });
        
    }
}


/**
 头部的下拉刷新
 
 @param headBlock 头部block回调
 */
-(void)baseViewControllerRefreshHeadBlock:(MJRefreshComponentRefreshingBlock)headBlock
{
    self.headBlock=headBlock;
    
}

/**
 尾部的下拉刷新
 
 @param footBlock 尾部block回调
 */
-(void)baseViewControllerRefreshFootBlock:(MJRefreshComponentRefreshingBlock)footBlock
{
    self.footBlock=footBlock;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}


#pragma mark - api

#pragma mark - model event
#pragma mark 1 notification
#pragma mark 2 KVO

#pragma mark - view event
#pragma mark 1 target-action
#pragma mark 2 delegate dataSource protocol

#pragma mark - private
#pragma mark - getter / setter

#pragma mark -

@end
