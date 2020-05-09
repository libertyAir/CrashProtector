//
//  LACrashProtectorManager.m
//  GridGovernance
//
//  Created by liberty air on 2018/12/14.
//  Copyright © 2018年 liberty air. All rights reserved.
//

#import "LACrashProtectorManager.h"
#import "NSObject+SelectorCrash.h"
#import "NSObject+KVOCrash.h"
#import "NSObject+NSNotificationCrash.h"
#import "NSTimer+Crash.h"
#import "NSArray+LACrash.h"
#import "NSMutableArray+LACrash.h"
#import "NSDictionary+LACrash.h"
#import "NSMutableDictionary+LACrash.h"
#import "NSString+LACrash.h"
#import "NSMutableString+LACrash.h"
#import "NSAttributedString+LACrash.h"
#import "NSMutableAttributedString+LACrash.h"

@implementation LACrashProtectorManager

+ (void)makeAllEffective {
    [self _startAllComponents];
}

+ (void)configCrashProtectorService:(LACrashProtectorStyle)protectorType {
   
    switch (protectorType) {
        case LACrashProtectorNone:
            
            break;
        case LACrashProtectorAll:
        {
            [self _startAllComponents];
        }
            break;
        case LACrashProtectorUnrecognizedSelector:
            [NSObject la_enableSelectorProtector];
            break;
        case LACrashProtectorKVO:
            [NSObject la_enableKVOProtector];
            break;
        case LACrashProtectorNotification:
            [NSObject la_enableNotificationProtector];
            break;
        case LACrashProtectorTimer:
            [NSTimer la_enableTimerProtector];
            break;
        case LACrashProtectorContainer: {
            [NSArray la_enableArrayProtector];
            [NSMutableArray la_enableMutableArrayProtector];
            
            [NSDictionary la_enableDictionaryProtector];
            [NSMutableDictionary la_enableMutableDictionaryProtector];
        }
            break;
        case LACrashProtectorString: {
            [NSString la_enableStringProtector];
            [NSMutableString la_enableMutableStringProtector];
            
            [NSAttributedString la_enableAttributedStringProtector];
            [NSMutableAttributedString la_enableMutableAttributedStringProtector];
        }
            break;
            
        default:
            break;
    }
}

//+ (void)configCrashProtectorServices:(NSArray *)protectorTypes {
//    
//    for (NSNumber *numb in protectorTypes) {
//        
//        [self configCrashProtectorService:[numb integerValue]];
//    }
//}

+ (void)_startAllComponents {
    [NSObject la_enableSelectorProtector];
    [NSObject la_enableKVOProtector];//  如果它本身就没有添加的话就不要做任何处理
    [NSObject la_enableNotificationProtector]; // 可能会有性能问题，dealloc里面加了判断，系统的每个对象dealloc时都会调用
    
    [NSTimer la_enableTimerProtector];
    [NSArray la_enableArrayProtector];
    [NSMutableArray la_enableMutableArrayProtector];
    
    [NSDictionary la_enableDictionaryProtector];
    [NSMutableDictionary la_enableMutableDictionaryProtector];
    
    [NSString la_enableStringProtector];
    [NSMutableString la_enableMutableStringProtector];
    
    [NSAttributedString la_enableAttributedStringProtector];
    [NSMutableAttributedString la_enableMutableAttributedStringProtector];
}

@end
