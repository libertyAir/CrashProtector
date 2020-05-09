//
//  NSObject+KVOCrash.h
//  GridGovernance
//
//  Created by liberty air on 2018/12/14.
//  Copyright © 2018年 liberty air. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LAKVOInfo;

typedef void (^LAKVONotificationBlock)(id _Nullable observer, id _Nullable object, NSDictionary<NSKeyValueChangeKey, id> * _Nullable change);
/**
 KVO的管理者
 KVO Crash fix
 */
@interface KVOProxy :NSObject

- (BOOL)la_addObserver:(id _Nullable )object KVOinfo:(LAKVOInfo *_Nullable)KVOInfo;

- (void)la_removeObserver:(id _Nullable )object keyPath:(NSString *_Nullable)keyPath block:(void(^_Nullable)(void)) block;

- (void)la_removeAllObserver;

@end


/**
 KVO配置层
 */
@interface LAKVOInfo : NSObject

- (instancetype _Nullable )initWithKeyPath:(NSString *_Nullable)keyPath options:(NSKeyValueObservingOptions)options context:(void *_Nullable)context;

@end

@interface NSObject (KVOCrash)

@property (nonatomic, strong) KVOProxy * _Nullable KVOProxy;

+ (void)la_enableKVOProtector;

@end
