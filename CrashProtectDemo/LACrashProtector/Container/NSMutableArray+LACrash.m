//
//  NSMutableArray+LACrash.m
//  Fangche
//
//  Created by liberty air on 2018/12/19.
//  Copyright © 2018年 liberty air. All rights reserved.
//

#import "NSMutableArray+LACrash.h"
#import "NSObject+LASwizzle.h"

@implementation NSMutableArray (LACrash)

+ (void)la_enableMutableArrayProtector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //====================
        //   instance method
        //====================
        Class __NSArrayM = NSClassFromString(@"__NSArrayM");

        
        // objectAtIndex:
        [self la_instanceSwizzleMethodWithClass:__NSArrayM orginalMethod:@selector(objectAtIndex:) replaceMethod:@selector(la_objectAtIndex:)]; 
        
        [self la_instanceSwizzleMethodWithClass:__NSArrayM orginalMethod:@selector(objectAtIndexedSubscript:) replaceMethod:@selector(la_objectAtIndexedSubscript:)];

        //insertObject:atIndex:
        [self la_instanceSwizzleMethodWithClass:__NSArrayM orginalMethod:@selector(insertObject:atIndex:) replaceMethod:@selector(la_insertObject:atIndex:)];

        //removeObjectAtIndex:
        [self la_instanceSwizzleMethodWithClass:__NSArrayM orginalMethod:@selector(removeObjectAtIndex:) replaceMethod:@selector(la_removeObjectAtIndex:)];

        //setObject:atIndexedSubscript:
        [self la_instanceSwizzleMethodWithClass:__NSArrayM orginalMethod:@selector(setObject:atIndexedSubscript:) replaceMethod:@selector(la_setObject:atIndexedSubscript:)];

        [self la_instanceSwizzleMethodWithClass:__NSArrayM orginalMethod:@selector(getObjects:range:) replaceMethod:@selector(la_getObjects:range:)];

    });
}

- (id)la_objectAtIndex:(NSUInteger)index {
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
        object = [self la_objectAtIndex:index];
    }
    @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
        return object;
    }
}

- (void)la_insertObject:(id)anObject atIndex:(NSUInteger)index {
    @try {
        [self la_insertObject:anObject atIndex:index];
    }
    @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
    }
}

- (void)la_removeObjectAtIndex:(NSUInteger)index {
    @try {
        [self la_removeObjectAtIndex:index];
    }
    @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
    }
}

- (void)la_setObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
    @try {
        [self la_setObject:obj atIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
    }
}

- (void)la_getObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    @try {
        [self la_getObjects:objects range:range];
    } @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:@""];
    } @finally {
    }
}

@end
