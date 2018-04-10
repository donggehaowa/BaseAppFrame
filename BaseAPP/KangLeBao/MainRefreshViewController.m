//
//  MainRefreshViewController.m
//  KangLeBao
//
//  Created by feng on 2016/10/14.
//  Copyright © 2016年 冯宝东. All rights reserved.
//

#import "MainRefreshViewController.h"

@interface MainRefreshViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MainRefreshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.autoRefreshTime=1.5;
    
    
    [self baseViewControllerRefreshHeadBlock:^{
          NSLog(@"baseViewControllerRefreshHeadBlock");
        [self fbd_Show:@"刷新啦！"];
        
    }];
    [self baseViewControllerRefreshFootBlock:^{
        NSLog(@"baseViewControllerRefreshFootBlock");
    }];
    
}

#pragma mark ---UITableViewDataSource&&UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
    
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
    
    return cell;
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
