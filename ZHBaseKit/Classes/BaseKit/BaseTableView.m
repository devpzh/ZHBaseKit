//
//  Created by pzh on 16/9/23.
//  Copyright © 2016年 me. All rights reserved.
//

#import "BaseTableView.h"
#import "BaseTableViewModel.h"
#import "UITableView+BaseCell.h"
#import "Base.h"

@implementation BaseTableView
{
    BaseTableViewStyle _style;
    BaseCellModel *_headerModel;
    BaseCellModel *_footerModel;
}

- (void)onLoad
{
    
    _style = BaseTableViewStyleOneSection;
    [self initUI];
    
}

- (void)initUI
{
    self.scrollEnabled = YES;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)updateTableViewConstraint
{
    if (!CGRectEqualToRect(self.tableView.frame, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)))
    {
        [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
}


- (void)dataDidChanged
{
    if (!self.data) return;
    
    [self updateTableViewConstraint];
    
    BaseTableViewModel *model = (BaseTableViewModel *)self.data;
    self.baseTableViewDelegate = model.baseTableViewDelegate;
    [self configTableViewHeadView:model.tableViewHeaderViewModel];
    [self configTableViewFootView:model.tableViewFooterViewModel];
    [self reloadData:[self judgeModelAndconfigSourceArray:model]];
    if(model.openOffsetMemoryFunction)
    {
        self.tableView.contentOffset = model.contentOffset;
    }
    self.tableView.showsHorizontalScrollIndicator = model.showsHorizontalScrollIndicator;
    self.tableView.showsVerticalScrollIndicator = model.showsVerticalScrollIndicator;
    self.scrollEnabled = model.scrollEnabled;
    
}

#pragma mark - Public Method

- (NSMutableArray *)judgeModelAndconfigSourceArray:(BaseTableViewModel *)model
{
    NSMutableArray *tempArray = [NSMutableArray array];
    if (model.style == BaseTableViewStyleOneSection)
    {
         [tempArray addObject:model.sourceArray];
    }
    else
    {
        NSAssert(model.sectionHeadArray.count <= model.sectionArray.count, @"sectionHeadArray 数量异常 大于sectionArray数量");
        NSAssert(model.sectionFooterArray.count <= model.sectionArray.count, @"sectionFooterArray 数量异常 大于sectionArray数量");
        tempArray = model.sectionArray;
    }
    
    _style = model.style;
    return tempArray;
}



- (void)configTableViewHeadView:(BaseCellModel *)model
{
    if (_headerModel && ([_headerModel.cellClassName isEqualToString:model.cellClassName]))//headview 已经配置 并且还是原来的类对象
    {
        BaseCell *cell = (BaseCell *)self.tableView.tableHeaderView;
        cell.data = model;
    }
    else
    {
        
        self.tableView.tableHeaderView = [self createBaseCellWithModel:model];
    }
    _headerModel = model;

}

- (void)configTableViewFootView:(BaseCellModel *)model
{
    if (_footerModel && ([_headerModel.cellClassName isEqualToString:model.cellClassName]))//headview 已经配置 并且还是原来的类对象
    {
        BaseCell *cell = (BaseCell *)self.tableView.tableFooterView;
        cell.data = model;
    }
    else
    {
        
        self.tableView.tableFooterView = [self createBaseCellWithModel:model];
    }
    _footerModel = model;
    
}


- (BaseCell *)createBaseCellWithModel:(BaseCellModel *)model
{
    if (!model)
    {
        return nil;
    }
    Class clazz = NSClassFromString(model.cellClassName);
    BaseCell *cell = [[clazz alloc] init];
    cell.frame = CGRectMake(0, 0, self.tableView.frame.size.width, model.cellHeight);
    cell.data = model;
    return cell;
}

-(void)reloadData
{
    [self.tableView reloadData];
    
}

- (void)reloadData:(NSMutableArray *)array;
{
    self.sourceArray = array;
    [self.tableView reloadData];
}

#pragma mark - property init
- (void)setScrollEnabled:(BOOL)scrollEnabled
{
    if (_scrollEnabled != scrollEnabled)
    {
        _scrollEnabled = scrollEnabled;
        self.tableView.scrollEnabled = scrollEnabled;
    }
}

#pragma mark tableivew delegate

#pragma mark 返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sourceArray.count;
}

