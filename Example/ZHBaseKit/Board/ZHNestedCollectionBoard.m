//
//  ZHNestedCollectionBoard.m
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/25.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHNestedCollectionBoard.h"
#import "ZHSingleLabelCellModel.h"
#import "ZHBaseCollectionViewModel.h"
#import "ZHItemCellModel.h"

@interface ZHNestedCollectionBoard ()

@end

@implementation ZHNestedCollectionBoard

-(void)onViewCreate
{
    [super onViewCreate];
    [self showNavigationTitle:@"TableView 嵌套 CollectionView"];
    [self onConfigUIData];
    
}

-(void)onConfigUIData
{
    
    for (int i = 0; i < 2; i++)
    {
      ZHSingleLabelCellModel * item = [[ZHSingleLabelCellModel alloc]init];
      item.delegate = self;
      item.content = [NSString stringWithFormat:@"row = %d",i];
      [self.defaultSection.rowsArray addObject:item];
    }
    
    
    ZHBaseCollectionViewModel * collectionViewModel = [[ZHBaseCollectionViewModel alloc]init];
    collectionViewModel.cellHeight = ((kScreemWidth-40)/3-0.5)*2+10;
    collectionViewModel.defaultSection.minimumLineSpacing      = 10;
    collectionViewModel.defaultSection.minimumInteritemSpacing = 10;
    
    for (int i = 0; i < 20; i++)
    {
        ZHItemCellModel * item = [[ZHItemCellModel alloc]init];
        item.content = [NSString stringWithFormat:@" item %d",i];
        [collectionViewModel.defaultSection.rowsArray addObject:item];
    }
    [self.defaultSection.rowsArray addObject:collectionViewModel];
    
    
    for (int i = 2; i < 4; i++)
    {
         ZHSingleLabelCellModel * item = [[ZHSingleLabelCellModel alloc]init];
         item.delegate = self;
         item.content = [NSString stringWithFormat:@"row = %d",i];
         [self.defaultSection.rowsArray addObject:item];
    }
       
    
}
@end
