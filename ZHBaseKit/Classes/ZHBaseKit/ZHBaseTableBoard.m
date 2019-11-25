//
//  ZHBaseTableBoard.m
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/6.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHBaseTableBoard.h"


@interface ZHBaseTableBoard ()

@end

@implementation ZHBaseTableBoard

-(void)onViewCreate
{
    [super onViewCreate];
}


-(void)onViewLayOut
{
    [super onViewLayOut];
    self.tableView.frame = CGRectMake(0,
                                  kNavigationBarHeight,
                                  kScreemWidth,
                                  kScreemHeight- kNavigationBarHeight);
}



-(ZHTableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[ZHTableView alloc]init];
        _tableView.sectionsArray = self.sectionsArray;
        [self.view addSubview:_tableView];
    }
    return _tableView;
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
