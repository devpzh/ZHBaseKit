//
//
//  BaseCollectionBoard.m
//  FitnessNews
//
//  Created by apple on 16/3/5.
//  Copyright © 2016年 com.e-mxing. All rights reserved.
//

#import "BaseCollectionBoard.h"
#import "UICollectionView+BaseCell.h"
#import "Base.h"

@interface BaseCollectionBoard()
@end

@implementation BaseCollectionBoard

-(void)onload
{
    [super onload];
    self.minimumLineSpacing = 0.0;
    self.minimumInteritemSpacing = 0.0;
    self.insets = UIEdgeInsetsMake(0, 0, 0, 0);
    
}

-(void)onViewCreate
{
    [super onViewCreate];
    [self onCreateFlowLayout];
   
}

-(void)onViewLayOut
{
    [super onViewLayOut];
    self.collectionView.frame = CGRectMake(0, kNavigationBarHeight, kScreemWidth, kScreemHeight-kNavigationBarHeight);
}



-(void)onCreateFlowLayout
{
    self.flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
}

#pragma mark ---- UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    BaseCellModel* model = [self.dataSource objectAtIndex:indexPath.row];
    UICollectionViewCell* cell = [UICollectionView adCollectionView:collectionView cellForItemAtIndexPath:indexPath model:model];
    BaseCell* contentView = (BaseCell*)[cell.contentView viewWithTag:kyjCellContentTag];
    contentView.frame = CGRectMake(0, 0, model.cellWidth, model.cellHeight);
    contentView.data = model;
    
    return cell;
    
}

#pragma mark ---- UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    BaseCellModel* model = [self.dataSource objectAtIndex:indexPath.item];
    return (CGSize){model.cellWidth,model.cellHeight};
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return self.insets;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return self.minimumLineSpacing;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return self.minimumInteritemSpacing;
}


#pragma mark --- Lazy Loading
-(UICollectionView *)collectionView
{
    if (!_collectionView)
    {
     _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
     _collectionView.dataSource  = self;
     _collectionView.delegate    = self;
     _collectionView.backgroundColor = [UIColor clearColor];
     [self.view addSubview:_collectionView];
    }
    
    return _collectionView;
}


-(NSMutableArray *)dataSource
{
    if (!_dataSource)
    {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}



@end
