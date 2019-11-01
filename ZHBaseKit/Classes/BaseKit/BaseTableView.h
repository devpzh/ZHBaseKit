//
//  Created by pzh on 16/9/23.
//  Copyright © 2016年 me. All rights reserved.
//

#import "BaseCell.h"
@class BaseTableViewModel;
@protocol BaseTableViewDelegate<NSObject>

@optional
- (void)baseTableViewModel:(BaseTableViewModel *)model didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
- (void)baseTableViewDidScroll:(UIScrollView*)scrollView;//DidEndDragging
- (void)baseTableViewDidEndDragging:(UIScrollView*)scrollView  Decelerate:(BOOL)decelerate;
@end

@interface BaseTableView : BaseCell<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray  *sourceArray;
@property (nonatomic) BOOL  scrollEnabled;
@property (nonatomic, weak)id<BaseTableViewDelegate> baseTableViewDelegate;

- (void)reloadData;
- (void)reloadData:(NSMutableArray *)array;



@end
