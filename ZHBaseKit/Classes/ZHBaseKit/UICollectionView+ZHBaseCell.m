//
//  UICollectionView+ZHBaseCell.m
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/7.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "UICollectionView+ZHBaseCell.h"
#import "ZHBase.h"
@implementation UICollectionView (ZHBaseCell)


+ (UICollectionViewCell *)adCollectionView:(UICollectionView *)collectionView
                    cellForItemAtIndexPath:(NSIndexPath *)indexPath
                                     Class:(NSString*)className
{
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:className];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:className forIndexPath:indexPath];
    ZHBaseCell* content = (ZHBaseCell*)([cell.contentView viewWithTag:kCollectionViewContentCellTag]);
    Class clazz = NSClassFromString(className);
    
    if(!content)
       {
           content = [self createFromNib:className];
           if (!content)
           {
                content = [[clazz alloc]init];
                [cell.contentView addSubview:content];
                [content mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.edges.equalTo(cell.contentView);
                }];
               content.tag = kCollectionViewContentCellTag;
           }
       }
    
    
    return cell;
}

+ (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath Class:(NSString*)className
{
   
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:kind withReuseIdentifier:className];
    UICollectionReusableView *resuablView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:className forIndexPath:indexPath];
    ZHBaseCell* content = (ZHBaseCell*)([resuablView viewWithTag:kCollectionViewSectionHeaderFooterViewTag]);
    Class clazz = NSClassFromString(className);
    if (!content)
    {
       
        ZHBaseCell* content = [self createFromNib:className];
        if(content == nil)
        {
           content = [[clazz alloc] init];
        }
        [resuablView addSubview:content];
        [content mas_makeConstraints:^(MASConstraintMaker *make)
         {
           make.edges.equalTo(resuablView);
        }];
        
        content.tag = kCollectionViewSectionHeaderFooterViewTag;
    }
    return resuablView;

}


+(id)createFromNib:(NSString*)nibName
{
    NSString *file = [[NSBundle mainBundle] pathForResource:nibName ofType:@"nib"];
    if(file == nil)
        return nil;
    
    UIView *view = [[[NSBundle mainBundle]loadNibNamed:nibName owner:self options:nil] firstObject];
    return view;
}

@end
