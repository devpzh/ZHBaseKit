//
//  ZHViewController.m
//  ZHBaseKit
//
//  Created by Panzhenghui on 11/01/2019.
//  Copyright (c) 2019 Panzhenghui. All rights reserved.
//

#import "ZHViewController.h"
#import "ZHSingleLabelCellModel.h"
#import "ZHSingleSectionTableBoard.h"
#import "ZHMultipleSectionTableBoard.h"
#import "ZHNestedTableBoard.h"
#import "ZHExampleCollectionBoard.h"
#import "ZHNestedCollectionBoard.h"

@interface ZHViewController ()

@end

@implementation ZHViewController

-(void)onViewCreate
{
    [super onViewCreate];
    [self showNavigationTitle:@"Table Board"];
    [self onConfigUIData];
    

}

///<默认会创建返回键，
-(void)onNavigationLeftItemCreate
{
}


-(void)onConfigUIData
{
    ZHSingleLabelCellModel * item = [[ZHSingleLabelCellModel alloc]init];
    item.delegate = self;
    item.content = @"单个section情况";
    [self.defaultSection.rowsArray addObject:item];
    
    ZHSingleLabelCellModel * item1 = [[ZHSingleLabelCellModel alloc]init];
    item1.delegate = self;
    item1.content = @"多个section情况";
    [self.defaultSection.rowsArray addObject:item1];
    
    ZHSingleLabelCellModel * item2 = [[ZHSingleLabelCellModel alloc]init];
    item2.delegate = self;
    item2.content  = @"CollectionView Board";
    [self.defaultSection.rowsArray addObject:item2];
    
    ZHSingleLabelCellModel * item3 = [[ZHSingleLabelCellModel alloc]init];
    item3.delegate = self;
    item3.content = @"TableView 嵌套 TableView";
    [self.defaultSection.rowsArray addObject:item3];
    
    ZHSingleLabelCellModel * item4 = [[ZHSingleLabelCellModel alloc]init];
    item4.delegate= self;
    item4.content = @"TableView 嵌套 CollectionView";
    [self.defaultSection.rowsArray addObject:item4];
    
    
}


ON_PROTOCOL(ZHSingleLabelCell, Touch, cell, data)
{
    ZHSingleLabelCellModel * model = (ZHSingleLabelCellModel*)data;
    
    if ([model.content isEqualToString:@"单个section情况"])
    {
         ZHSingleSectionTableBoard * tableBoard = [[ZHSingleSectionTableBoard alloc]init];
        [self.navigationController pushViewController:tableBoard animated:YES];
   
    }else if ([model.content isEqualToString:@"多个section情况"])
    {
        ZHMultipleSectionTableBoard * tableBoard = [[ZHMultipleSectionTableBoard alloc]init];
        [self.navigationController pushViewController:tableBoard animated:YES];
        
    }else if ([model.content isEqualToString:@"TableView 嵌套 TableView"])
    {
        ZHNestedTableBoard * tableBoard = [[ZHNestedTableBoard alloc]init];
        [self.navigationController pushViewController:tableBoard animated:YES];
    }else if ([model.content isEqualToString:@"CollectionView Board"])
    {
        ZHExampleCollectionBoard * collectionBoard = [[ZHExampleCollectionBoard alloc]init];
        [self.navigationController pushViewController:collectionBoard
                                             animated:YES];
   
    }else if ([model.content isEqualToString:@"TableView 嵌套 CollectionView"])
    {
        ZHNestedCollectionBoard * nestedCollectionBoard = [[ZHNestedCollectionBoard alloc]init];
        [self.navigationController pushViewController:nestedCollectionBoard
                                             animated:YES];
    }
    
   
    
}


@end
