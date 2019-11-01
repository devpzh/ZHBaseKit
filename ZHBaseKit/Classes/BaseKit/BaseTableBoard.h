//
//
//  BaseTableBoard.h
//
//  Created by pzh on 16/9/23.
//  Copyright © 2016年 me. All rights reserved.
//

#import "BaseBoard.h"

@interface BaseTableBoard : BaseBoard<UITableViewDelegate,
                                      UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray * dataSource;
@property (nonatomic,strong) UITableView* tableView;
@end
