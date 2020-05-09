//
//  LACrashProtectorManager.h
//  GridGovernance
//
//  Created by liberty air on 2018/12/14.
//  Copyright © 2018年 liberty air. All rights reserved.
//

/**
 ** 建议实际开发的时候关闭该组件，以便及时发现crash bug，需要上架或者演示的时候开启crash防护组件。 **
 *  该组件会占用一定内存，不过正常情况下不影响性能
 */

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LACrashProtectorStyle) {
    LACrashProtectorNone = 0,
    LACrashProtectorAll ,
    LACrashProtectorUnrecognizedSelector,
    LACrashProtectorKVO ,
    LACrashProtectorNotification ,
    LACrashProtectorTimer ,
    LACrashProtectorContainer ,
    LACrashProtectorString ,
};

@interface LACrashProtectorManager : NSObject

@property(nonatomic,assign) LACrashProtectorStyle style;


/**
 启动所有组件
 */
+ (void)makeAllEffective;


/**
 单独启动组件

 @param protectorType 启动的组件类型
 */
+ (void)configCrashProtectorService:(LACrashProtectorStyle)protectorType;



/**
 启动一组组件

 @param protectorTypes 启动的组件类型数组
 */
//+ (void)configCrashProtectorServices:(NSArray *)protectorTypes;

@end
