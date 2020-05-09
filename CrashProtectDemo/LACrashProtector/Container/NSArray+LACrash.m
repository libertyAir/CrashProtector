//
//  NSArray+LACrash.m
//  Fangche
//
//  Created by liberty air on 2018/12/19.
//  Copyright © 2018年 liberty air. All rights reserved.
//

/**
 
 iOS 8:下都是__NSArrayI
 iOS11: 之后分 __NSArrayI、  __NSArray0、__NSSingleObjectArrayI
 
 iOS11之前：arr@[]  调用的是[__NSArrayI objectAtIndexed]
 iOS11之后：arr@[]  调用的是[__NSArrayI objectAtIndexedSubscript]
 
 arr为空数组
 *** -[__NSArray0 objectAtIndex:]: index 12 beyond bounds for empty NSArray
 
 arr只有一个元素
 *** -[__NSSingleObjectArrayI objectAtIndex:]: index 12 beyond bounds [0 .. 0]
 
 */

#import "NSArray+LACrash.h"
#import "NSObject+LASwizzle.h"

@implementation NSArray (LACrash)

+ (void)la_enableArrayProtector {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //====================
        //   instance method
        //====================
        Class __NSArray = objc_getClass("NSArray");
        Class __NSArrayI = objc_getClass("__NSArrayI");
        Class __NSSingleObjectArrayI = objc_getClass("__NSSingleObjectArrayI");
        Class __NSArray0 = objc_getClass("__NSArray0");
        
        [self la_classSwizzleMethodWithClass:__NSArray orginalMethod:@selector(arrayWithObjects:count:) replaceMethod:@selector(la_arrayWithObjects:count:)];
        
        // objectAtIndex:
        /* 数组count >= 2 */
        [self la_instanceSwizzleMethodWithClass:__NSArrayI orginalMethod:@selector(objectAtIndex:) replaceMethod:@selector(la_objectAtIndex:)];//[arr objectAtIndex:];
        
        [self la_instanceSwizzleMethodWithClass:__NSArrayI orginalMethod:@selector(objectAtIndexedSubscript:) replaceMethod:@selector(la_objectAtIndexedSubscript:)];//arr[];
        
        /* 数组为空 */
        [self la_instanceSwizzleMethodWithClass:__NSArray0 orginalMethod:@selector(objectAtIndex:) replaceMethod:@selector(la_objectAtIndexedNullarray:)];
        
        /* 数组count == 1 */
        [self la_instanceSwizzleMethodWithClass:__NSSingleObjectArrayI orginalMethod:@selector(objectAtIndex:) replaceMethod:@selector(la_objectAtIndexedArrayCountOnlyOne:)];
        
        // objectsAtIndexes:
        [self la_instanceSwizzleMethodWithClass:__NSArray orginalMethod:@selector(objectsAtIndexes:) replaceMethod:@selector(la_objectsAtIndexes:)];
        
        // 以下方法调用频繁，替换可能会影响性能
        // getObjects:range:
        [self la_instanceSwizzleMethodWithClass:__NSArray orginalMethod:@selector(getObjects:range:) replaceMethod:@selector(la_getObjectsNSArray:range:)];
        [self la_instanceSwizzleMethodWithClass:__NSSingleObjectArrayI orginalMethod:@selector(getObjects:range:) replaceMethod:@selector(la_getObjectsNSSingleObjectArrayI:range:)];
        [self la_instanceSwizzleMethodWithClass:__NSArrayI orginalMethod:@selector(getObjects:range:) replaceMethod:@selector(la_getObjectsNSArrayI:range:)];
        
    });
}

#pragma mark - instance array
+ (instancetype)la_arrayWithObjects:(const id  _Nonnull __unsafe_unretained *)objects count:(NSUInteger)cnt {
    
    id instance = nil;
    
    @try {
        instance = [self la_arrayWithObjects:objects count:cnt];
    }
    @catch (NSException *exception) {
        
        NSString *defaultToDo = @"This framework default is to remove nil object and instance a array.";
        [LACrashLog la_noteErrorWithException:exception attachedTODO:defaultToDo];

        //以下是对错误数据的处理，把为nil的数据去掉,然后初始化数组
        NSInteger newObjsIndex = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        
        for (int i = 0; i < cnt; i++) {
            if (objects[i] != nil) {
                newObjects[newObjsIndex] = objects[i];
                newObjsIndex++;
            }
        }
        instance = [self la_arrayWithObjects:newObjects count:newObjsIndex];
    }
    @finally {
        return instance;
    }
}


- (id)la_objectAtIndex:(NSUInteger)index {
//    if (index >= self.count) {
//        [LACrashLog printCrashMsg:[NSString stringWithFormat:@"-%s: index %ld beyond bounds [0 .. %lu]",__func__,index,(unsigned long)self.count]];
//        return nil;
//    }
//    return [self la_objectAtIndex:index];
    
    id object = nil;
    @try {
        object = [self la_objectAtIndex:index];
    }
    @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
        return object;
    }
}

- (id)la_objectAtIndexedSubscript:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self la_objectAtIndexedSubscript:index];
    }
    @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
        return object;
    }
}

- (id)la_objectAtIndexedNullarray:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self la_objectAtIndexedNullarray:index];
    }
    @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
        return object;
    }
}

- (id)la_objectAtIndexedArrayCountOnlyOne:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self la_objectAtIndexedArrayCountOnlyOne:index];
    }
    @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
        return object;
    }
}

- (NSArray *)la_objectsAtIndexes:(NSIndexSet *)indexes {
    NSArray *returnArray = nil;
    @try {
        returnArray = [self la_objectsAtIndexes:indexes];
    } @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:LACrashDefaultReturnNil];
        
    } @finally {
        return returnArray;
    }
}

#pragma mark getObjects:range:
- (void)la_getObjectsNSArray:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    @try {
        [self la_getObjectsNSArray:objects range:range];
    } @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:LACrashDefaultReturnIgnore];
    } @finally {
    }
}

- (void)la_getObjectsNSSingleObjectArrayI:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    @try {
        [self la_getObjectsNSSingleObjectArrayI:objects range:range];
    } @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:LACrashDefaultReturnIgnore];
    } @finally {
    }
}

- (void)la_getObjectsNSArrayI:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    @try {
        [self la_getObjectsNSArrayI:objects range:range];
    } @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:LACrashDefaultReturnIgnore];
    } @finally {
    }
}

@end
