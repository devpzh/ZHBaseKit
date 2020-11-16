//
//  ZHBaseCollectionBoard.m
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/7.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHBaseCollectionBoard.h"

@interface ZHBaseCollectionBoard ()<ZHCollectionViewDelegate>

@end

@implementation ZHBaseCollectionBoard

-(void)onViewCreate
{
    [super onViewCreate];
    
}

-(void)onViewLayOut
{
    [super onViewLayOut];
    self.collectionView.frame = CGRectMake(0,
                                  kNavigationBarHeight,
                                  kScreenWidth,
                                  kScreenHeight- kNavigationBarHeight);
}

#pragma mark --- ZHCollectionViewDelegate

-(UICollectionViewFlowLayout *)onCustomFlowLayout
{
   return nil;
}

#pragma mark --- Lazy Loading
-(ZHCollectionView *)collectionView
{
    if (!_collectionView)
    {
        _collectionView = [[ZHCollectionView alloc]init];
        _collectionView.delegate = self;
        [_collectionView onConfig];
        _collectionView.sectionsArray = self.sectionsArray;
        [self.view addSubview:_collectionView];
    }
    
    return _collectionView;
}


-(NSMutableArray<ZHCollectionViewSection *> *)sectionsArray
{
    if (!_sectionsArray)
    {
        _sectionsArray = [NSMutableArray array];
        [_sectionsArray addObject:self.defaultSection];
    }
    return _sectionsArray;
}

-(ZHCollectionViewSection *)defaultSection
{
    if (!_defaultSection)
    {
        _defaultSection = [[ZHCollectionViewSection alloc]init];
    }
    
    return _defaultSection;
}

@end
