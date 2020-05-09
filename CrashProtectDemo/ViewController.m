//
//  ViewController.m
//  CrashProtectDemo
//
//  Created by liberty air on 2020/5/7.
//  Copyright © 2020 liberty air. All rights reserved.
//

#import "ViewController.h"
#import "LACrashProtectorManager.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [LACrashProtectorManager makeAllEffective];
    
//    [self executeTestMethods];
}

- (IBAction)executeTestMethods {
    
    [self NSArray_Test_InstanceArray];
    [self NSArray_Test_ObjectAtIndex];
    [self NSArray_Test_objectsAtIndexes];
    [self NSArray_Test_getObjectsRange];


    [self NSMutableArray_Test_ObjectAtIndex];
    [self NSMutableArray_Test_SetObjectAtIndex];
    [self NSMutableArray_Test_RemoveObjectAtIndex];
    [self NSMutableArray_Test_InsertObjectAtIndex];
    [self NSMutableArray_Test_GetObjectsRange];


    [self NSDictionary_Test_InstanceDictionary];
    [self NSMutableDictionary_Test_SetObjectForKey];
    [self NSMutableDictionary_Test_RemoveObjectForKey];


    [self NSString_Test_CharacterAtIndex];
    [self NSString_Test_SubstringFromIndex];
    [self NSString_Test_SubstringToIndex];
    [self NSString_Test_SubstringWithRange];
    
    [self testNoSelectorCrash];
}


//=================================================================
//              unrecognized selector sent to instance
//=================================================================
#pragma mark - unrecognized selector sent to instance
/**
 测试没有selector的crash
 */
- (void)testNoSelectorCrash {
    //测试
//    id testCrash;
//    testCrash = [testCrash initWithName:@"lll"];
    Person *person1 = [[Person alloc] initWithName:@"lll"];
    
    //测试
    Person *person2 = [Person new];
    [person2 performSelector:@selector(testCrash)];
    
}

//=================================================================
//                         NSArray_Test
//=================================================================
#pragma mark - NSArray_Test

- (void)NSArray_Test_InstanceArray {
    NSString *nilStr = nil;
    NSArray *array = @[@"james", nilStr, @"iOSDeveloper"];
    NSLog(@"%@",array);
}

- (void)NSArray_Test_ObjectAtIndex {
    NSArray *arr = @[@"james", @"iOSDeveloper"];
    
    NSObject *object = arr[100];
    //    NSObject *object = [arr objectAtIndex:100];
    
    NSLog(@"object = %@",object);
}

- (void)NSArray_Test_objectsAtIndexes {
    NSArray *array = @[@"james"];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:100];
    [array objectsAtIndexes:indexSet];
    
}

- (void)NSArray_Test_getObjectsRange {
    
    NSArray *array = @[@"1", @"2", @"3"];//__NSArrayI
    
    //NSArray *array = @[@"1"];//__NSSingleObjectArrayI
    
    //NSArray *array = @[];//NSArray
    
    NSRange range = NSMakeRange(0, 11);
    __unsafe_unretained id cArray[range.length];
    
    
    [array getObjects:cArray range:range];
    
}


//=================================================================
//                       NSMutableArray_Test
//=================================================================
#pragma mark - NSMutableArray_Test

- (void)NSMutableArray_Test_ObjectAtIndex {
    NSMutableArray *array = @[@"james"].mutableCopy;
    NSObject *object = array[2];
    //NSObject *object = [array objectAtIndex:20];
    NSLog(@"object = %@",object);
}

- (void)NSMutableArray_Test_SetObjectAtIndex {
    NSMutableArray *array = @[@"james"].mutableCopy;
    array[3] = @"iOS";
}

- (void)NSMutableArray_Test_RemoveObjectAtIndex {
    NSMutableArray *array = @[@"james", @"iOSDeveloper"].mutableCopy;
    [array removeObjectAtIndex:5];
}

- (void)NSMutableArray_Test_InsertObjectAtIndex {
    
    NSMutableArray *array = @[@"james"].mutableCopy;
    
    //test1    beyond bounds
    [array insertObject:@"cool" atIndex:5];
    
    
    //test2    insert nil obj
    
    //[array insertObject:nil atIndex:0];
    
    //test3    insert nil obj
    
    //NSString *nilStr = nil;
    //[array addObject:nilStr]; //其本质是调用insertObject:
}

- (void)NSMutableArray_Test_GetObjectsRange {
    NSMutableArray *array = @[@"james", @"iOSDeveloper"].mutableCopy;
    
    NSRange range = NSMakeRange(0, 11);
    __unsafe_unretained id cArray[range.length];
    
    
    [array getObjects:cArray range:range];
}


//=================================================================
//                       NSDictionary_Test
//=================================================================
#pragma mark - NSDictionary_Test

- (void)NSDictionary_Test_InstanceDictionary {
    NSString *nilStr = nil;
    NSDictionary *dict = @{
                           @"name" : @"james",
                           @"age" : nilStr
                           };
    NSLog(@"%@",dict);
}

//=================================================================
//                       NSMutableDictionary_Test
//=================================================================
#pragma mark - NSMutableDictionary_Test

