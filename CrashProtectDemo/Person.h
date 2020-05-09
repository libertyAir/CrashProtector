//
//  Person.h
//  CrashProtectDemo
//
//  Created by liberty air on 2020/5/9.
//  Copyright © 2020 liberty air. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

+ (instancetype)initWithName:(NSString *)name;
- (instancetype)initWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
