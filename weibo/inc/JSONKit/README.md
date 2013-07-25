JSONKit
=======

json解析库

使用方法：
1）丢入ios项目。
【注意】开启ARC的同学注意.m文件里面的这句话
#error JSONKit does not support Objective-C Automatic Reference Counting (ARC)
解决方法：-fno-objc-arc

2）在要使用json的地方#import "JSONKit.h"引入头文件

3）下面详细说明：

常用的方法，有下面几个： 
- (id)objectFromJSONString
- (id)objectFromJSONStringWithParseOptions:(JKParseOptionFlags)parseOptionFlags
- (id)objectFromJSONData
- (id)objectFromJSONDataWithParseOptions:(JKParseOptionFlags)parseOptionFlags

