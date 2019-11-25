//
//  UITableView+ZHBaseCell.m
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/6.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "UITableView+ZHBaseCell.h"
#import "ZHBase.h"

@implementation UITableView (ZHBaseCell)

///< Cell
+ (UITableViewCell *)adTableView:(UITableView *)tableView
                 cellAtIndexPath:(NSIndexPath *)indexPath
                           Class:(NSString*)className
{
    Class clazz = NSClassFromString(className);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:className];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:className];
        cell.backgroundColor = [UIColor clearColor];
        ZHBaseCell* content = [self createFromNib:className];
        if(content == nil)
        {
           content = [[clazz alloc] init];
        }
           
        [cell.contentView addSubview:content];
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(cell.contentView);
        }];
        content.tag = kTableViewContentCellTag;
    }
    
    return cell;

}

///< SectionHeader
+ (UITableViewHeaderFooterView *)adTableView:(UITableView *)tableView
             viewForHeaderInSectionWithClass:(NSString*)className
{
    Class clazz = NSClassFromString(className);
    UITableViewHeaderFooterView *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:className];
    
    if (cell == nil)
    {
        cell = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:className];
        cell.backgroundView = ({
        UIView * view = [[UIView alloc] initWithFrame:cell.bounds];
        view.backgroundColor = [UIColor clearColor];
        view;
        });
        
        ZHBaseCell* content = [self createFromNib:className];
        if(content == nil)
        {
          content = [[clazz alloc] init];
        }
        [cell.contentView addSubview:content];
        [content mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.edges.equalTo(cell.contentView);
        }];
        content.tag = kTableViewSectionHeaderFooterViewTag;
    }
   
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
