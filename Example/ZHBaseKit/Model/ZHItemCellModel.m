//
//  ZHItemCellModel.m
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/8.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHItemCellModel.h"

@implementation ZHItemCellModel
-(instancetype)init
{
    self = [super init];
    if (self)
    {
        self.cellClassName = @"ZHItemCell";
        self.cellWidth =  (kScreemWidth-40)/3-0.5;
        self.cellHeight = self.cellWidth;
    }
    return self;
}
@end
