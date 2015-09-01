//
//  JLWaterFlowLayout.m
//  JLWaterFlow
//
//  Created by 潘九龙 on 15/8/31.
//  Copyright (c) 2015年 潘九龙. All rights reserved.
//

#import "JLWaterFlowLayout.h"

@interface JLWaterFlowLayout ()

/**存放每一列最大的y值*/
@property (nonatomic,strong) NSMutableDictionary *maxYDict;

/***/
@property (nonatomic,strong) NSMutableArray *attrsArray;
@end

@implementation JLWaterFlowLayout
- (NSMutableDictionary *)maxYDict
{
    if (_maxYDict == nil) {
        _maxYDict = [NSMutableDictionary dictionary];
        }
    return _maxYDict;
}
- (NSMutableArray *)attrsArray
{
    if (_attrsArray == nil) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}
-(instancetype)init
{
    if (self = [super init]) {
        self.colMagin = 10;
        self.rowMagin = 10;
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        self.columnsCount = 3;
    }
    return self;
}

//每次布局钱的准备
- (void)prepareLayout
{
    [super prepareLayout];
    
    //1.清空最大的Y值
    for (int i = 0; i < self.columnsCount ; i ++) {
        NSString *column = [NSString stringWithFormat:@"%d", i];
        self.maxYDict[column] = @"0";
    }
   
    //2.计算所有cell的属性
    [self.attrsArray removeAllObjects];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i< count; i++) {
        
        UICollectionViewLayoutAttributes *att = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [self.attrsArray addObject:att];
    }
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //假设最短的一列为第0列
   __block NSString *minColumn = @"0";
    
    //找出最短的那一列
    [self.maxYDict enumerateKeysAndObjectsUsingBlock:^(NSString * column, NSNumber *maxY, BOOL *stop) {
        if([maxY floatValue] < [self.maxYDict[minColumn] floatValue]){
            minColumn = column;
        }
    }];
    
    //计算宽度
    CGFloat width = (self.collectionView.frame.size.width - self.sectionInset.left - self.sectionInset.right - self.colMagin * (self.columnsCount - 1))/self.columnsCount;
    
    CGFloat height = [self.delegate waterflowLayout:self heightForWidth:width atIndexpath:indexPath];
    
    //计算位置
    CGFloat x = self.sectionInset.left + (width + self.columnsCount) * [minColumn intValue];
    CGFloat y = [self.maxYDict[minColumn] floatValue] +self.rowMagin;
    
    //更新这一列的最大y值
    self.maxYDict[minColumn] = @(y + height);
    
    //创建属性
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attrs.frame = CGRectMake(x, y, width, height);
    
    return attrs;
}
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
    return self.attrsArray;
}

- (CGSize)collectionViewContentSize
{

    __block NSString *maxColumn = @"0";
    
    //找出最短的那一列
    [self.maxYDict enumerateKeysAndObjectsUsingBlock:^(NSString * column, NSNumber *maxY, BOOL *stop) {
        if([maxY floatValue] > [self.maxYDict[maxColumn] floatValue]){
            maxColumn = column;
        }
    }];
    return CGSizeMake(0, [self.maxYDict[maxColumn] floatValue]);
}
@end
