//
//  ZHBaseCollectionViewModel.h
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/25.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHBaseCellModel.h"
#import "ZHCollectionViewSection.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZHBaseCollectionViewModel : ZHBaseCellModel

///< 默认分组
@property (nonatomic, strong) ZHCollectionViewSection * defaultSection;

///< 分组，默认一组 defaultSection
@property (nonatomic,strong)  NSMutableArray <ZHCollectionViewSection *>* sectionsArray;


///< default is UICollectionViewScrollDirectionHorizontal
@property (nonatomic,assign)  UICollectionViewScrollDirection scrollDirection;

///<  TableView contentOffset
@property (nonatomic,assign)  CGPoint contentOffset;

///<  pagingEnabled
@property (nonatomic,assign)  BOOL pagingEnabled;

///<  是否开启contentOffset记忆功能，default no.
@property (nonatomic,assign)  BOOL openOffsetMemoryFunction;

///<  CollectionView 是否可滚动，default yes
@property(nonatomic,assign)   BOOL scrollEnabled;

///<  default no.
@property(nonatomic,assign)   BOOL showsHorizontalScrollIndicator;

///<  default no
@property(nonatomic,assign)   BOOL showsVerticalScrollIndicator;


@end

NS_ASSUME_NONNULL_END
