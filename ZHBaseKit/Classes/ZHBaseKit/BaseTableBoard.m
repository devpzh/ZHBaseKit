//
//
//  BaseTableBoard.m
//
//  Created by pzh on 16/9/23.
//  Copyright © 2016年 me. All rights reserved.
//

#import "BaseTableBoard.h"
#import "UITableView+BaseCell.h"
#import "Base.h"
@interface BaseTableBoard()

@end

@implementation BaseTableBoard

-(NSMutableArray *)dataSource
{
    if ( !_dataSource)
    {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
    
}

-(UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate     = self;
        _tableView.dataSource   = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor clearColor];
    }
    
    return _tableView;
}

-(void)onload
{
    [super onload];
   
}

-(void)onViewCreate
{
    [super onViewCreate];
    
    
    if (@available(iOS 11.0, *))
    {//适配iOS11
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
   
    [self.view addSubview:self.tableView];
  
    
}




-(void)onViewLayOut
{
    [super onViewLayOut];
    self.tableView.frame = CGRectMake(0,
                                  kNavigationBarHeight,
                                  kScreemWidth,
                                  kScreemHeight- kNavigationBarHeight);
}





#pragma mark --- UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.dataSource.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseCellModel* model = (BaseCellModel*)[self.dataSource objectAtIndex:indexPath.row];
    return model.cellHeight;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    BaseCellModel* model = [self.dataSource objectAtIndex:indexPath.row];
    UITableViewCell* cell = [UITableView adTableView:tableView cellAtIndexPath:indexPath Class:model.cellClassName];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    BaseCell *contentView = (BaseCell *)[cell.contentView viewWithTag:kTableViewCellContentTag];
    contentView.data = model;
    return cell;
}


@end
