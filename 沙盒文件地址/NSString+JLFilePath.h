//
//  NSString+JLFilePath.h
//  06-掌握-小文件下载
//
//  Created by 潘九龙 on 15/8/11.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JLFilePath)
/**
 *  生成缓存目录全路径
 */
- (instancetype)cacheDir;
/**
 *  生成文档目录全路径
 */
- (instancetype)docDir;
/**
 *  生成临时目录全路径
 */
- (instancetype)tmpDir;
@end
