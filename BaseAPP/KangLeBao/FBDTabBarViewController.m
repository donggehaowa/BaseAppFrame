//
//  FBDTabBarViewController.m
//  TopInternetOfVehicles
//
//  Created by feng on 15/10/19.
//  Copyright (c) 2015年 fengbaodong. All rights reserved.
//

/*
 *  自定义的tabBarController
 */

#import "FBDTabBarViewController.h"
//#import "MineViewController.h"
//#import "MainViewController.h"
#import "BaseNavigationController.h"
#import "UIView+FBDQuickCreateUI.h"
#import "AppDefineHeader.h"
//#import "FBDUserListViewController.h"
//#import "FBDConversationListViewController.h"

@interface FBDTabBarViewController ()

@end

@implementation FBDTabBarViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    
        [self setViewControllers:[self addSubViewControllers] animated:NO];
        UIColor *titleNomalColor = [UIColor blackColor];
        UIColor *titleHighlightedColor = [UIColor whiteColor];
        
        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                           titleNomalColor, NSForegroundColorAttributeName,
                                                           nil] forState:UIControlStateNormal];
        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                           titleHighlightedColor, NSForegroundColorAttributeName,
                                                           nil] forState:UIControlStateSelected];
        [self setSelectedIndex:0];
        
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
      self.tabBar.barTintColor=NavgationBarColor;

}



/**
 *  创建所有的字控制起
 *
 *  @return 视图控制器数组
 */
-(NSArray *)addSubViewControllers
{

    BaseNavigationController*mainRootNav=[self getAnNavigationControllerWithVC:@"MainRefreshViewController" withTitle:@"迎萱主页" andItemTitle:@"首页" andImageName:@"tab_Mine_unclick" andSelectImageName:@"tab_Mine_click"];
    
    BaseNavigationController*carFriendsRootNav=[self getAnNavigationControllerWithVC:@"ViewController" withTitle:@"我的" andItemTitle:@"我的" andImageName:@"tab_my_unclick" andSelectImageName:@"tab_my_click"];
    
    BaseNavigationController* converNAV=[self getAnNavigationControllerWithVC:@"ViewController" withTitle:@"会话列表" andItemTitle:@"会话" andImageName:@"tab_my_unclick.png" andSelectImageName:@"tab_my_click.png"];
    BaseNavigationController* listNAV=[self getAnNavigationControllerWithVC:@"ViewController" withTitle:@"联系人" andItemTitle:@"朋友" andImageName:@"tab_my_unclick.png" andSelectImageName:@"tab_my_click.png"];
    listNAV.navigationBar.hidden = YES;
    return @[mainRootNav,converNAV,listNAV,carFriendsRootNav, ];


}


-(BaseNavigationController*)getAnNavigationControllerWithVC:(NSString*)VC
                                                  withTitle:(NSString*)title
                                                  andItemTitle:(NSString*)itemTitle
                                                  andImageName:(NSString*)imageName
                                            andSelectImageName:(NSString*)selectImagename
{
 
//    Class  someClass=NSClassFromString(VC);
//    
//    BaseViewController* baseVC=( BaseViewController* )[[ someClass alloc] init];
//    BaseNavigationController* baseNvc=[[BaseNavigationController alloc] initWithRootViewController:baseVC];
////
//    baseVC.title=title;
//    baseNvc.tabBarItem.image=[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    baseNvc.tabBarItem.selectedImage=[[UIImage imageNamed:selectImagename] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    baseNvc.tabBarItem.title=itemTitle;
//    
//
//    return baseNvc;
    
    Class  someClass=NSClassFromString(VC);
    UIViewController* baseVC=( UIViewController* )[[someClass alloc] initWithNibName:nil bundle:nil];
    BaseNavigationController* baseNvc=[[BaseNavigationController alloc] initWithRootViewController:baseVC];
    baseVC.title=title;
    baseNvc.tabBarItem.image=[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    baseNvc.tabBarItem.selectedImage=[[UIImage imageNamed:selectImagename] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    baseNvc.tabBarItem.title=itemTitle;
    [baseNvc.navigationBar setBarTintColor:NavgationBarColor];
    self.navigationController.navigationBar.translucent = NO;
    
    

    
    return baseNvc;

}
#pragma mark ---public

//// 统计未读消息数
//-(void)setupUnreadMessageCount
//{
//    NSArray *conversations = [[EMClient sharedClient].chatManager getAllConversations];
//    NSInteger unreadCount = 0;
//    for (EMConversation *conversation in conversations) {
//        unreadCount += conversation.unreadMessagesCount;
//    }
//    
//    UINavigationController*_chatListVC=[self.viewControllers objectAtIndex:0];
//    
//    if (_chatListVC) {
//        if (unreadCount > 0) {
//            _chatListVC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%i",(int)unreadCount];
//        }else{
//            _chatListVC.tabBarItem.badgeValue = nil;
//        }
//    }    
//    UIApplication *application = [UIApplication sharedApplication];
//    [application setApplicationIconBadgeNumber:unreadCount];
//}

/**
 *      @author 冯宝东
 *
 *      得到TabBar的索引导航控制器
 *
 *      @param index 索引
 *
 *      @return 指定的导航控制器
 */
-(UINavigationController*)getItemNavgationControllerIndex:(NSInteger)index
{
    NSAssert(index<self.viewControllers.count, @"选择的索引超出了TabBar的subViewContollers范围了");
    UINavigationController*indexNVC=[self.viewControllers objectAtIndex:index];
    return indexNVC;
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
