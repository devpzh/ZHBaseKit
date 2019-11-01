
//
//  BaseBoard.m
//
//  Created by pzh on 16/9/23.
//  Copyright © 2016年 me. All rights reserved.
//

#import "BaseBoard.h"
#import "Base.h"

@interface BaseBoard()

@property (nonatomic, strong) UIButton * leftItemBtn;
@property (nonatomic, strong) UIButton * rightItemBtn;

@end

@implementation BaseBoard

#pragma mark --- Common Methods
-(id)init
{
    self = [super init];
    if(self)
    {
        self.modalPresentationStyle = UIModalPresentationFullScreen;
        [self onload];
    }
    return self;
}

-(void)dealloc
{
    [self onUnload];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self  onViewCreate];
    [self  onViewLayOut];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self  onViewWillAppear];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self  onViewDidAppear];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self  onViewWillDisappear];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self  onViewDiddisappear];
}

#pragma mark --- Public Methods

-(void)onload{}

-(void)onUnload{}

-(void)onViewCreate
{
     self.view.backgroundColor =   [UIColor whiteColor];
     [self onNavigationBarCreate]; //默认创建导航栏
}

-(void)onViewLayOut{}

-(void)onViewWillAppear{}

-(void)onViewDidAppear{}

-(void)onViewWillDisappear{}

-(void)onViewDiddisappear{}

-(void)onLeftTouch{}

-(void)onRightTouch{}

-(void)onNavigationBarCreate
{
    [self onBaseNavigationBarCreate];
    [self onNavigationTitleContainerCreate]; //默认创建导航栏容器
    [self onNavigationBarSeparatorView];     //默认创建导航栏分割线
    [self onNavigationTitleViewCreate];      //默认不创建titleView
    [self onNavigationLeftItemCreate];       //默认返回按钮
    [self onNavigationRightItemCreate];      //默认创建右键
    
}

-(void)onBaseNavigationBarCreate
{
    [self.view addSubview:self.baseNavigationBar];
    [self.baseNavigationBar mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.top.left.right.equalTo(self.view);
        make.height.equalTo(@(kNavigationBarHeight));
    }];
}

-(void)onNavigationTitleContainerCreate
{
    [self.baseNavigationBar addSubview:self.titleContainer];
    [self.titleContainer mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.left.right.bottom.equalTo(self.baseNavigationBar);
        make.top.equalTo(self.baseNavigationBar.mas_top).offset(kStatusBarHeight);
    }];
    [self.baseNavigationBar sendSubviewToBack:self.titleContainer];
}


-(void)onNavigationBarSeparatorView
{
    [self.titleContainer addSubview:self.barSeparatorView];
    [self.barSeparatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.titleContainer);
        make.height.equalTo(@0.5);
    }];
    
}

-(void)onNavigationTitleViewCreate{}

-(void)onNavigationLeftItemCreate
{
     [self showLeftItemWithImage:[UIImage imageNamed:@"back_item"]];
}

-(void)onNavigationRightItemCreate{}


-(void)hideNavigationBar
{
    self.baseNavigationBar.hidden = YES;
}

-(void)showNavigationBar
{
    self.baseNavigationBar.hidden = NO;
}


-(void)showNavigationTitle:(NSString*)title
{
   
    UILabel* l      = [[UILabel alloc]init];
    l.textAlignment = NSTextAlignmentCenter;
    l.font          = kFontBold(16);
    l.text          = title;
    l.textColor     = [UIColor blackColor];
   
    [self.titleView removeFromSuperview];
    self.titleView  = l;
    [self.baseNavigationBar addSubview:l];
    [l mas_makeConstraints:^(MASConstraintMaker *make)
     {
        make.top.equalTo(self.baseNavigationBar.mas_top).offset(kStatusBarHeight);
        make.bottom.equalTo(self.baseNavigationBar.mas_bottom);
        make.centerX.equalTo(self.baseNavigationBar);
        make.left.greaterThanOrEqualTo(self.baseNavigationBar.mas_left).offset(60);
        make.right.lessThanOrEqualTo(self.baseNavigationBar.mas_right).offset(-60);
    }];
    [self.baseNavigationBar bringSubviewToFront:l];
}

-(void)showNavigationTitleWithImage:(UIImage*)image
{
    UIImageView* imageView = [[UIImageView alloc]init];
    imageView.image           = image;
    [self.titleView removeFromSuperview];
    self.titleView  = imageView;
    [self.baseNavigationBar addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(image.size);
        make.centerX.equalTo(self.baseNavigationBar.mas_centerX);
        make.centerY.equalTo(self.titleContainer.mas_centerY);
    }];
    [self.baseNavigationBar bringSubviewToFront:self.titleView];
    
}

-(void)showNavigationTitleWithView:(UIView*)view
{
    [self.titleView removeFromSuperview];
    self.titleView = view;
    [self.baseNavigationBar addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.centerX.equalTo(self.baseNavigationBar.mas_centerX);
        make.centerY.equalTo(self.titleContainer.mas_centerY);
    }];
}

-(void)showLeftItemWithText:(NSString*)text
{
    [_leftItemBtn removeFromSuperview];
    [self.leftItem removeFromSuperview];
  
    UILabel* l      = [[UILabel alloc]init];
    l.textColor     = [UIColor whiteColor];
    l.font          = kFont(16);
    l.text          = text;
    l.textAlignment = NSTextAlignmentLeft;
   
    [self.baseNavigationBar addSubview:l];
    [l mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.baseNavigationBar).offset(kPadding);
        make.top.equalTo(self.baseNavigationBar.mas_top).offset(kStatusBarHeight);
        make.size.mas_equalTo(CGSizeMake(60, kNavigationBarHeight-kStatusBarHeight));
    }];
    self.leftItem   = l;
    [self onNavigationLeftItemBtnCreate];
    
}

