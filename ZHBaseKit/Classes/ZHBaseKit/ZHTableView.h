//
//  ZHTableView.h
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/6.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHTableViewSection.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZHTableView : UITableView

@property (nonatomic, strong) NSMutableArray <ZHTableViewSection*>* sectionsArray;

/**
 添加代理回调（注意使用多代理，谨慎使用）
 */
- (void)addDelegate:(id<UITableViewDelegate>)delegate;
- (void)removeDelegate:(id<UITableViewDelegate>)delegate;

/**
 添加代理回调（注意使用多代理，谨慎使用）
 通常情况下不需要使用这个方法
 */
- (void)addDataSource:(id<UITableViewDataSource>)dataSource;
- (void)removeDataSource:(id<UITableViewDataSource>)dataSource;

@end

NS_ASSUME_NONNULL_END
