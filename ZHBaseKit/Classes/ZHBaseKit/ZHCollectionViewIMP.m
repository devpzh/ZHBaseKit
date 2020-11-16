//
//  ZHCollectionViewIMP.m
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/7.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHCollectionViewIMP.h"
#import "UICollectionView+ZHBaseCell.h"


@interface ZHCollectionViewIMP()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation ZHCollectionViewIMP


#pragma mark ---- UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZHCollectionViewSection * section = [self.sectionsArray objectAtIndex:indexPath.section];
    ZHBaseCellModel * model = [section.rowsArray objectAtIndex:indexPath.row];
    return CGSizeMake(model.cellWidth, model.cellHeight);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    ZHCollectionViewSection * sec = [self.sectionsArray objectAtIndex:section];
    return sec.edgeInset;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
   ZHCollectionViewSection * sec = [self.sectionsArray objectAtIndex:section];
   return sec.minimumLineSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    ZHCollectionViewSection * sec = [self.sectionsArray objectAtIndex:section];
    return sec.minimumInteritemSpacing;
}


#pragma mark ---- UICollectionViewDelegateFlowLayout

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.sectionsArray.count;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return  [self.sectionsArray objectAtIndex:section].rowsArray.count;
    
}


-(CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    ZHCollectionViewSection * sec = [self.sectionsArray objectAtIndex:section];
    if (sec.headerModel)
    {
        return CGSizeMake(sec.headerModel.cellWidth, sec.headerModel.cellHeight);
    }
    return CGSizeMake(0, 0);
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    ZHCollectionViewSection * sec = [self.sectionsArray objectAtIndex:section];
    if (sec.footerModel)
    {
        return CGSizeMake(sec.footerModel.cellWidth, sec.footerModel.cellHeight);
    }
    return CGSizeMake(0, 0);
    
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionReusableView *  reusableView = nil;
    ZHCollectionViewSection * section = [self.sectionsArray objectAtIndex:indexPath.section];
    
    if (kind == UICollectionElementKindSectionHeader && section.headerModel)
    {
        
         reusableView =  [UICollectionView collectionView:collectionView viewForSupplementaryElementOfKind:UICollectionElementKindSectionHeader atIndexPath:indexPath Class:section.headerModel.cellClassName];
         ZHBaseCell* contentView = (ZHBaseCell*)[reusableView viewWithTag:kCollectionViewSectionHeaderFooterViewTag];
         contentView.data = section.headerModel;
        
    }
    if (kind == UICollectionElementKindSectionFooter && section.footerModel)
    {
        reusableView =  [UICollectionView collectionView:collectionView viewForSupplementaryElementOfKind:UICollectionElementKindSectionFooter atIndexPath:indexPath Class:section.footerModel.cellClassName];
        ZHBaseCell* contentView = (ZHBaseCell*)[reusableView viewWithTag:kCollectionViewSectionHeaderFooterViewTag];
        contentView.data = section.footerModel;
        
    }
    return reusableView;
}


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
   
    ZHCollectionViewSection * section = [self.sectionsArray objectAtIndex:indexPath.section];
    ZHBaseCellModel * model = [section.rowsArray objectAtIndex:indexPath.row];
    UICollectionViewCell* cell = [UICollectionView adCollectionView:collectionView cellForItemAtIndexPath:indexPath Class:model
                                     .cellClassName];
    ZHBaseCell* contentView = (ZHBaseCell*)[cell.contentView viewWithTag:kCollectionViewContentCellTag];
    contentView.data = model;
    
    __weak typeof(collectionView) wCollectionView = collectionView;
    [contentView setReloadsRowsBlock:^{
        __strong typeof(wCollectionView) sCollectionView = wCollectionView;
        if (sCollectionView)
        {
            if (indexPath.section < self.sectionsArray.count)
            {
                ZHCollectionViewSection * tSection = [self.sectionsArray objectAtIndex:indexPath.section];
                if (indexPath.row < tSection.rowsArray.count)
                {
                    [UIView setAnimationsEnabled:false];
                    [sCollectionView reloadItemsAtIndexPaths:@[indexPath]];
                    [UIView setAnimationsEnabled:true];
                }
            }
        }
    }];
    
    [contentView setReloadsSectionsBlock:^{
        __strong typeof(wCollectionView) sCollectionView = wCollectionView;
        if (sCollectionView)
        {
            if (indexPath.section < self.sectionsArray.count)
            {
                NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:indexPath.section];
                [UIView setAnimationsEnabled:false];
                [sCollectionView reloadSections:indexSet];
                [UIView setAnimationsEnabled:true];
                
            }
            
        }
    }];
   
    return cell;
    
}


@end
