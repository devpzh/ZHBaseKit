//
//  ZHBaseTableViewModel.m
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/7.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHBaseTableViewModel.h"

@implementation ZHBaseTableViewModel

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        self.cellClassName = @"ZHBaseTableView";
        self.scrollEnabled = YES;
        self.openOffsetMemoryFunction    = NO;
        self.showVerticalScrollIndicator = NO;
        self.showHorizontalScrollIndicator = NO;
    }
    
    return self;
}


-(NSMutableArray<ZHTableViewSection *> *)sectionsArray
{
    if (!_sectionsArray)
    {
        _sectionsArray = [NSMutableArray array];
        [_sectionsArray addObject:self.defaultSection];
    }
    return _sectionsArray;
}

-(ZHTableViewSection *)defaultSection
{
    if (!_defaultSection)
    {
        _defaultSection = [[ZHTableViewSection alloc]init];
    }
    return _defaultSection;
}


@end
