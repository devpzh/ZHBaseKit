//
//  ZHOneLabelCellModel.m
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/7.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHSingleLabelCellModel.h"

@implementation ZHSingleLabelCellModel
-(instancetype)init
{
    self = [super init];
    if (self)
    {
        self.cellClassName = @"ZHSingleLabelCell";
        self.cellHeight    = 50.0;
    }
    return self;
}
@end
