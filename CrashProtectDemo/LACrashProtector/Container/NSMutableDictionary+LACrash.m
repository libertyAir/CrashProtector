//
//  NSMutableDictionary+LACrash.m
//  Fangche
//
//  Created by liberty air on 2018/12/21.
//  Copyright © 2018年 liberty air. All rights reserved.
//

#import "NSMutableDictionary+LACrash.h"
#import "NSObject+LASwizzle.h"

@implementation NSMutableDictionary (LACrash)

+ (void)la_enableMutableDictionaryProtector {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class dictionaryM = NSClassFromString(@"__NSDictionaryM");
        
        //setObject:forKey:
        [self la_instanceSwizzleMethodWithClass:dictionaryM orginalMethod:@selector(setObject:forKey:) replaceMethod:@selector(la_setObject:forKey:)];
        
        // iOS11
        [self la_instanceSwizzleMethodWithClass:dictionaryM orginalMethod:@selector(setObject:forKeyedSubscript:) replaceMethod:@selector(la_setObject:forKeyedSubscript:)];

        
        //removeObjectForKey:
        [self la_instanceSwizzleMethodWithClass:dictionaryM orginalMethod:@selector(removeObjectForKey:) replaceMethod:@selector(la_removeObjectForKey:)];

    });
}

- (void)la_setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    
    @try {
        [self la_setObject:anObject forKey:aKey];
    }
    @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
    }
}

- (void)la_setObject:(id)anObject forKeyedSubscript:(id<NSCopying>)aKey {
    
    @try {
        [self la_setObject:anObject forKey:aKey];
    }
    @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
    }
}

- (void)la_removeObjectForKey:(id)aKey {
    
    @try {
        [self la_removeObjectForKey:aKey];
    }
    @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
    }
}

@end
