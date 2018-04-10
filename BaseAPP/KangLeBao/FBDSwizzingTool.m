//
//  FBDSwizzingTool.m
//  RunTimePro
//
//  Created by feng on 16/9/26.
//  Copyright © 2016年 冯宝东. All rights reserved.
//
/**   下面是类功能注释说明  联系人：冯宝东 QQ : 347428774 备注ios
 *
 *
 *    这个是辅助类别的方法交换的类
 *
 *
 *
 **/

#import "FBDSwizzingTool.h"
#import <objc/runtime.h>

@implementation FBDSwizzingTool

/**
 交换两个方法的实现
 
 @param originName 原来的方法
 @param overName   要替换的方法
 */
+(void)fbdSwizzingClass:(Class)class OriginSelectName:(NSString*)originName overName:(NSString*)overName
{
    
    SEL originSEL= NSSelectorFromString(originName);
    SEL overSEL= NSSelectorFromString(overName);
    Method originM= class_getInstanceMethod(class, originSEL);
    Method overM=class_getInstanceMethod(class, overSEL);
    BOOL didAddM=class_addMethod(class, originSEL, method_getImplementation(overM), method_getTypeEncoding(overM));
    if (didAddM)
    {
        class_replaceMethod(class, overSEL, method_getImplementation(originM), method_getTypeEncoding(originM));
    }else
    {
        method_exchangeImplementations(originM, overM);
        
    }

}
@end
