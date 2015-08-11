//
//  NSDictionary+Log.m
//
//
//  Created by apple on 13/8/10.
//  Copyright (c) 2013年 潘九龙. All rights reserved.
// 字典和数组中中文的输出打印


#import <Foundation/Foundation.h>

@implementation NSDictionary (Log)

- (NSString *)descriptionWithLocale:(id)locale
{
    // 1.定义字符串保存拼接结果
    NSMutableString *strM = [NSMutableString string];
    [strM appendFormat:@"{\n"];
    
    // 2.遍历字典, 拼接字典中的键值对
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t%@:%@\n", key, obj];
    }];
    
    [strM appendFormat:@"}\n"];
    return strM;
}
@end


@implementation NSArray (Log)

- (NSString *)descriptionWithLocale:(id)locale
{

    // 1.定义字符串保存拼接结果
    NSMutableString *strM = [NSMutableString string];
    [strM appendFormat:@"(\n"];
    
    // 2.遍历字典, 拼接字典中的键值对
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@", obj];
    }];
    
    [strM appendFormat:@")\n"];
    return strM;
}

@end
