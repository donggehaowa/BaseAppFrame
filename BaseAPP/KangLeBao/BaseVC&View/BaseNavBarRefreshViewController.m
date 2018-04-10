//
//  BaseNavBarRefreshViewController.m
//  KangLeBao
//
//  Created by feng on 2016/11/16.
//  Copyright © 2016年 冯宝东. All rights reserved.
//

/**
 *
 *自定义的NavBar 导航条 带有刷新列表
 *
 */
#import "BaseNavBarRefreshViewController.h"

@interface BaseNavBarRefreshViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,copy)MJRefreshComponentRefreshingBlock headBlock;
@property(nonatomic,copy)MJRefreshComponentRefreshingBlock footBlock;

@end

@implementation BaseNavBarRefreshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.listTableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0,ScreenW,CGRectGetHeight(self.containedView.frame)) style:UITableViewStylePlain];
    self.listTableView.delegate=self;
    self.listTableView.dataSource=self;
    self.listTableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        if (self.headBlock) {
            self.headBlock();
        }
        
        if (self.autoRefreshTime)
        {
            [self autoTimeEndRefreshHeadView];
        }
        
        
    }];
    
    self.listTableView.mj_footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        if (self.footBlock)
        {
            self.footBlock();
        }
        if (self.autoRefreshTime)
        {
            [self autoTimeEndRefreshFootView];
        }
    }];


    [self.containedView addSubview:_listTableView];
    
    
    
}



#pragma mark ---UITableViewDataSource&&UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 35;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* indetifier=@"MyCells";
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:indetifier];
    if (!cell)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indetifier ];
        cell.selectionStyle=0;
    }
    cell.textLabel.text=[NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}


#pragma mark-private
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
