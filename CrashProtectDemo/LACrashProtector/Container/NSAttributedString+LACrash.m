//
//  NSAttributedString+LACrash.m
//  Fangche
//
//  Created by liberty air on 2018/12/21.
//  Copyright © 2018年 liberty air. All rights reserved.
//

#import "NSAttributedString+LACrash.h"
#import "NSObject+LASwizzle.h"

@implementation NSAttributedString (LACrash)

+ (void)la_enableAttributedStringProtector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class NSConcreteAttributedString = NSClassFromString(@"NSConcreteAttributedString");
        
        //initWithString:
        [self la_instanceSwizzleMethodWithClass:NSConcreteAttributedString orginalMethod:@selector(initWithString:) replaceMethod:@selector(la_initWithString:)];
        //initWithAttributedString
        [self la_instanceSwizzleMethodWithClass:NSConcreteAttributedString orginalMethod:@selector(initWithAttributedString:) replaceMethod:@selector(la_initWithAttributedString:)];

        //initWithString:attributes:
        [self la_instanceSwizzleMethodWithClass:NSConcreteAttributedString orginalMethod:@selector(initWithString:attributes:) replaceMethod:@selector(la_initWithString:attributes:)];
    });
}

- (instancetype)la_initWithString:(NSString *)str {
    id object = nil;
    
    @try {
        object = [self la_initWithString:str];
    }
    @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:LACrashDefaultReturnNil];
    }
    @finally {
        return object;
    }
}

#pragma mark - initWithAttributedString
- (instancetype)la_initWithAttributedString:(NSAttributedString *)attrStr {
    id object = nil;
    
    @try {
        object = [self la_initWithAttributedString:attrStr];
    }
    @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:LACrashDefaultReturnNil];
    }
    @finally {
        return object;
    }
}

#pragma mark - initWithString:attributes:

- (instancetype)la_initWithString:(NSString *)str attributes:(NSDictionary<NSString *,id> *)attrs {
    id object = nil;
    
    @try {
        object = [self la_initWithString:str attributes:attrs];
    }
    @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:LACrashDefaultReturnNil];
    }
    @finally {
        return object;
    }
}

@end
