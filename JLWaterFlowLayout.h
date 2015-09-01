//
//  JLWaterFlowLayout.h
//  JLWaterFlow
//
//  Created by 潘九龙 on 15/8/31.
//  Copyright (c) 2015年 潘九龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JLWaterFlowLayout;

@protocol JLWaterflowLayoutDelegate <NSObject>

- (CGFloat)waterflowLayout:(JLWaterFlowLayout *)waterflowLayout heightForWidth:(CGFloat)width atIndexpath:(NSIndexPath *)indexpath;

@end

@interface JLWaterFlowLayout : UICollectionViewLayout

@property(nonatomic,assign) UIEdgeInsets sectionInset;

@property(nonatomic,assign) CGFloat colMagin;
@property(nonatomic,assign) CGFloat rowMagin;

@property(nonatomic,assign) NSInteger columnsCount;

@property(nonatomic,weak)id<JLWaterflowLayoutDelegate> delegate;
@end
