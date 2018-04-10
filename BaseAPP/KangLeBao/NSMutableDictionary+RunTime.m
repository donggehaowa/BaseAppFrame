//
//  NSMutableDictionary+RunTime.m
//  EDCsfzs
//
//  Created by feng on 16/9/26.
//  Copyright © 2016年 冯宝东. All rights reserved.
//

#import "NSMutableDictionary+RunTime.h"
#import "FBDSwizzingTool.h"
#import <Foundation/NSObject.h>

@implementation NSMutableDictionary (RunTime)

+(void)load
{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = NSClassFromString(@"__NSMutableDictionaryM");
       //Class class = [self class];
        
        
        [FBDSwizzingTool fbdSwizzingClass:class OriginSelectName:@"setObject:forKey:" overName:@"fbd_setObject:forKey:"];
    });

    
//    Class class=NSClassFromString(@"__NSDictionaryM");
//    SEL originSEL= NSSelectorFromString(@"setObject:forKey:");
//    SEL overSEL= NSSelectorFromString(@"fbd_setObject:forKey:");
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

    
    
}
-(void)test:(NSString*)objValue
{
    [self setObject:@"wq" forKey:@"11"];

}
-(void)fbd_setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    
    if (!anObject||[anObject isEqual:[NSNull null]]) {
        NSLog(@"fbd_setObject 为 null 或者为 nil  key is %@",aKey);
        [self fbd_setObject:@"fit_null" forKey:aKey];
        return;
    }
    if (!aKey) {
        return;
    }
    [self fbd_setObject:anObject forKey:aKey];
}

@end
