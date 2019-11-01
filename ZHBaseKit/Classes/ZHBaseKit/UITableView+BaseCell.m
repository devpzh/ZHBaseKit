//
//  UITableView+ADBaseCell.m
//  
//
//  Created by pzh on 16/9/23.
//  Copyright © 2016年 me. All rights reserved.
//

#import "UITableView+BaseCell.h"
#import "Base.h"

@implementation UITableView (BaseCell)

///< cell
+ (UITableViewCell *)adTableView:(UITableView *)tableView
                 cellAtIndexPath:(NSIndexPath *)indexPath
                           Class:(NSString*)className
{
    Class clazz = NSClassFromString(className);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:className];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:className];
        BaseCell* content = [self createFromNib:className];
        if(content == nil)
            content = [[clazz alloc] init];
        
        [cell.contentView addSubview:content];

        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(cell.contentView);
        }];
        content.tag = kTableViewCellContentTag;
    }
    cell.backgroundColor = [UIColor clearColor];
    return cell;

}

+ (UITableViewCell *)adTableView:(UITableView *)tableView
                 cellAtIndexPath:(NSIndexPath *)indexPath
                           Model:(BaseCellModel*)model
{
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:model.cellClassName];
    Class clazz = NSClassFromString(model.cellClassName);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:model.cellClassName forIndexPath:indexPath];
    BaseCell* content = (BaseCell*)[cell.contentView viewWithTag:kTableViewCellContentTag];
    if (content == nil)
    {
        BaseCell* content = [self createFromNib:model.cellClassName];
        if(content == nil)
            content = (BaseCell*)[[clazz alloc] init];
        [cell.contentView addSubview:content];
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(cell.contentView);
        }];
        content.tag   = kTableViewCellContentTag;
    }
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}


///< sectionHeader
+ (UITableViewHeaderFooterView *)adTableView:(UITableView *)tableView
             viewForHeaderInSectionWithClass:(NSString*)className
{
    Class clazz = NSClassFromString(className);
    UITableViewHeaderFooterView *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:className];
    if (cell == nil) {
        cell = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:className];
        BaseCell* content = [self createFromNib:className];
        if(content == nil)
            content = [[clazz alloc] init];
        [cell.contentView addSubview:content];
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(cell.contentView);
        }];
        content.tag = kSectionViewContentTag;
    }
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

+ (UITableViewHeaderFooterView *)adTableView:(UITableView *)tableView
             viewForHeaderInSectionWithModel:(BaseCellModel*)model
{
    
    Class clazz = NSClassFromString(model.cellClassName);
    [tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:model.cellClassName];
    UITableViewHeaderFooterView *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:model.cellClassName];
    BaseCell* content = (BaseCell*)[cell.contentView viewWithTag:kSectionViewContentTag];
    
    if (content == nil)
    {
        BaseCell* content = [self createFromNib:model.cellClassName];
        if(content == nil)
            content = (BaseCell*)[[clazz alloc] init];
        [cell.contentView addSubview:content];
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(cell.contentView);
        }];
        content.tag = kSectionViewContentTag;
    }
    cell.backgroundColor = [UIColor clearColor];
    return cell;

}



+(id)createFromNib:(NSString*)nibName
{
    
    if (nibName == nil) return nil;
    
    NSString *file = [[NSBundle mainBundle] pathForResource:nibName ofType:@"nib"];
    if(file == nil)
        return nil;
    UIView *view = [[[NSBundle mainBundle]loadNibNamed:nibName owner:self options:nil] firstObject];
    return view;
}
@end
