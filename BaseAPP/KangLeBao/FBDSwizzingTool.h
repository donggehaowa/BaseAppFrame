//
//  FBDSwizzingTool.h
//  RunTimePro
//
//  Created by feng on 16/9/26.
//  Copyright © 2016年 冯宝东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FBDSwizzingTool : NSObject


/**
 交换两个方法的实现

 @param originName 原来的方法
 @param overName   要替换的方法
 */
+(void)fbdSwizzingClass:(Class)class OriginSelectName:(NSString*)originName overName:(NSString*)overName;



@end