#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = self.sourceArray[section];
    return array.count;
    
}

#pragma mark返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array = [self.sourceArray objectAtIndex:indexPath.section];
    BaseCellModel* model = [array objectAtIndex:indexPath.row];
    UITableViewCell* cell = [UITableView adTableView:tableView cellAtIndexPath:indexPath Class:model.cellClassName];
    BaseCell *contentView = (BaseCell *)[cell.contentView viewWithTag:kTableViewCellContentTag];
    contentView.data = model;
    
    BaseTableViewModel *baseTableViewModel = (BaseTableViewModel *)self.data;
    cell.selectionStyle = baseTableViewModel.selectionStyle;
    return cell;
}


#pragma mark 设置每行高度（每行高度可以不一样）
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array = [self.sourceArray objectAtIndex:indexPath.section];
    BaseCellModel* model = [array objectAtIndex:indexPath.row];
    return model.cellHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    BaseTableViewModel *baseTableViewModel = (BaseTableViewModel *)self.data;
    BaseCellModel* model = [baseTableViewModel.sectionHeadArray objectAtIndex:section];
    if (model)
    {
        UITableViewHeaderFooterView *headerCell = [UITableView adTableView:tableView viewForHeaderInSectionWithModel:model];
        BaseCell *contentView = (BaseCell *)[headerCell.contentView viewWithTag:kSectionViewContentTag];
        contentView.data = model;
        return headerCell;
    }
    
    return nil;

}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    BaseTableViewModel *baseTableViewModel = (BaseTableViewModel *)self.data;
    
    BaseCellModel* model = [baseTableViewModel.sectionFooterArray objectAtIndex:section];
    if (model)
    {
        UITableViewHeaderFooterView *footerCell = [UITableView adTableView:tableView viewForHeaderInSectionWithModel:model];
        BaseCell *contentView = (BaseCell *)[footerCell.contentView viewWithTag:kSectionViewContentTag];
        contentView.data = model;
        
        return footerCell;
    }
    return nil;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    BaseTableViewModel *baseTableViewModel = (BaseTableViewModel *)self.data;
    BaseCellModel* model = [baseTableViewModel.sectionHeadArray objectAtIndex:section];
    return model.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    BaseTableViewModel *baseTableViewModel = (BaseTableViewModel *)self.data;
    BaseCellModel* model = [baseTableViewModel.sectionFooterArray objectAtIndex:section];
    return model.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    BaseTableViewModel *model = (BaseTableViewModel *)self.data;
    if ([self.baseTableViewDelegate respondsToSelector:@selector(baseTableViewModel:didSelectItemAtIndexPath:)])
    {
        [self.baseTableViewDelegate baseTableViewModel:model didSelectItemAtIndexPath:indexPath];
    }
}

#pragma mark - UIScrollview Delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    BaseTableViewModel *baseTableViewModel = (BaseTableViewModel *)self.data;
    baseTableViewModel.contentOffset = scrollView.contentOffset;
    
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate)
    {
        BaseTableViewModel *baseTableViewModel = (BaseTableViewModel *)self.data;
        baseTableViewModel.contentOffset = scrollView.contentOffset;
    }
    
    if ([self.baseTableViewDelegate respondsToSelector:@selector(baseTableViewDidEndDragging: Decelerate:)])
    {
        [self.baseTableViewDelegate baseTableViewDidEndDragging:scrollView Decelerate:decelerate];
    }

    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([self.baseTableViewDelegate respondsToSelector:@selector(baseTableViewDidScroll:)])
    {
        [self.baseTableViewDelegate baseTableViewDidScroll:scrollView];
    }

}

#pragma mark --- Lazy Loading
- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] init];
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollEnabled = self.scrollEnabled;
        if (@available(iOS 11.0, *))
        {//适配iOS11
            _tableView.estimatedRowHeight = 0;
            _tableView.estimatedSectionFooterHeight = 0;
            _tableView.estimatedSectionHeaderHeight = 0;
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        
        [self addSubview:_tableView];
    }
    return _tableView;
}
@end
