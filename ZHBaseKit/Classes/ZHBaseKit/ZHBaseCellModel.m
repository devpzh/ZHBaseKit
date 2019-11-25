//
//  ZHBaseCellModel.m
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/6.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHBaseCellModel.h"

@implementation ZHBaseCellModel

-(id)init
{
    self = [super init];
    if(self)
    {
      self.cellWidth =  [UIScreen mainScreen].bounds.size.width;
    }
    return self;
}

@end
