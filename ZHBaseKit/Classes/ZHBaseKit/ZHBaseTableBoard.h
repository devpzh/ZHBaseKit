//
//  ZHBaseTableBoard.h
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/6.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHBaseBoard.h"
#import "ZHTableView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZHBaseTableBoard : ZHBaseBoard
@property (nonatomic, strong) ZHTableView * tableView;
@property (nonatomic, strong) NSMutableArray <ZHTableViewSection*>* sectionsArray;
@property (nonatomic, strong) ZHTableViewSection * defaultSection;
@end

NS_ASSUME_NONNULL_END
