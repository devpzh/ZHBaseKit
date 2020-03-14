//
//  ZHBaseCollectionView.h
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/25.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHBaseCell.h"
#import "ZHCollectionView.h"


NS_ASSUME_NONNULL_BEGIN
AD_PROTOCOL3(ZHBaseCollectionView, collectionViewDidScroll,scrollViewDidEndDecelerating,collectionViewDidEndDragging)
@interface ZHBaseCollectionView : ZHBaseCell
@property (nonatomic, strong) ZHCollectionView * collectionView;
@property (nonatomic, weak)   UICollectionView * actuallyCollectionView;

///<  reloadData
-(void)reloadData:(NSMutableArray<ZHCollectionViewSection*>*)sectionsArray;
-(void)reloadData;
@end

NS_ASSUME_NONNULL_END
