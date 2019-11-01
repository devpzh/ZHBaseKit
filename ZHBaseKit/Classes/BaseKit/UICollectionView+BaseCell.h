//
//  Created by pzh on 16/9/23.
//  Copyright © 2016年 me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCellModel.h"
#import "BaseCell.h"

static NSInteger const kyjCellContentTag      = 10000;
static NSInteger const kyjHeadFootResuableTag = 20000;

@class BaseCellModel;
@interface UICollectionView (BaseCell)

+ (UICollectionViewCell *)adCollectionView:(UICollectionView *)collectionView
                    cellForItemAtIndexPath:(NSIndexPath *)indexPath
                                     Class:(NSString*)className;

+ (UICollectionViewCell *)adCollectionView:(UICollectionView *)collectionView
cellForItemAtIndexPath:(NSIndexPath *)indexPath
                 model:(BaseCellModel*)model;


+ (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath Class:(NSString*)className;



@end
