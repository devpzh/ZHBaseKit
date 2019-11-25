//
//  ZHTableViewSection.m
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/6.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHTableViewSection.h"

@implementation ZHTableViewSection

-(NSMutableArray<ZHBaseCellModel *> *)rowsArray
{
    if (!_rowsArray)
    {
        _rowsArray = [NSMutableArray array];
    }
    
    return _rowsArray;
}

@end
