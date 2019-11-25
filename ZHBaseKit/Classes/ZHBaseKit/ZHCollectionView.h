//
//  ZHCollectionView.h
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/7.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHCollectionViewSection.h"

NS_ASSUME_NONNULL_BEGIN


@protocol ZHCollectionViewDelegate <NSObject>
@optional

-(UICollectionViewFlowLayout*)onCustomFlowLayout;

@end


@interface ZHCollectionView : UIView

///< 初始化后，调用此方法。
-(void)onConfig;

@property (nonatomic, strong) UICollectionView           * collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout * flowLayout;
@property (nonatomic, weak)   id <ZHCollectionViewDelegate> delegate;
@property (nonatomic, strong) NSMutableArray <ZHCollectionViewSection*>* sectionsArray;

- (void)onScrollDirection:(UICollectionViewScrollDirection) direction;
- (void)reloadData;


/**
 添加代理回调（注意使用多代理，谨慎使用）
 */
- (void)addDelegate:(id<UICollectionViewDelegate>)delegate;
- (void)removeDelegate:(id<UICollectionViewDelegate>)delegate;

/**
 添加代理回调（注意使用多代理，谨慎使用）
 通常情况下不需要使用这个方法
 */
- (void)addDataSource:(id<UICollectionViewDataSource>)dataSource;
- (void)removeDataSource:(id<UICollectionViewDataSource>)dataSource;


@end

NS_ASSUME_NONNULL_END
