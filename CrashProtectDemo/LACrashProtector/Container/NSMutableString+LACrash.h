//
//  NSMutableString+LACrash.h
//  Fangche
//
//  Created by liberty air on 2018/12/21.
//  Copyright © 2018年 liberty air. All rights reserved.
//

/**
 *  Can avoid crash method
 *
 *  1. 由于NSMutableString是继承于NSString,所以这里和NSString有些同样的方法就不重复写了
 *  2. - (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)aString
 *  3. - (void)insertString:(NSString *)aString atIndex:(NSUInteger)loc
 *  4. - (void)deleteCharactersInRange:(NSRange)range
 *
 */
#import <Foundation/Foundation.h>

@interface NSMutableString (LACrash)

+ (void)la_enableMutableStringProtector;

@end
