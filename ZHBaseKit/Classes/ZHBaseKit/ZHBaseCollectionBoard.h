//
//  ZHBaseCollectionBoard.h
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/7.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHBaseBoard.h"
#import "ZHCollectionView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZHBaseCollectionBoard : ZHBaseBoard

@property (nonatomic, strong) ZHCollectionView * collectionView;
@property (nonatomic, strong) NSMutableArray <ZHCollectionViewSection*>* sectionsArray;
@property (nonatomic, strong) ZHCollectionViewSection * defaultSection;


///< 自定义 flowLayout
-(UICollectionViewFlowLayout *)onCustomFlowLayout;

@end

NS_ASSUME_NONNULL_END
