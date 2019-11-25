//
//  ZHCollectionView.m
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/7.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHCollectionView.h"
#import "ZHCollectionViewIMP.h"
#import "ZHProxy.h"

@interface ZHCollectionView()
@property (nonatomic, strong) ZHCollectionViewIMP * imp;
@property (nonatomic, strong) ZHProxy             * proxy;
@end

@implementation ZHCollectionView

-(void)onConfig
{
    [self collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
}

-(void)setSectionsArray:(NSMutableArray<ZHCollectionViewSection *> *)sectionsArray
{
    _sectionsArray = sectionsArray;
    self.imp.sectionsArray = _sectionsArray;
    
}

-(void)reloadData
{
    [self.collectionView reloadData];
}


- (void)onScrollDirection:(UICollectionViewScrollDirection)direction
{
    if (self.flowLayout.scrollDirection != direction)
    {
        self.flowLayout.scrollDirection = direction;
    }
    
}

- (void)addDelegate:(id<UICollectionViewDelegate>)delegate
{
    [self.proxy addTarget:delegate];
}

- (void)removeDelegate:(id<UICollectionViewDelegate>)delegate
{
    [self.proxy removeTarget:delegate];
}

- (void)addDataSource:(id<UICollectionViewDataSource>)dataSource
{
    [self.proxy addTarget:dataSource];
}

- (void)removeDataSource:(id<UICollectionViewDataSource>)dataSource
{
    [self.proxy removeTarget:dataSource];
}


#pragma mark --- Lazy Loading
-(UICollectionViewFlowLayout *)flowLayout
{
    if (!_flowLayout)
    {
        if (self.delegate && [self.delegate respondsToSelector:@selector(onCustomFlowLayout)])
        {
            if ([self.delegate onCustomFlowLayout])
            {
                 _flowLayout = [self.delegate onCustomFlowLayout];
            }else
            {
                _flowLayout = [[UICollectionViewFlowLayout alloc]init];
                _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
            }
        
        }else
        {
            _flowLayout = [[UICollectionViewFlowLayout alloc]init];
            _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        }
    }
    
    return _flowLayout;
}


-(UICollectionView *)collectionView
{
    if (!_collectionView)
    {
       _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.flowLayout];
       _collectionView.delegate   = (id<UICollectionViewDelegate>)   self.proxy;
       _collectionView.dataSource = (id<UICollectionViewDataSource>) self.proxy;
       _collectionView.backgroundColor = [UIColor clearColor];
       _collectionView.showsHorizontalScrollIndicator = NO;
        if (@available (iOS 11.0, *)) {
               _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        
       [self addSubview:_collectionView];
        
    }
    
    return _collectionView;
    
}

-(ZHProxy *)proxy
{
    if (!_proxy)
    {   _proxy = [[ZHProxy alloc]init];
        [_proxy addTarget:self.imp];
    }
    return _proxy;
}

-(ZHCollectionViewIMP *)imp
{
    if (!_imp)
    {
        _imp = [[ZHCollectionViewIMP alloc]init];
    }
    return _imp;
}


@end
