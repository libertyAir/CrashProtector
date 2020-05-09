//
//  NSMutableAttributedString+LACrash.m
//  Fangche
//
//  Created by liberty air on 2018/12/21.
//  Copyright © 2018年 liberty air. All rights reserved.
//

#import "NSMutableAttributedString+LACrash.h"
#import "NSObject+LASwizzle.h"

@implementation NSMutableAttributedString (LACrash)

+ (void)la_enableMutableAttributedStringProtector {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class NSConcreteMutableAttributedString = NSClassFromString(@"NSConcreteMutableAttributedString");
        
        //initWithString:
        [self la_instanceSwizzleMethodWithClass:NSConcreteMutableAttributedString orginalMethod:@selector(initWithString:) replaceMethod:@selector(la_initWithString:)];

        //initWithString:attributes:
        [self la_instanceSwizzleMethodWithClass:NSConcreteMutableAttributedString orginalMethod:@selector(initWithString:attributes:) replaceMethod:@selector(la_initWithString:attributes:)];
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
