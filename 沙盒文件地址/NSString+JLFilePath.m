//
//  NSString+JLFilePath.m
//  06-掌握-小文件下载
//
//  Created by 潘九龙 on 15/8/11.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "NSString+JLFilePath.h"

@implementation NSString (JLFilePath)
- (instancetype)cacheDir
{
    NSString *dir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    return [dir stringByAppendingPathComponent:[self lastPathComponent]];
}
- (instancetype)docDir
{
    NSString *dir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return [dir stringByAppendingPathComponent:[self lastPathComponent]];
}

- (instancetype)tmpDir
{
    NSString *dir = NSTemporaryDirectory();
    return [dir stringByAppendingPathComponent:[self lastPathComponent]];
}
@end
