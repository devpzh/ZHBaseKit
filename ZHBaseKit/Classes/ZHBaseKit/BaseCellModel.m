//
//  BaseCellModel.m
//
//  Created by pzh on 16/9/23.
//  Copyright © 2016年 me. All rights reserved.
//

#import "BaseCellModel.h"

@implementation BaseCellModel
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
