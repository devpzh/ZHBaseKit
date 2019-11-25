//
//  ZHCollectionViewSection.m
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/7.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHCollectionViewSection.h"

@implementation ZHCollectionViewSection

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        self.minimumLineSpacing      = 0;
        self.minimumInteritemSpacing = 0;
        self.edgeInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return self;
}

-(NSMutableArray<ZHBaseCellModel *> *)rowsArray
{
    if (!_rowsArray)
    {
        _rowsArray = [NSMutableArray array];
    }
    
    return _rowsArray;
}

@end
