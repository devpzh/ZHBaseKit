//
//  ZHTableBoard.m
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/6.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHSingleSectionTableBoard.h"
#import "ZHSingleLabelCellModel.h"
#import "ZHSingleLabelCell.h"

@interface ZHSingleSectionTableBoard ()

@end

@implementation ZHSingleSectionTableBoard

-(void)onViewCreate
{
    [super onViewCreate];
    [self showNavigationTitle:@"Single Section Table"];
    [self onConfigUIData];
    
}

-(void)onConfigUIData
{
    
    for (int i = 0; i < 10; i++)
    {
        ZHSingleLabelCellModel * item = [[ZHSingleLabelCellModel alloc]init];
        item.content = [NSString stringWithFormat:@"row = %d",i];
        item.delegate = self;
        [self.defaultSection.rowsArray addObject:item];
    }
    
    ZHSingleLabelCellModel * headerModel = [[ZHSingleLabelCellModel alloc]init];
    headerModel.content = @"头部";
    self.defaultSection.headerModel = headerModel;

    ZHSingleLabelCellModel * footerModel = [[ZHSingleLabelCellModel alloc]init];
    footerModel.content = @"尾部";
    self.defaultSection.footerModel = footerModel;

}

ON_PROTOCOL(ZHSingleLabelCell, Touch, cell, data)
{
    ZHSingleLabelCellModel *  model = (ZHSingleLabelCellModel*)data;
    NSLog(@"%@",model.content);
    model.content = @"reload rows";
    
    ZHSingleLabelCell * tempCell = (ZHSingleLabelCell*)cell;
    if (tempCell.reloadsRowsBlock)
    {
        tempCell.reloadsSectionsBlock();
    }
    
    
    
}

@end
