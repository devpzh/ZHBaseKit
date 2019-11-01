//
//  BaseTableViewModel.m
//  iSport
//
//  Created by pzh on 16/9/23.
//  Copyright © 2016年 me. All rights reserved.
//

#import "BaseTableViewModel.h"

@implementation BaseTableViewModel
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.style = BaseTableViewStyleOneSection;
        self.cellClassName = @"BaseTableView";
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.scrollEnabled = YES;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
    }
    return self;
}

#pragma mark - Lazy Loading

- (NSMutableArray *)sourceArray
{
    if (!_sourceArray)
    {
        _sourceArray = [NSMutableArray array];
    }
    return _sourceArray;
}

- (NSMutableArray *)sectionArray
{
    if (!_sectionArray)
    {
        _sectionArray = [NSMutableArray array];
    }
    return _sectionArray;
}


- (NSMutableArray *)sectionHeadArray
{
    if (!_sectionHeadArray)
    {
        _sectionHeadArray = [NSMutableArray array];
    }
    return _sectionHeadArray;
}


- (NSMutableArray *)sectionFooterArray
{
    if (!_sectionFooterArray)
    {
        _sectionFooterArray = [NSMutableArray array];
    }
    return _sectionFooterArray;
}

@end
