//
//  NSMutableArray+LACrash.h
//  Fangche
//
//  Created by liberty air on 2018/12/19.
//  Copyright © 2018年 liberty air. All rights reserved.
//


/**
 *  Can avoid crash method
 *
 *  1. - (id)objectAtIndex:(NSUInteger)index
 *  2. - (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx
 *  3. - (void)removeObjectAtIndex:(NSUInteger)index
 *  4. - (void)insertObject:(id)anObject atIndex:(NSUInteger)index
 *  5. - (void)getObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range
 */
#import <Foundation/Foundation.h>

@interface NSMutableArray (LACrash)

+ (void)la_enableMutableArrayProtector;

@end
