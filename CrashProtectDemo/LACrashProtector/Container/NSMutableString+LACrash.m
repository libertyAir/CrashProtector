//
//  NSMutableString+LACrash.m
//  Fangche
//
//  Created by liberty air on 2018/12/21.
//  Copyright © 2018年 liberty air. All rights reserved.
//

#import "NSMutableString+LACrash.h"
#import "NSObject+LASwizzle.h"

@implementation NSMutableString (LACrash)

+ (void)la_enableMutableStringProtector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class __NSCFString = NSClassFromString(@"__NSCFString");
        
        //replaceCharactersInRange
        [self la_instanceSwizzleMethodWithClass:__NSCFString orginalMethod:@selector(replaceCharactersInRange:withString:) replaceMethod:@selector(la_replaceCharactersInRange:withString:)];
        
        //insertString:atIndex:
        [self la_instanceSwizzleMethodWithClass:__NSCFString orginalMethod:@selector(insertString:atIndex:) replaceMethod:@selector(la_insertString:atIndex:)];

        //deleteCharactersInRange
        [self la_instanceSwizzleMethodWithClass:__NSCFString orginalMethod:@selector(deleteCharactersInRange:) replaceMethod:@selector(la_deleteCharactersInRange:)];
    });
}

#pragma mark - replaceCharactersInRange
- (void)la_replaceCharactersInRange:(NSRange)range withString:(NSString *)aString {
    @try {
        [self la_replaceCharactersInRange:range withString:aString];
    }
    @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:LACrashDefaultReturnIgnore];
    }
    @finally {
    }
}

#pragma mark - insertString:atIndex:
- (void)la_insertString:(NSString *)aString atIndex:(NSUInteger)loc {
    
    @try {
        [self la_insertString:aString atIndex:loc];
    }
    @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:LACrashDefaultReturnIgnore];
    }
    @finally {
    }
}

#pragma mark - deleteCharactersInRange

- (void)la_deleteCharactersInRange:(NSRange)range {
    
    @try {
        [self la_deleteCharactersInRange:range];
    }
    @catch (NSException *exception) {
        [LACrashLog la_noteErrorWithException:exception attachedTODO:LACrashDefaultReturnIgnore];
    }
    @finally {
    }
}

@end
