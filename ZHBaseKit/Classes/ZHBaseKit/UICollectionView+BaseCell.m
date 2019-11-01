//
//  Created by pzh on 16/9/23.
//  Copyright © 2016年 me. All rights reserved.
//

#import "UICollectionView+BaseCell.h"

@implementation UICollectionView (BaseCell)

+(id)createFromNib:(NSString*)nibName
{
    NSString *file = [[NSBundle mainBundle] pathForResource:nibName ofType:@"nib"];
    if(file == nil)
        return nil;
    
    UIView *view = [[[NSBundle mainBundle]loadNibNamed:nibName owner:self options:nil] firstObject];
    return view;
}


+ (UICollectionViewCell *)adCollectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
                                   model:(BaseCellModel*)model
{
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:model.cellClassName];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:model.cellClassName forIndexPath:indexPath];
    
    BaseCell* content = (BaseCell*)([cell.contentView viewWithTag:kyjCellContentTag]);
    if(!content)
    {
        content = [self createFromNib:model.cellClassName];
        if (!content)
        {
             content = [[NSClassFromString(model.cellClassName) alloc]init];
             [cell.contentView addSubview:content];
             content.tag = kyjCellContentTag;
        }
    }
    return cell;
}


+ (UICollectionViewCell *)adCollectionView:(UICollectionView *)collectionView
                    cellForItemAtIndexPath:(NSIndexPath *)indexPath
                                     Class:(NSString*)className
{
    Class clazz = NSClassFromString(className);
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:className forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UICollectionViewCell alloc] init];
        BaseCell* content = [self createFromNib:className];
        if(content == nil)
            content = [[clazz alloc] init];
        
        [cell.contentView addSubview:content];
        content.tag = kyjCellContentTag;
    }
    return cell;
}

+ (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath Class:(NSString*)className
{
    Class clazz = NSClassFromString(className);
    UICollectionReusableView *resuablView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:className forIndexPath:indexPath];
    if (resuablView == nil)
    {
        resuablView = [[UICollectionReusableView alloc] init];
        BaseCell* content = [self createFromNib:className];
        if(content == nil)
            content = [[clazz alloc] init];
        
        [resuablView addSubview:content];
        content.tag = kyjHeadFootResuableTag;
    }
    return resuablView;

}


@end
