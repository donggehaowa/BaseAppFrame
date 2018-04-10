//
//  TypeHeader.h
//  EDCsfzs
//
//  Created by feng on 16/9/6.
//  Copyright © 2016年 牛高航. All rights reserved.
//


#ifdef __OBJC__
#import <Foundation/Foundation.h>
#pragma mark-------- 网络请求的Block类型
typedef void(^RequestSuccessBlock)(id obj);
typedef void(^RequestFailBlock)(NSString*error,id obj);
#pragma mark-------- 事件回调的Block类型 (无参 有参（单个 （string int 数组 字典 id ））)
typedef void(^ActionNoneCBlock)(void);
typedef void(^ActionStringBlock)(NSString*str);
typedef void(^ActionIntBlock)(NSInteger index);
typedef void(^ActionMutArrayBlock)(NSMutableArray *mArray);
typedef void(^ActionMutDictionaryBlock)(NSMutableArray *mDic);
typedef void(^ActionIdBlock)(id obj);


/**
 * 网络的APP URL
 */
//#define APP_KangURL @"http://222.73.104.92:8080"
  #define APP_KangURL  @"http://klb.api.medsci.cn:8080"
//http://klb.api.medsci.cn:8080/
//http://10.0.1.171:8080"
/**
 常见的宏定义
 */
#define  BD_DirHome     NSHomeDirectory()
#define  BD_DocumentDir [BD_DirHome stringByAppendingPathComponent:@"Documents"]
#define  BD_MySelfDir   [BD_DocumentDir stringByAppendingPathComponent:@"fengbaodong"]
#define  BD_CacheDir   [BD_DocumentDir stringByAppendingPathComponent:@"fengbaodongCache"]

#define BDNotificationCenter [NSNotificationCenter defaultCenter]
#define BDViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

//Try ______Catch 宏定义
#define YX_TryBegin		  @try {
#define YX_CatchMiddle		} @catch (NSException *localException) {
#define YX_TryEnd		  }






//GCD - 在Main线程上运行
#define kDISPATCH_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);

//GCD - 开启异步线程
#define kDISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);

#pragma mark -RunTime处理消息传递机制
#define SloveObjNoFoundMethod  \
+(BOOL)resolveInstanceMethod:(SEL)sel\
{NSString*indexM=NSStringFromSelector(sel);\
unsigned int count;\
BOOL isHave=NO;\
Method *methods = class_copyMethodList([self class], &count);\
for (int i = 0; i < count; i++)\
{\
Method method = methods[i];\
SEL selector = method_getName(method);\
NSString *name = NSStringFromSelector(selector);\
if (name&&[name isEqualToString:indexM])\
{isHave=YES;\
break;\
}\
}\
if(isHave==NO)\
{\
NSLog(@"//resolveInstanceMethod");\
class_addMethod([self class], sel, (IMP) dynamicMethodIMP, "v@:");\
return YES;}\
return [super resolveInstanceMethod:sel];}


#endif /* TypeHeader_h */
