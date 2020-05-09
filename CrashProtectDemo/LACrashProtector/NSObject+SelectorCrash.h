//
//  NSObject+SelectorCrash.h
//  GridGovernance
//
//  Created by liberty air on 2018/12/14.
//  Copyright © 2018年 liberty air. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LAUnrecognizedSelectorSolveObject : NSObject

@property (nonatomic, weak) NSObject *objc;

@end

@interface NSObject (SelectorCrash)

+ (void)la_enableSelectorProtector;

@end
