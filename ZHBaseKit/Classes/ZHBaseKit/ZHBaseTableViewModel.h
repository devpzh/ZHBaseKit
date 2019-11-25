//
//  ZHBaseTableViewModel.h
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/7.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHBaseCellModel.h"
#import "ZHTableViewSection.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZHBaseTableViewModel : ZHBaseCellModel

///< 默认分组
@property (nonatomic, strong) ZHTableViewSection * defaultSection;

///< 分组，默认一组 defaultSection
@property (nonatomic, strong) NSMutableArray <ZHTableViewSection*>* sectionsArray;

///<  映射 tableView.tableHeaderView,非 sectionHeader
@property (nonatomic, strong)ZHBaseCellModel *tableHeaderViewModel;

///<  映射 tableView.tableFooterView,非 sectionFooter
@property (nonatomic, strong)ZHBaseCellModel *tableFooterViewModel;

///<  TableView contentOffset
@property (nonatomic, assign) CGPoint contentOffset;

///< 是否开启contentOffset记忆功能， default no
@property (nonatomic, assign) BOOL    openOffsetMemoryFunction;

///<  TableView 是否可滚动，default yes
@property (nonatomic, assign) BOOL    scrollEnabled;

///< default no
@property (nonatomic, assign) BOOL    showHorizontalScrollIndicator;

///< default no
@property (nonatomic, assign) BOOL    showVerticalScrollIndicator;


@end

NS_ASSUME_NONNULL_END
