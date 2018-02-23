//
//  WaterLayout.h
//  WaterfallDemo
//
//  Created by chenyun on 2018/2/23.
//  Copyright © 2018年 yctc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WaterLayout;

/**
 * 代理传值
 */
@protocol WaterLayoutDelegate <NSObject>

@required
- (CGFloat)waterflowLayout:(WaterLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth;

@optional
/**
 * 设置瀑布流的列数
 */
- (CGFloat)columnCountInWaterflowLayout:(WaterLayout *)waterflowLayout;
/**
 * 设置瀑布流列的间距
 */
- (CGFloat)columnMarginInWaterflowLayout:(WaterLayout *)waterflowLayout;
/**
 * 设置瀑布流行的间距
 */
- (CGFloat)rowMarginInWaterflowLayout:(WaterLayout *)waterflowLayout;
/**
 * 设置瀑布流边缘（四周）的间隙
 */
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(WaterLayout *)waterflowLayout;

@end

@interface WaterLayout : UICollectionViewLayout

@property (nonatomic , weak) id<WaterLayoutDelegate> delegate;

@end
