# CrashProtector
一个无侵入的 iOS crash 防护框架，基于 Swizzle Method 的 Crash 防护。能有效的防止代码潜在的crash，自动在app运行时实时捕获导致app崩溃的破环因子，使app避免崩溃，照样可以继续正常运行。
### 保护以下常见的崩溃
- unrecognized selector crash
- KVO、KVC crash
- NSNotification crash
- NSTimer crash
- Container crash（数组越界，插nil，字典objc、key为nil等）
- NSString crash（字符串截取越界等）
- NSAttributedString
### 使用方法
导入头文件：#import "LACrashProtectorManager.h"
```
/**
 启动所有组件
 */
+ (void)makeAllEffective;


/**
 单独启动组件

 @param protectorType 启动的组件类型
 */
+ (void)configCrashProtectorService:(LACrashProtectorStyle)protectorType;
```

![image](https://github.com/libertyAir/readmeImgs/blob/master/CrashProtectorImg/capture.png)

