//
//  UITableView+ZHBaseCell.h
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/6.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static NSInteger  const kTableViewContentCellTag                    = 10000;
static NSInteger  const kTableViewSectionHeaderFooterViewTag        = 10001;


@interface UITableView (ZHBaseCell)

//< Cell
+ (UITableViewCell *)adTableView:(UITableView *)tableView
               cellAtIndexPath:(NSIndexPath *)indexPath
                         Class:(NSString*)className;


///< SectionHeader
+ (UITableViewHeaderFooterView *)adTableView:(UITableView *)tableView
                 viewForHeaderInSectionWithClass:(NSString*)className;




@end

NS_ASSUME_NONNULL_END
