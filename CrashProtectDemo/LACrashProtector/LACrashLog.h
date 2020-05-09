//
//  LACrashLog.h
//  GridGovernance
//
//  Created by liberty air on 2018/12/15.
//  Copyright © 2018年 liberty air. All rights reserved.
//

#import <Foundation/Foundation.h>

//user can ignore below define
static NSString * _Nullable LACrashDefaultReturnNil = @"This framework default is to return nil to avoid crash.";
static NSString * _Nullable LACrashDefaultReturnIgnore  = @"This framework default is to ignore this operation to avoid crash.";

@interface LACrashLog : NSObject

@property (nonatomic,copy) NSString * _Nullable crashMsg;

- (void)getCrashMsg;

+ (void)printCrashMsg:(NSString *_Nullable)crashMsg;

+ (void)la_noteErrorWithException:(NSException *_Nonnull)exception attachedTODO:(NSString *_Nullable)todo;

@end
