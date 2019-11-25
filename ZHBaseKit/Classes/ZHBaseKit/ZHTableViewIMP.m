//
//  ZHTableViewIMP.m
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/6.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHTableViewIMP.h"
#import "ZHBaseCell.h"
#import "UITableView+ZHBaseCell.h"
@interface ZHTableViewIMP() <UITableViewDelegate,UITableViewDataSource>

@end

@implementation ZHTableViewIMP

#pragma mark --- UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

#pragma mark --- UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
      ZHTableViewSection * section = [self.sectionsArray objectAtIndex:indexPath.section];
      ZHBaseCellModel * model = [section.rowsArray objectAtIndex:indexPath.row];
      return model.cellHeight;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
     ZHBaseCellModel * headerModel  = [self.sectionsArray objectAtIndex:section].headerModel;
     if (headerModel)
     {
        return headerModel.cellHeight;
     }
    
     return 0.0;
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
     ZHBaseCellModel * footerModel  = [self.sectionsArray objectAtIndex:section].footerModel;
     if (footerModel)
     {
        return footerModel.cellHeight;
     }
     return 0.0;
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    ZHBaseCellModel * headerModel  = [self.sectionsArray objectAtIndex:section].headerModel;
    if (!headerModel) return nil;
    
    UITableViewHeaderFooterView *headerCell = [UITableView adTableView:tableView viewForHeaderInSectionWithClass:headerModel.cellClassName];
    ZHBaseCell *contentView = (ZHBaseCell *)[headerCell.contentView viewWithTag:kTableViewSectionHeaderFooterViewTag];
    contentView.data = headerModel;
    
    return headerCell;
    
    
    
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    ZHBaseCellModel * footerModel  = [self.sectionsArray objectAtIndex:section].footerModel;
    if (!footerModel) return nil;
    
    UITableViewHeaderFooterView *footerCell = [UITableView adTableView:tableView viewForHeaderInSectionWithClass:footerModel.cellClassName];
    ZHBaseCell *contentView = (ZHBaseCell *)[footerCell.contentView viewWithTag:kTableViewSectionHeaderFooterViewTag];
    contentView.data = footerModel;
    
    return footerCell;
    
}



#pragma mark --- UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionsArray.count;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.sectionsArray objectAtIndex:section].rowsArray.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    
   ZHTableViewSection * section = [self.sectionsArray objectAtIndex:indexPath.section];
   ZHBaseCellModel * model = [section.rowsArray objectAtIndex:indexPath.row];
   UITableViewCell * cell = [UITableView adTableView:tableView cellAtIndexPath:indexPath Class:model.cellClassName];
   ZHBaseCell * contentView = (ZHBaseCell *)[cell.contentView viewWithTag:kTableViewContentCellTag];
   contentView.data = model;
   
   return cell;
    
}

@end
