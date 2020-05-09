//
//  NSDictionary+LACrash.m
//  Fangche
//
//  Created by liberty air on 2018/12/21.
//  Copyright © 2018年 liberty air. All rights reserved.
//

#import "NSDictionary+LACrash.h"
#import "NSObject+LASwizzle.h"

@implementation NSDictionary (LACrash)

+ (void)la_enableDictionaryProtector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // __NSPlaceholderDictionary
        [self la_classSwizzleMethodWithClass:self orginalMethod:@selector(dictionaryWithObjects:forKeys:count:) replaceMethod:@selector(la_dictionaryWithObjects:forKeys:count:)];
    });
}

+ (instancetype)la_dictionaryWithObjects:(const id  _Nonnull __unsafe_unretained *)objects forKeys:(const id<NSCopying>  _Nonnull __unsafe_unretained *)keys count:(NSUInteger)cnt {
    
    id instance = nil;
    @try {
        instance = [self la_dictionaryWithObjects:objects forKeys:keys count:cnt];
    }
    @catch (NSException *exception) {
        
        NSString *defaultToDo = @"This framework default is to remove nil key-values and instance a dictionary.";
        [LACrashLog la_noteErrorWithException:exception attachedTODO:defaultToDo];
        
        //处理错误的数据，然后重新初始化一个字典
        NSUInteger index = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        id  _Nonnull __unsafe_unretained newkeys[cnt];
        
        for (int i = 0; i < cnt; i++) {
            if (objects[i] && keys[i]) {
                newObjects[index] = objects[i];
                newkeys[index] = keys[i];
                index++;
            }
        }
        instance = [self la_dictionaryWithObjects:newObjects forKeys:newkeys count:index];
    }
    @finally {
        return instance;
    }
}

@end
