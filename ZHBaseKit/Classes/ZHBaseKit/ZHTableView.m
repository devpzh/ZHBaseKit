//
//  ZHTableView.m
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/6.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHTableView.h"
#import "ZHTableViewIMP.h"
#import "ZHProxy.h"

@interface  ZHTableView()
@property (nonatomic, strong) ZHTableViewIMP * imp;
@property (nonatomic, strong) ZHProxy        * proxy;
@end

@implementation ZHTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self)
    {
        [self onConfig];
    }
    return self;
}


-(void)onConfig
{
    self.backgroundColor = [UIColor clearColor];
    self.showsHorizontalScrollIndicator  = false;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    if (@available (iOS 11.0, *))
    {
        self.estimatedRowHeight = 0.f;
        self.estimatedSectionHeaderHeight = 0.f;
        self.estimatedSectionFooterHeight = 0.f;
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
    self.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
    
    self.delegate = (id<UITableViewDelegate>)self.proxy;
    self.dataSource = (id<UITableViewDataSource>)self.proxy;
    
}

-(void)setSectionsArray:(NSMutableArray<ZHTableViewSection *> *)sectionsArray
{
    _sectionsArray = sectionsArray;
    self.imp.sectionsArray = _sectionsArray;
    
}

- (void)addDelegate:(id<UITableViewDelegate>)delegate
{
    [self.proxy addTarget:delegate];
}

- (void)removeDelegate:(id<UITableViewDelegate>)delegate
{
    [self.proxy removeTarget:delegate];
}

- (void)addDataSource:(id<UITableViewDataSource>)dataSource
{
    [self.proxy addTarget:dataSource];
}

- (void)removeDataSource:(id<UITableViewDataSource>)dataSource
{
    [self.proxy removeTarget:dataSource];
}


#pragma mark --- Lazy Loading
-(ZHProxy *)proxy
{
    if (!_proxy)
    {
        _proxy = [[ZHProxy alloc]init];
        [_proxy addTarget:self.imp];
    }
    return _proxy;
}

-(ZHTableViewIMP *)imp
{
    if (!_imp)
    {
        _imp = [[ZHTableViewIMP alloc]init];
    }
    
    return _imp;
}

@end
