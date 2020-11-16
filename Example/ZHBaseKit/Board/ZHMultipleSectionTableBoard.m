//
//  ZHMultipleSectionTableBoard.m
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/7.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHMultipleSectionTableBoard.h"
#import "ZHSingleLabelCellModel.h"
#import "ZHSingleLabelCell.h"

@interface ZHMultipleSectionTableBoard ()

@end

@implementation ZHMultipleSectionTableBoard

-(void)onViewCreate
{
    [super onViewCreate];
    [self showNavigationTitle:@"Multiple Section Table"];
    [self onConfigUIData];
}


-(void)onConfigUIData
{
    [self.sectionsArray removeAllObjects];
    
    for (int i = 0;i < 3 ; i++) {
        ZHTableViewSection *section = [[ZHTableViewSection alloc]init];
        
        ZHSingleLabelCellModel * headerModel = [[ZHSingleLabelCellModel alloc]init];
        headerModel.content = [NSString stringWithFormat:@"头部 %d",i];
        
        ZHSingleLabelCellModel * footerModel = [[ZHSingleLabelCellModel alloc]init];
        footerModel.content = [NSString stringWithFormat:@"尾部 %d",i];
        
        section.headerModel = headerModel;
        section.footerModel = footerModel;
        
        
        for (int j = 0; j < 5; j++) {
            ZHSingleLabelCellModel * item = [[ZHSingleLabelCellModel alloc]init];
            item.delegate = self;
            item.content = [NSString stringWithFormat:@"section = %d, row = %d",i,j];
            [section.rowsArray addObject:item];
        }
        
        [self.sectionsArray addObject:section];
    }
    
    
    
}

ON_PROTOCOL(ZHSingleLabelCell, Touch, cell, data)
{
    ZHSingleLabelCellModel * model = ( ZHSingleLabelCellModel*)data;
    NSLog(@"%@",model.content);
    
    model.content = @"reload sections";
    ZHSingleLabelCell * tempCell = (ZHSingleLabelCell*)cell;
    if (tempCell.reloadsSectionsBlock)
    {
        tempCell.reloadsSectionsBlock();
    }
}

@end
