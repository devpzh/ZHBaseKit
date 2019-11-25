//
//  ZHBaseCollectionViewModel.m
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/25.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHBaseCollectionViewModel.h"

@implementation ZHBaseCollectionViewModel

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        self.cellClassName = @"ZHBaseCollectionView";
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.scrollEnabled = YES;
       
    }
    return self;
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
