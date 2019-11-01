//
//
//  BaseCollectionBoard.h
//  FitnessNews
//
//  Created by apple on 16/3/5.
//  Copyright © 2016年 com.e-mxing. All rights reserved.
//
#import "BaseBoard.h"

@interface BaseCollectionBoard : BaseBoard
<
UICollectionViewDataSource,UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout
>

@property(nonatomic,strong) NSMutableArray *dataSource;
@property(nonatomic,strong) UICollectionView*   collectionView;
@property(nonatomic,strong) UICollectionViewFlowLayout*  flowLayout;

@property(nonatomic,assign) UIEdgeInsets insets;
@property(nonatomic,assign) CGFloat minimumLineSpacing;
@property(nonatomic,assign) CGFloat minimumInteritemSpacing;

-(void)onCreateFlowLayout;
@end
