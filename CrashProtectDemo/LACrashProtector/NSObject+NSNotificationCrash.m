//
//  NSObject+NSNotificationCrash.m
//  GridGovernance
//
//  Created by liberty air on 2018/12/15.
//  Copyright © 2018年 liberty air. All rights reserved.
//

#import "NSObject+NSNotificationCrash.h"
#import "NSObject+LASwizzle.h"

static const char *isNSNotification = "isNSNotification";

@implementation NSObject (NSNotificationCrash)

+ (void)la_enableNotificationProtector {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //    [self swizzlingInstance:objc_getClass("NSNotificationCenter") orginalMethod:NSSelectorFromString(@"addObserver:selector:name:object:") replaceMethod:NSSelectorFromString(@"qiye_addObserver:selector:name:object:")];
        
        NSObject *objc = [[NSObject alloc] init];
        [objc la_instanceSwizzleMethod:@selector(addObserver:selector:name:object:) replaceMethod:@selector(la_addObserver:selector:name:object:)];
        
        // 在ARC环境下不能显示的@selector dealloc。
        [objc la_instanceSwizzleMethod:NSSelectorFromString(@"dealloc") replaceMethod:NSSelectorFromString(@"la_dealloc")];
    });
}

- (void)la_addObserver:(id)observer selector:(SEL)aSelector name:(nullable NSNotificationName)aName object:(nullable id)anObject
{
    [observer setIsNSNotification:YES];
    [self la_addObserver:observer selector:aSelector name:aName object:anObject];
}

- (void)setIsNSNotification:(BOOL)yesOrNo
{
    objc_setAssociatedObject(self, isNSNotification, @(yesOrNo), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isNSNotification
{
    NSNumber *number = objc_getAssociatedObject(self, isNSNotification);;
    return  [number boolValue];
}

/**
 如果一个对象从来没有添加过通知，那就不要remove操作
 */
- (void)la_dealloc
{
    if ([self isNSNotification]) {
        NSLog(@"CrashProtector: %@ is dealloc，but NSNotificationCenter Also exsit",self);
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
    
    [self la_dealloc];
}


@end
