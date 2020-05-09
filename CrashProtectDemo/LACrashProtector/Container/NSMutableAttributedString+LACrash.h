//
//  NSMutableAttributedString+LACrash.h
//  Fangche
//
//  Created by liberty air on 2018/12/21.
//  Copyright © 2018年 liberty air. All rights reserved.
//

/**
 *  Can avoid crash method
 *
 *  1.- (instancetype)initWithString:(NSString *)str
 *  2.- (instancetype)initWithString:(NSString *)str attributes:(NSDictionary<NSString *,id> *)attrs
 */
#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (LACrash)

+ (void)la_enableMutableAttributedStringProtector;

@end
