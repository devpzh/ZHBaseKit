//
//  ZHBaseTableView.h
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/7.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHBaseCell.h"
#import "ZHTableView.h"
NS_ASSUME_NONNULL_BEGIN


AD_PROTOCOL2(ZHBaseTableView, tableViewDidScroll, tableViewDidEndDragging)

@interface ZHBaseTableView :  ZHBaseCell
@property (nonatomic, strong) ZHTableView * tableView;
@property (nonatomic, assign) BOOL scrollEnabled;

///<  reloadData
-(void)reloadData:(NSMutableArray<ZHTableViewSection*>*)sectionsArray;
@end

NS_ASSUME_NONNULL_END
