//
//  BaseTableViewModel.h
//  iSport
//
//  Created by pzh on 16/9/23.
//  Copyright © 2016年 me. All rights reserved.
//

#import "BaseCellModel.h"
#import "BaseTableView.h"

typedef NS_ENUM(NSInteger,BaseTableViewStyle)
{
  BaseTableViewStyleOneSection,
  BaseTableViewStyleMoreSection,
};

@interface BaseTableViewModel : BaseCellModel

@property (nonatomic) BaseTableViewStyle style;

// 单section情况下数据源 BaseTableViewStyleOneSection
@property (nonatomic, strong) NSMutableArray < BaseCellModel *> *sourceArray;

// 多section情况下数据源 BaseTableViewStyleMoreSection
@property (nonatomic, strong) NSMutableArray < NSArray *> *sectionArray;

// 多section情况下头部数据源
@property (nonatomic, strong) NSMutableArray < BaseCellModel *> *sectionHeadArray;

// 多section情况下尾部数据源
@property (nonatomic, strong) NSMutableArray < BaseCellModel *> *sectionFooterArray;


@property (nonatomic)CGPoint contentOffset;

@property (nonatomic,strong)BaseCellModel *tableViewFooterViewModel;

@property (nonatomic,strong)BaseCellModel *tableViewHeaderViewModel;

@property (nonatomic) UITableViewCellSelectionStyle   selectionStyle;

@property (nonatomic,assign) BOOL   scrollEnabled;
@property (nonatomic,assign) BOOL   openOffsetMemoryFunction;
@property (nonatomic, weak)  id <BaseTableViewDelegate>   baseTableViewDelegate;
@property(nonatomic)         BOOL                         showsHorizontalScrollIndicator;
@property(nonatomic)         BOOL                         showsVerticalScrollIndicator;


@end
