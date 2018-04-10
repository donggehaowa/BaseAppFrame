//
//  UIViewController+RunTimeSW.m
//  RunTimePro
//
//  Created by feng on 16/9/26.
//  Copyright © 2016年 冯宝东. All rights reserved.
//

#import "UIViewController+RunTimeSW.h"
#import <objc/runtime.h>
#import "FBDSwizzingTool.h"
@implementation UIViewController (RunTimeSW)

+(void)load
{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//
//    Class class = [self class];
//    SEL originSEL= NSSelectorFromString(@"viewWillAppear");
//    SEL overSEL= NSSelectorFromString(@"fbd_viewDidAppear");
//    Method originM= class_getInstanceMethod(class, originSEL);
//    Method overM=class_getInstanceMethod(class, overSEL);
//    BOOL didAddM=class_addMethod(class, originSEL, method_getImplementation(overM), method_getTypeEncoding(overM));
//    if (didAddM)
//    {
//        class_replaceMethod(class, overSEL, method_getImplementation(originM), method_getTypeEncoding(originM));
//    }else
//    {
//        method_exchangeImplementations(originM, overM);
//    
//    }
//     });
  
    
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        [FBDSwizzingTool fbdSwizzingClass:self OriginSelectName:@"viewDidLoad:" overName:@"overViewDidLoad"];
        Class class = [self class];
       [FBDSwizzingTool fbdSwizzingClass:class OriginSelectName:@"viewWillAppear:" overName:@"fbd_viewDidAppear:"];
    });
    
    
}

//{
//
////    SEL originalSelector = @selector(viewWillDisappear:);
////    SEL swizzledSelector = @selector(xxx_viewWillDisappear:);
////    
////    Method originalMethod = class_getInstanceMethod(class, originalSelector);
////    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
////    
////    BOOL didAddMethod =
////    class_addMethod(class,
////                    originalSelector,
////                    method_getImplementation(swizzledMethod),
////                    method_getTypeEncoding(swizzledMethod));
////    
////    if (didAddMethod)
////    {
////        class_replaceMethod(class,
////                            swizzledSelector,
////                            method_getImplementation(originalMethod),
////                            method_getTypeEncoding(originalMethod));
////    } else
////    {
////        
////        method_exchangeImplementations(originalMethod, swizzledMethod);
////        
////        
////    }
//    
//    Class class = [self class];
//    SEL originalSelector1 = @selector(viewWillAppear:);
//    SEL swizzledSelector1 = @selector(fbd_viewDidAppear:);
//    
//    Method originalMethod1 = class_getInstanceMethod(class, originalSelector1);
//    Method swizzledMethod1 = class_getInstanceMethod(class, swizzledSelector1);
//    
//    BOOL didAddMethod1 =
//    class_addMethod(class,
//                    originalSelector1,
//                    method_getImplementation(swizzledMethod1),
//                    method_getTypeEncoding(swizzledMethod1));
//    
//    if (didAddMethod1)
//    {
//        class_replaceMethod(class,
//                            swizzledSelector1,
//                            method_getImplementation(originalMethod1),
//                            method_getTypeEncoding(originalMethod1));
//    } else
//    {
//        
//        method_exchangeImplementations(originalMethod1, swizzledMethod1);
//        
//    }
//    
//
//
//
//}
/**
 重写的viewDidLoad
 */
-(void)overViewDidLoad
{
  
    
    [self overViewDidLoad];
    
}
-(void)fbd_viewDidAppear:(BOOL)AN
{
//    NSLog(@"fbd_viewDidAppear");
//    NSLog(@">>>>>>>>>>>%@",NSStringFromClass([self class]));
    [self fbd_viewDidAppear:YES];
    
    
    
}


@end
