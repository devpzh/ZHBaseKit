//
//  UITableView+ADBaseCell.h
//  
//
//  Created by pzh on 16/9/23.
//  Copyright © 2016年 me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCellModel.h"
#import "BaseCell.h"

static NSInteger  const kTableViewCellContentTag      = 11111;
static NSInteger  const kSectionViewContentTag        = 22222;

@class BaseCellModel;
@interface UITableView (BaseCell)

///< cell
+ (UITableViewCell *)adTableView:(UITableView *)tableView
               cellAtIndexPath:(NSIndexPath *)indexPath
                         Class:(NSString*)className;

+ (UITableViewCell *)adTableView:(UITableView *)tableView
               cellAtIndexPath:(NSIndexPath *)indexPath
                         Model:(BaseCellModel*)model;


///< sectionHeader
+ (UITableViewHeaderFooterView *)adTableView:(UITableView *)tableView
                 viewForHeaderInSectionWithClass:(NSString*)className;


+ (UITableViewHeaderFooterView *)adTableView:(UITableView *)tableView
          viewForHeaderInSectionWithModel:(BaseCellModel*)model;




@end