-(void)showLeftItemWithImage:(UIImage*)image
{
    [_leftItemBtn removeFromSuperview];
    [self.leftItem removeFromSuperview];

    UIImageView* imageView = [[UIImageView alloc]init];
    imageView.image = image;
    CGSize size = image.size;
    size.width  = size.width  > 40 ? 40 : size.width;
    size.height = size.height > 40 ? 40 : size.height;
    [self.baseNavigationBar addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.left.equalTo(self.baseNavigationBar).offset(kPadding);
        make.centerY.equalTo(self.titleContainer.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(size.width,size.height));
    }];
    self.leftItem = imageView;
    [self onNavigationLeftItemBtnCreate];
}

-(void)showLeftItemWithCustomerView:(UIView*)view
{
    [self.leftItemBtn removeFromSuperview];
    [self.leftItem removeFromSuperview];
    [self.baseNavigationBar addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.left.equalTo(self.baseNavigationBar).offset(kPadding);
        make.centerY.equalTo(self.titleContainer.mas_centerY);
    }];
    
    self.leftItem = view;
    [self onNavigationLeftItemBtnCreate];
}

-(void)showRightItemWithText:(NSString*)text
{
    [self.rightItemBtn removeFromSuperview];
    [self.rightItem removeFromSuperview];
    UILabel* l      = [[UILabel alloc]init];
    l.textColor     = [UIColor whiteColor];
    l.font          = kFont(13);
    l.text          = text;
    l.textAlignment = NSTextAlignmentRight;
    [self.baseNavigationBar addSubview:l];
    [l mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.baseNavigationBar.mas_right).offset(-kPadding);
        make.height.equalTo(@(kNavigationBarHeight-kStatusBarHeight));
        make.centerY.equalTo(self.titleContainer.mas_centerY);
    }];
    self.rightItem  = l;
    [self onNavigationRightItemBtnCreate];
}

-(void)showRightItemWithImage:(UIImage*)image
{
    [self.rightItemBtn removeFromSuperview];
    [self.rightItem    removeFromSuperview];

    UIImageView* imageView = [[UIImageView alloc]init];
    imageView.image = image;
    CGSize size     = image.size;
    
    size.width  = size.width  > 40 ? 40 : size.width;
    size.height = size.height > 40 ? 40 : size.height;
    
    [self.baseNavigationBar addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.size.mas_equalTo(size);
        make.centerY.equalTo(self.titleContainer.mas_centerY);
        make.right.equalTo(self.baseNavigationBar.mas_right).offset(-kPadding);
    }];
    self.rightItem = imageView;
    [self onNavigationRightItemBtnCreate];
    
}
-(void)showRightItemWithCustomerView:(UIView*)view
{
    [self.rightItemBtn removeFromSuperview];
    [self.rightItem    removeFromSuperview];
    [self.baseNavigationBar addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.right.equalTo(self.baseNavigationBar).offset(-kPadding);
         make.centerY.equalTo(self.titleContainer.mas_centerY);
     }];
    
    self.rightItem = view;
    [self onNavigationRightItemBtnCreate];
}


-(void)showNavigationLeftItem
{
    self.leftItem.hidden     = NO;
    self.leftItemBtn.hidden  = NO;
}
-(void)showNavigationRightItem
{
    self.rightItem.hidden     = NO;
    self.rightItemBtn.hidden  = NO;
    
}
-(void)hideNavigationLeftItem
{
    self.leftItem.hidden     = YES;
    self.leftItemBtn.hidden  = YES;
    
}
-(void)hideNavigationRightItem
{
    self.rightItem.hidden     = YES;
    self.rightItemBtn.hidden  = YES;
    
}

-(void)onNavigationLeftItemBtnCreate
{
    [self.baseNavigationBar addSubview:self.leftItemBtn];
    [self.leftItemBtn mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.edges.equalTo(self.leftItem).insets(UIEdgeInsetsMake(0, -kPadding, 0, -30));
    }];
}

-(void)onNavigationRightItemBtnCreate
{
    
    [self.baseNavigationBar addSubview:self.rightItemBtn];
    [self.rightItemBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.rightItem).insets(UIEdgeInsetsMake(0, -kPadding, 0, 0));
    }];
    
}

#pragma mark --- Lazy Loading

-(UIView *)baseNavigationBar
{
    if (!_baseNavigationBar)
    {
        _baseNavigationBar = [[UIView alloc]init];
        _baseNavigationBar.backgroundColor = [UIColor whiteColor];
    }
    return _baseNavigationBar;
}

-(UIView *)titleContainer
{
    if (!_titleContainer)
    {
        _titleContainer = [[UIView alloc]init];
        _titleContainer.backgroundColor = [UIColor clearColor];
    }
    
    return _titleContainer;
}

-(UIView *)barSeparatorView
{
    if (!_barSeparatorView)
    {
         _barSeparatorView = [[UIView alloc]init];
         _barSeparatorView.backgroundColor = [UIColor lightGrayColor];
    }
    return _barSeparatorView;
}

-(UIButton *)leftItemBtn
{
    if (!_leftItemBtn)
    {
        _leftItemBtn        = [UIButton buttonWithType:UIButtonTypeCustom];
       [_leftItemBtn addTarget:self action:@selector(onLeftTouch) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _leftItemBtn;
}

-(UIButton *)rightItemBtn
{
    if (!_rightItemBtn)
    {
     _rightItemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
     [_rightItemBtn addTarget:self action:@selector(onRightTouch) forControlEvents:UIControlEventTouchUpInside];
    
    }
    
    return _rightItemBtn;
}

@end
