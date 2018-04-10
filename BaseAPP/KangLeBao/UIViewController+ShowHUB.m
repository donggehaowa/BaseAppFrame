//
//  UIViewController+ShowHUB.m
//  EDCsfzs
//
//  Created by feng on 16/8/29.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import "UIViewController+ShowHUB.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+Add.h"
#import <objc/runtime.h>

@implementation UIViewController (ShowHUB)


static const void *HttpRequestHUDDONGKey = &HttpRequestHUDDONGKey;
- (MBProgressHUD *)HUD{
    return objc_getAssociatedObject(self, HttpRequestHUDDONGKey);
}

- (void)setHUD:(MBProgressHUD *)HUD{
    objc_setAssociatedObject(self, HttpRequestHUDDONGKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)fbd_Show:(NSString*)tipStr
{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
    HUD.labelText = tipStr;
    [self.view addSubview:HUD];
    [HUD show:YES];
    [self setHUD:HUD];

}

-(void)fbd_Success:(NSString*)tipStr
{
    [MBProgressHUD showSuccess:tipStr toView:self.view];
}

-(void)fbd_Dismiss
{
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    
}
@end
