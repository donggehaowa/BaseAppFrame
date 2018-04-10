//
//  AppDefineHeader.h
//  baodongPro
//
//  Created by feng on 16/3/4.
//  Copyright © 2016年 proper. All rights reserved.
//

#ifndef AppDefineHeader_h
#define AppDefineHeader_h

#define ReportApi_key  @"1c0dcd6e0eb979ca1d3e98cfab237c42"
#define FBD_MKRect(a,b,c,d)     CGRectMake(a, b, c, d)
#define NavgationBarColor   RGBA(225, 152, 191, 1)
#define USER_D  [NSUserDefaults standardUserDefaults]


//环信的APP
#define HuanAPPKEY  @"donggehaowa#baobaochangliao"
#define HuanCenterAPNS  @"baobaoDevelopAPNS"

#define HuanMyselfName @"fengbaodong"
#define HuanSheName @"fengyingxuan"
#define HuanMyselfPassword @"123456"
#define HuanShePassword @"123456"
#define CurrentUserName @"CurrentUserName"

//通知的宏定义
#define APP_LOGININ_NOTIFACTION @"APP_LOGININ_NOTIFACTION"  //登录的通知
#define APP_LOGINOUT_NOTIFACTION @"APP_LOGINOUT_NOTIFACTION" //退出的通知






//APP代理类对象的宏定义
#define APPDelegate_FBD  (AppDelegate*)[UIApplication sharedApplication].delegate


//对话框
#define SHOW_ALERT(msg) UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提醒" message:msg delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];\
[alert show];













#endif /* AppDefineHeader_h */
