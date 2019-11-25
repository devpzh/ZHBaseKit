//
//  ZHExampleCollectionBoard.m
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/7.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHExampleCollectionBoard.h"
#import "ZHItemCellModel.h"
#import "ZHSingleLabelCellModel.h"

@interface ZHExampleCollectionBoard ()

@end

@implementation ZHExampleCollectionBoard

-(void)onViewCreate
{
    [super onViewCreate];
    [self showNavigationTitle:@"CollectionView Board"];
    
    self.defaultSection.edgeInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.defaultSection.minimumLineSpacing = 10;
    self.defaultSection.minimumInteritemSpacing = 10;
    [self onConfigUIData];
    
}

-(void)onConfigUIData
{
    for (int i = 0; i < 30; i++)
    {
        ZHItemCellModel * item = [[ZHItemCellModel alloc]init];
        item.content = [NSString stringWithFormat:@" item %d",i];
        [self.defaultSection.rowsArray addObject:item];
    }
    
    ZHSingleLabelCellModel * headerModel = [[ZHSingleLabelCellModel alloc]init];
    headerModel.content = @"头部";
    self.defaultSection.headerModel = headerModel;
    
    ZHSingleLabelCellModel * footerModel = [[ZHSingleLabelCellModel alloc]init];
    footerModel.content = @"尾部";
    self.defaultSection.footerModel = footerModel;

    [self.collectionView reloadData];
}

@end
