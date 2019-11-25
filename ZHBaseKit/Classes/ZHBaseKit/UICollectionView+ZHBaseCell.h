//
//  UICollectionView+ZHBaseCell.h
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/7.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static NSInteger  const kCollectionViewContentCellTag                    = 10000;
static NSInteger  const kCollectionViewSectionHeaderFooterViewTag        = 10001;

@interface UICollectionView (ZHBaseCell)

+ (UICollectionViewCell *)adCollectionView:(UICollectionView *)collectionView
                    cellForItemAtIndexPath:(NSIndexPath *)indexPath
                                     Class:(NSString*)className;


+ (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath Class:(NSString*)className;

@end

NS_ASSUME_NONNULL_END
