//
//  ZHNestedTableBoard.m
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/7.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHNestedTableBoard.h"
#import "ZHBaseTableViewModel.h"
#import "ZHSingleLabelCellModel.h"

@interface ZHNestedTableBoard ()

@end

@implementation ZHNestedTableBoard

-(void)onViewCreate
{
    [super onViewCreate];
    [self showNavigationTitle:@"TableView 嵌套 TableView"];
    [self onConfigUIData];
}


-(void)onConfigUIData
{
    
    for (int i = 0; i < 10; i++)
    {
      ZHSingleLabelCellModel * item = [[ZHSingleLabelCellModel alloc]init];
      item.delegate = self;
      item.content = [NSString stringWithFormat:@"row = %d",i];
      [self.defaultSection.rowsArray addObject:item];
    }
    
    ///< 嵌套 tableView
    ZHBaseTableViewModel * tableViewModel = [[ZHBaseTableViewModel alloc]init];
    tableViewModel.cellHeight = 250;
    
    for (int i = 0; i < 10; i++)
    {
        ZHSingleLabelCellModel * item = [[ZHSingleLabelCellModel alloc]init];
        item.delegate = self;
        item.content = [NSString stringWithFormat:@" 嵌套 row = %d",i];
        [tableViewModel.defaultSection.rowsArray addObject:item];
    }
    
    ZHSingleLabelCellModel * nestedHeaderModel = [[ZHSingleLabelCellModel alloc]init];
    nestedHeaderModel.content = @" 嵌套的sectionHeader";
    tableViewModel.defaultSection.headerModel = nestedHeaderModel;
    
    ZHSingleLabelCellModel * nestedFooterModel = [[ZHSingleLabelCellModel alloc]init];
    nestedFooterModel.content = @" 嵌套的sectionFooter";
    tableViewModel.defaultSection.footerModel = nestedFooterModel;
    
    
    [self.defaultSection.rowsArray insertObject:tableViewModel atIndex:2];
    
    ZHSingleLabelCellModel * headerModel = [[ZHSingleLabelCellModel alloc]init];
    headerModel.content = @"sectionHeader";
    self.defaultSection.headerModel = headerModel;
       
    ZHSingleLabelCellModel * footerModel = [[ZHSingleLabelCellModel alloc]init];
    footerModel.content = @"sectionFooter";
    self.defaultSection.footerModel = footerModel;

}


ON_PROTOCOL(ZHSingleLabelCell, Touch, cell, data)
{
    ZHSingleLabelCellModel *  model = (ZHSingleLabelCellModel*)data;
    NSLog(@"%@",model.content);
    
}

@end
