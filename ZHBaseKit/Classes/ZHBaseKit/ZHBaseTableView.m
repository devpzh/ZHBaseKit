//
//  ZHBaseTableView.m
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/7.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHBaseTableView.h"
#import "ZHBaseTableViewModel.h"

@interface ZHBaseTableView()<UITableViewDelegate>

@property (nonatomic, strong) ZHBaseCellModel * headerModel; ///<  映射 tableView.tableHeaderView,非 sectionHeader
@property (nonatomic, strong) ZHBaseCellModel * footerModel; ///<  映射 tableView.tableFooterView,非 sectionFooter

@end

@implementation ZHBaseTableView

-(void)onLoad
{
    self.scrollEnabled = YES;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make)
    {
         make.edges.equalTo(self);
    }];
    
}

-(void)dataDidChanged
{
    if (!self.data) return;
    
    
    ZHBaseTableViewModel * model = (ZHBaseTableViewModel*)self.data;
    [self onConfigTableHeaderView:model.tableHeaderViewModel];
    [self onConfigTableFooterView:model.tableFooterViewModel];
    [self reloadData:model.sectionsArray];
    if(model.openOffsetMemoryFunction)
    {
        self.tableView.contentOffset = model.contentOffset;
    }
    self.tableView.showsHorizontalScrollIndicator = model.showHorizontalScrollIndicator;
    self.tableView.showsVerticalScrollIndicator = model.showVerticalScrollIndicator;
    self.scrollEnabled = model.scrollEnabled;
    
    
    
}

-(void)onConfigTableHeaderView:(ZHBaseCellModel*)headerModel
{
       ///<tableHeaderView 已经配置，并且还是原来的类对象.
       if (self.headerModel && ([self.headerModel.cellClassName isEqualToString:headerModel.cellClassName]))
       {
           ZHBaseCell *cell = (ZHBaseCell *)self.tableView.tableHeaderView;
           cell.data = headerModel;
       }
       else
       {
           self.tableView.tableHeaderView = [self createCellWithModel:headerModel];
       }
    
      self.headerModel = headerModel;
    
}


-(void)onConfigTableFooterView:(ZHBaseCellModel*)footerModel
{
       ///<tableFooterView 已经配置，并且还是原来的类对象.
       if (self.footerModel && ([self.footerModel.cellClassName isEqualToString:footerModel.cellClassName]))
       {
           ZHBaseCell *cell = (ZHBaseCell *)self.tableView.tableFooterView;
           cell.data = footerModel;
       }
       else
       {
           self.tableView.tableFooterView = [self createCellWithModel:footerModel];
       }
    
      self.footerModel = footerModel;
    
}

-(void)reloadData:(NSMutableArray<ZHTableViewSection*>*)sectionsArray
{
    self.tableView.sectionsArray = sectionsArray;
    [self.tableView reloadData];
}


- (ZHBaseCell *)createCellWithModel:(ZHBaseCellModel *)model
{
    if (!model) return nil;
    
    Class clazz = NSClassFromString(model.cellClassName);
    ZHBaseCell *cell = [[clazz alloc] init];
    cell.frame = CGRectMake(0, 0, self.tableView.frame.size.width, model.cellHeight);
    cell.data = model;
    return cell;
}


#pragma mark - UIScrollview Delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    ZHBaseTableViewModel *tableViewModel = (ZHBaseTableViewModel *)self.data;
    tableViewModel.contentOffset = scrollView.contentOffset;
    
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate)
    {
        ZHBaseTableViewModel *tableViewModel = (ZHBaseTableViewModel *)self.data;
        tableViewModel.contentOffset = scrollView.contentOffset;
    }
    DEF_PROTOCOL(ZHBaseTableView, tableViewDidEndDragging, @(decelerate))
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    DEF_PROTOCOL(ZHBaseTableView, tableViewDidScroll, scrollView);
    
}


#pragma mark --- Private
-(void)setScrollEnabled:(BOOL)scrollEnabled
{
    if (_scrollEnabled != scrollEnabled)
    {
        _scrollEnabled = scrollEnabled;
        self.tableView.scrollEnabled = _scrollEnabled;
    }
    
}


#pragma mark --- Lazy Loading
-(ZHTableView *)tableView
{
    if (!_tableView)
    {
       _tableView = [[ZHTableView alloc]init];
       [_tableView addDelegate:self];
       [self addSubview:_tableView];
    }
    return _tableView;
}


- (void)dealloc
{
    if (_tableView)
    {
        [_tableView removeDelegate:self];
    }
    
}


@end
