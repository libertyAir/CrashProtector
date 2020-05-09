//
//  NSString+LACrash.m
//  Fangche
//
//  Created by liberty air on 2018/12/21.
//  Copyright © 2018年 liberty air. All rights reserved.
//

#import "NSString+LACrash.h"
#import "NSObject+LASwizzle.h"

@implementation NSString (LACrash)

+ (void)la_enableStringProtector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class __NSCFConstantString = NSClassFromString(@"__NSCFConstantString");
        
        //substringFromIndex
        [self la_instanceSwizzleMethodWithClass:__NSCFConstantString orginalMethod:@selector(substringFromIndex:) replaceMethod:@selector(la_substringFromIndex:)];
        
        //substringToIndex
        [self la_instanceSwizzleMethodWithClass:__NSCFConstantString orginalMethod:@selector(substringToIndex:) replaceMethod:@selector(la_substringToIndex:)];
        
        //substringWithRange:
        [self la_instanceSwizzleMethodWithClass:__NSCFConstantString orginalMethod:@selector(substringWithRange:) replaceMethod:@selector(la_substringWithRange:)];
        
        //characterAtIndex
        [self la_instanceSwizzleMethodWithClass:__NSCFConstantString orginalMethod:@selector(characterAtIndex:) replaceMethod:@selector(la_characterAtIndex:)];
        
        /* 注意swizzling先后顺序 👇： */
        //stringByReplacingOccurrencesOfString:withString:options:range:
        [self la_instanceSwizzleMethodWithClass:__NSCFConstantString orginalMethod:@selector(stringByReplacingOccurrencesOfString:withString:options:range:) replaceMethod:@selector(la_stringByReplacingOccurrencesOfString:withString:options:range:)];

        //stringByReplacingCharactersInRange:withString:
        [self la_instanceSwizzleMethodWithClass:__NSCFConstantString orginalMethod:@selector(stringByReplacingCharactersInRange:withString:) replaceMethod:@selector(la_stringByReplacingCharactersInRange:withString:)];
    });
}

//=================================================================
//                           characterAtIndex:
//=================================================================
#pragma mark - characterAtIndex:

- (unichar)la_characterAtIndex:(NSUInteger)index {
    
    unichar characteristic;
    @try {
        characteristic = [self la_characterAtIndex:index];
    }
    @catch (NSException *exception) {
        
        NSString *defaultToDo = @"This framework default is to return a without assign unichar.";
        [LACrashLog la_noteErrorWithException:exception attachedTODO:defaultToDo];
    }
    @finally {
        return characteristic;
    }
}

#pragma mark - substringFromIndex:

- (NSString *)la_substringFromIndex:(NSUInteger)from {
    
    NSString *subString = nil;
    
    @try {
        subString = [self la_substringFromIndex:from];
    }
    @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:LACrashDefaultReturnNil];
        subString = nil;
    }
    @finally {
        return subString;
    }
}

#pragma mark - substringToIndex
- (NSString *)la_substringToIndex:(NSUInteger)index {
    
    NSString *subString = nil;
    
    @try {
        subString = [self la_substringToIndex:index];
    }
    @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:LACrashDefaultReturnNil];
        subString = nil;
    }
    @finally {
        return subString;
    }
}

#pragma mark - stringByReplacingCharactersInRange:withString:

- (NSString *)la_stringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement {
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self la_stringByReplacingCharactersInRange:range withString:replacement];
    }
    @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:LACrashDefaultReturnNil];
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}

- (NSString *)la_stringByReplacingOccurrencesOfString:(NSRange)range withString:(NSString *)replacement {
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self la_stringByReplacingOccurrencesOfString:range withString:replacement];
    }
    @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:LACrashDefaultReturnNil];
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}

#pragma mark - stringByReplacingOccurrencesOfString:withString:options:range:

- (NSString *)la_stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange {
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self la_stringByReplacingOccurrencesOfString:target withString:replacement options:options range:searchRange];
    }
    @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:LACrashDefaultReturnNil];
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}

#pragma mark - substringWithRange:
- (NSString *)la_substringWithRange:(NSRange)range {
    
    NSString *subString = nil;
    
    @try {
        subString = [self la_substringWithRange:range];
    }
    @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:LACrashDefaultReturnNil];
        subString = nil;
    }
    @finally {
        return subString;
    }
}

@end
