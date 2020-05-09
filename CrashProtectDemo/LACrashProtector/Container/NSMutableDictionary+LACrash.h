//
//  NSMutableDictionary+LACrash.h
//  Fangche
//
//  Created by liberty air on 2018/12/21.
//  Copyright © 2018年 liberty air. All rights reserved.
//

/**
 * setValue forKey 的值可设置nil，不会crash
 *
 *  Can avoid crash method
 *
 *  1. - (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey
 *  2. - (void)removeObjectForKey:(id)aKey
 *
 */


#import <Foundation/Foundation.h>

@interface NSMutableDictionary (LACrash)

+ (void)la_enableMutableDictionaryProtector;

@end
