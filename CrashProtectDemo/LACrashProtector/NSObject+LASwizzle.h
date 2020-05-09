//
//  NSObject+LASwizzle.h
//  GridGovernance
//
//  Created by liberty air on 2018/12/14.
//  Copyright © 2018年 liberty air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LACrashLog.h"
#import <objc/runtime.h>

@interface CrashProxy : NSObject

@property (nonatomic,copy) NSString * _Nullable crashMsg;

- (void)getCrashMsg;

@end

@interface NSObject (LASwizzle)

/**
 对类方法进行拦截并替换

 @param originalSelector 类的原类方法
 @param replaceSelector 替代方法
 */
+ (void)la_classSwizzleMethod:(SEL _Nonnull )originalSelector replaceMethod:(SEL _Nonnull )replaceSelector;

/**
 对对象的实例方法进行拦截并替换
 
 @param originalSelector 对象的原实例方法
 @param replaceSelector 替代方法
 */
- (void)la_instanceSwizzleMethod:(SEL _Nonnull )originalSelector replaceMethod:(SEL _Nonnull )replaceSelector;



#pragma mark - 在进行方法swizzing时候，一定要注意类簇 ，比如 NSArray NSDictionary 等。
/**
  对类方法进行拦截并替换

 @param klass 被拦截的具体类
 @param originalSelector 类的原类方法
 @param replaceSelector 替代方法
 */
+ (void)la_classSwizzleMethodWithClass:(Class _Nonnull )klass orginalMethod:(SEL _Nonnull )originalSelector replaceMethod:(SEL _Nonnull )replaceSelector;

/**
 对对象的实例方法进行拦截并替换
 
 @param klass 被拦截的具体类
 @param originalSelector 对象的原实例方法
 @param replaceSelector 替代方法
 */
+ (void)la_instanceSwizzleMethodWithClass:(Class _Nonnull )klass orginalMethod:(SEL _Nonnull )originalSelector replaceMethod:(SEL _Nonnull )replaceSelector;

@end
