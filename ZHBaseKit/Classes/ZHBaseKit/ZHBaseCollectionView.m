//
//  ZHBaseCollectionView.m
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/25.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHBaseCollectionView.h"
#import "ZHBaseCollectionViewModel.h"

@interface ZHBaseCollectionView() <UICollectionViewDelegate>

@end

@implementation ZHBaseCollectionView

-(void)onLoad
{
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}


-(void)dataDidChanged
{
    if (!self.data) return;
    
    ZHBaseCollectionViewModel * model = (ZHBaseCollectionViewModel*)self.data;
    self.collectionView.delegate = model.delegate;
    [self.collectionView onConfig];
    [self.collectionView onScrollDirection:model.scrollDirection];
    if (model.openOffsetMemoryFunction)
    {
       self.collectionView.collectionView.contentOffset = model.contentOffset;
    }
    self.collectionView.collectionView.pagingEnabled = model.pagingEnabled;
    self.collectionView.collectionView.showsHorizontalScrollIndicator = model.showsHorizontalScrollIndicator;
    self.collectionView.collectionView.showsVerticalScrollIndicator = model.showsVerticalScrollIndicator;
    self.collectionView.collectionView.scrollEnabled = model.scrollEnabled;
    [self reloadData:model.sectionsArray];
    
}


-(void)reloadData:(NSMutableArray<ZHCollectionViewSection*>*)sectionsArray
{
    self.collectionView.sectionsArray = sectionsArray;
    [self.collectionView reloadData];
}

-(void)reloadData
{
    [self.collectionView reloadData];
}

#pragma mark - UIScrollview delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    ZHBaseCollectionViewModel * collectionViewModel = (ZHBaseCollectionViewModel *)self.data;
    if (collectionViewModel.openOffsetMemoryFunction)
    {
        collectionViewModel.contentOffset = scrollView.contentOffset;
    }
  
    DEF_PROTOCOL(ZHBaseCollectionView, scrollViewDidEndDecelerating, scrollView);
    
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    ZHBaseCollectionViewModel *collectionViewModel = (ZHBaseCollectionViewModel *)self.data;
   
    if (!decelerate && collectionViewModel.openOffsetMemoryFunction)
    {
       collectionViewModel.contentOffset = scrollView.contentOffset;
    }
   
    DEF_PROTOCOL(ZHBaseCollectionView, collectionViewDidEndDragging, @(decelerate))
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{

     DEF_PROTOCOL(ZHBaseCollectionView, collectionViewDidScroll, scrollView);
    
}


#pragma mark --- Lazy Loading
-(UICollectionView *)actuallyCollectionView
{
    return self.collectionView.collectionView;
}

-(ZHCollectionView *)collectionView
{
    if (!_collectionView)
    {
        _collectionView = [[ZHCollectionView alloc]init];
        [_collectionView addDelegate:self];
        [self addSubview:_collectionView];
    }
    
    return _collectionView;
}


- (void)dealloc
{
    if (_collectionView)
    {
        [_collectionView removeDelegate:self];
    }
    
}

@end