- (void)NSMutableDictionary_Test_SetObjectForKey {
    
    NSMutableDictionary *dict = @{
                                  @"name" : @"james"
                                  
                                  }.mutableCopy;
    NSString *ageKey = nil;
    dict[ageKey] = @(25);
    NSLog(@"%@",dict);
}

- (void)NSMutableDictionary_Test_RemoveObjectForKey {
    
    NSMutableDictionary *dict = @{
                                  @"name" : @"james",
                                  @"age" : @(25)
                                  
                                  }.mutableCopy;
    NSString *key = nil;
    [dict removeObjectForKey:key];
    
    NSLog(@"%@",dict);
}


//=================================================================
//                       NSString_Test
//=================================================================
#pragma mark - NSString_Test

- (void)NSString_Test_CharacterAtIndex {
    NSString *str = @"james";
    
    unichar characteristic = [str characterAtIndex:100];
    NSLog(@"--%c--",characteristic);
}

- (void)NSString_Test_SubstringFromIndex {
    NSString *str = @"james";
    
    NSString *subStr = [str substringFromIndex:100];
    NSLog(@"%@",subStr);
}

- (void)NSString_Test_SubstringToIndex {
    NSString *str = @"james";
    
    NSString *subStr = [str substringToIndex:100];
    NSLog(@"%@",subStr);
}

- (void)NSString_Test_SubstringWithRange {
    NSString *str = @"james";
    
    NSRange range = NSMakeRange(0, 100);
    NSString *subStr = [str substringWithRange:range];
    NSLog(@"%@",subStr);
}

- (void)NSString_Test_StringByReplacingOccurrencesOfString {
    NSString *str = @"james";
    
    NSString *nilStr = nil;
    str = [str stringByReplacingOccurrencesOfString:nilStr withString:nilStr];
    NSLog(@"1 %@",str);
}

- (void)NSString_Test_StringByReplacingOccurrencesOfStringRange {
    NSString *str = @"james";
    
    NSRange range = NSMakeRange(0, 1000);
    str = [str stringByReplacingOccurrencesOfString:@"j" withString:@"" options:NSCaseInsensitiveSearch range:range];
    NSLog(@"2 %@",str);
}

- (void)NSString_Test_stringByReplacingCharactersInRangeWithString {
    NSString *str = @"james";
    
    NSRange range = NSMakeRange(0, 1000);
    str = [str stringByReplacingCharactersInRange:range withString:@"cff"];
    NSLog(@"3 %@",str);
}


//=================================================================
//                       NSMutableString_Test
//=================================================================
#pragma mark - NSMutableString_Test

- (void)NSMutableString_Test_ReplaceCharactersInRange {
    NSMutableString *strM = [NSMutableString stringWithFormat:@"james"];
    NSRange range = NSMakeRange(0, 1000);
    [strM replaceCharactersInRange:range withString:@"--"];
}

- (void)NSMutableString_Test_InsertStringAtIndex{
    NSMutableString *strM = [NSMutableString stringWithFormat:@"james"];
    [strM insertString:@"cool" atIndex:1000];
}


- (void)NSMutableString_TestDeleteCharactersInRange{
    NSMutableString *strM = [NSMutableString stringWithFormat:@"james"];
    NSRange range = NSMakeRange(0, 1000);
    [strM deleteCharactersInRange:range];
}

//=================================================================
//                      NSAttributedString_Test
//=================================================================
#pragma mark - NSAttributedString_Test

- (void)NSAttributedString_Test_InitWithString {
    NSString *str = nil;
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str];
    NSLog(@"%@",attributeStr);
}

- (void)NSAttributedString_Test_InitWithAttributedString {
    NSAttributedString *nilAttributedStr = nil;
    NSAttributedString *attributedStr = [[NSAttributedString alloc] initWithAttributedString:nilAttributedStr];
    NSLog(@"%@",attributedStr);
    
    
}

- (void)NSAttributedString_Test_InitWithStringAttributes {
    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName : [UIColor redColor]
                                 };
    NSString *nilStr = nil;
    NSAttributedString *attributedStr = [[NSAttributedString alloc] initWithString:nilStr attributes:attributes];
    NSLog(@"%@",attributedStr);
}

//=================================================================
//                   NSMutableAttributedString_Test
//=================================================================
#pragma mark - NSMutableAttributedString_Test

- (void)NSMutableAttributedString_Test_InitWithString {
    
    NSString *nilStr = nil;
    NSMutableAttributedString *attrStrM = [[NSMutableAttributedString alloc] initWithString:nilStr];
    NSLog(@"%@",attrStrM);
}

- (void)NSMutableAttributedString_Test_InitWithStringAttributes {
    
    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName : [UIColor redColor]
                                 };
    NSString *nilStr = nil;
    NSMutableAttributedString *attrStrM = [[NSMutableAttributedString alloc] initWithString:nilStr attributes:attributes];
    NSLog(@"%@",attrStrM);
}



- (void)doTimerTest
{
    // 仅用作测试    对于需要重复发消息的timer 不要用局部变量
    NSTimer * timer4 = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(testLog) userInfo:nil repeats:NO];
}

-(void)testLog
{
    NSLog(@"Test time:%s %d",__func__,1);
}

@end
