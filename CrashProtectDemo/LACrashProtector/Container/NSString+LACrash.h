//
//  NSString+LACrash.h
//  Fangche
//
//  Created by liberty air on 2018/12/21.
//  Copyright © 2018年 liberty air. All rights reserved.
//

/**
 *  Can avoid crash method
 *
 *  1. - (unichar)characterAtIndex:(NSUInteger)index
 *  2. - (NSString *)substringFromIndex:(NSUInteger)from
 *  3. - (NSString *)substringToIndex:(NSUInteger)to {
 *  4. - (NSString *)substringWithRange:(NSRange)range {
 *  5. - (NSString *)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement
 *  6. - (NSString *)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange
 *  7. - (NSString *)stringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement
 *
 
 stringByReplacingOccurrencesOfString:withString: 实际调用的是stringByReplacingOccurrencesOfString:withString:options:range:

 
 
 
 */
#import <Foundation/Foundation.h>

@interface NSString (LACrash)

+ (void)la_enableStringProtector;

@end
