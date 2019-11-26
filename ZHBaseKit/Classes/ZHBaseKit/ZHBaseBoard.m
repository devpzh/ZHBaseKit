//
//  ZHBaseBoard.m
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/6.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHBaseBoard.h"

@interface ZHBaseBoard ()
@property (nonatomic, strong) UIButton * leftItemBtn;
@property (nonatomic, strong) UIButton * rightItemBtn;
@end

@implementation ZHBaseBoard

#pragma mark --- Public Methods
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

-(void)onload{}

-(void)onUnload{}

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


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self  onViewCreate];
    [self  onViewLayOut];
    
}

-(void)onViewCreate
{
     self.view.backgroundColor =   [UIColor whiteColor];
     [self onNavigationBarCreate]; //默认创建导航栏
    
     if (!self.navigationController) return;
       self.navigationController.navigationBar.hidden = YES;
    
}

-(void)onViewLayOut{}

-(void)onViewWillAppear{}

-(void)onViewDidAppear{}

-(void)onViewWillDisappear{}

-(void)onViewDiddisappear{}

-(void)onLeftTouch
{
    if (!self.navigationController)return;
    [self.navigationController popViewControllerAnimated:YES];
    
}

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
    [self.baseNavigationBar addSubview:self.titleViewContainer];
    [self.titleViewContainer mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.left.right.bottom.equalTo(self.baseNavigationBar);
        make.top.equalTo(self.baseNavigationBar).offset(kStatusBarHeight);
    }];
}


-(void)onNavigationBarSeparatorView
{
    [self.titleViewContainer addSubview:self.navigationBarSeparator];
    [self.navigationBarSeparator mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.left.right.bottom.equalTo(self.titleViewContainer);
        make.height.equalTo(@0.5);
    }];
    
}

-(void)onNavigationTitleViewCreate
{
    
}

-(void)onNavigationLeftItemCreate
{
     [self showLeftItemWithImage:[UIImage imageNamed:[ZHBaseKit appearance].backIconName]];
}

-(void)onNavigationRightItemCreate
{
    
}


-(void)showNavigationTitle:(NSString*)text
{
   
    UILabel* lable      = [[UILabel alloc]init];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.text          = text;
    lable.textColor     = [ZHBaseKit appearance].naviBarTitleColor;
    lable.font          = [ZHBaseKit appearance].naviBarTitleFont;
    
    [self.titleView removeFromSuperview];
    self.titleView  = lable;
    [self.titleViewContainer addSubview:lable];
    [lable mas_makeConstraints:^(MASConstraintMaker *make)
     {
        make.center.equalTo(self.titleViewContainer);
        make.width.lessThanOrEqualTo(@(kNavigationBarTitleViewWidth));
    }];
   
}

-(void)showNavigationTitleWithImage:(UIImage*)image
{
    UIImageView* imageView = [[UIImageView alloc]init];
    imageView.image           = image;
    [self.titleView removeFromSuperview];
    self.titleView  = imageView;
    [self.titleViewContainer addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.size.equalTo(@(image.size));
        make.center.equalTo(self.titleViewContainer);
    }];
  
    
}

-(void)showNavigationTitleWithView:(UIView*)view
{
    [self.titleView removeFromSuperview];
     self.titleView = view;
    [self.baseNavigationBar addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.center.equalTo(self.titleViewContainer);
    }];
}

-(void)showLeftItemWithText:(NSString*)text
{
    [self.leftItemBtn removeFromSuperview];
    [self.leftItem removeFromSuperview];
  
    UILabel* label      = [[UILabel alloc]init];
    label.textColor     = [ZHBaseKit appearance].leftItemTitleColor;
    label.font          = [ZHBaseKit appearance].leftItemTitleFont;
    label.text          = text;
    label.textAlignment = NSTextAlignmentLeft;
   
    [self.titleViewContainer addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.left.equalTo(self.titleViewContainer).offset(kPadding);
        make.centerY.equalTo(self.titleViewContainer);
        if (self.titleView)
        {
            make.right.lessThanOrEqualTo(self.titleView.mas_left).offset(-5);
        }else
        {
            make.width.equalTo(@((kScreemWidth-kNavigationBarTitleViewWidth)/2-kPadding-5));
        }
        
    }];
    
    self.leftItem   = label;
    [self onNavigationLeftItemBtnCreate];
    
}

-(void)showLeftItemWithImage:(UIImage*)image
{
    [self.leftItemBtn removeFromSuperview];
    [self.leftItem removeFromSuperview];

    UIImageView* imageView = [[UIImageView alloc]init];
    imageView.image = image;
    [self.titleViewContainer addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.left.equalTo(self.baseNavigationBar).offset(kPadding);
        make.centerY.equalTo(self.titleViewContainer);
        make.size.equalTo(@(image.size));
    }];
    
    self.leftItem = imageView;
    [self onNavigationLeftItemBtnCreate];
}

-(void)showLeftItemWithCustomerView:(UIView*)view
{
    [self.leftItemBtn removeFromSuperview];
    [self.leftItem removeFromSuperview];
   
    [self.titleViewContainer addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.left.equalTo(self.titleViewContainer).offset(kPadding);
        make.centerY.equalTo(self.titleViewContainer);
    }];
    
    self.leftItem = view;
    [self onNavigationLeftItemBtnCreate];
}

-(void)showRightItemWithText:(NSString*)text
{
    [self.rightItemBtn removeFromSuperview];
    [self.rightItem removeFromSuperview];
  
    UILabel* label      = [[UILabel alloc]init];
    label.textColor     = [ZHBaseKit appearance].rightItemTitleColor;
    label.font          = [ZHBaseKit appearance].rightItemTitleFont;
    label.text          = text;
    label.textAlignment = NSTextAlignmentRight;
   
    [self.titleViewContainer addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.right.equalTo(self.titleViewContainer.mas_right).offset(-kPadding);
        make.centerY.equalTo(self.titleViewContainer);
        if (self.titleView)
        {
            make.left.greaterThanOrEqualTo(self.titleView.mas_right).offset(5);
        }else
        {
            make.width.equalTo(@((kScreemWidth-kNavigationBarTitleViewWidth)/2-kPadding-5));
        }
        
    }];
  
    self.rightItem  = label;
    [self onNavigationRightItemBtnCreate];
}

-(void)showRightItemWithImage:(UIImage*)image
{
    [self.rightItemBtn removeFromSuperview];
    [self.rightItem    removeFromSuperview];

    UIImageView* imageView = [[UIImageView alloc]init];
    imageView.image = image;
    
    [self.titleViewContainer addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.size.equalTo(@(image.size));
        make.centerY.equalTo(self.titleViewContainer);
        make.right.equalTo(self.titleViewContainer.mas_right).offset(-kPadding);
    }];
    self.rightItem = imageView;
    [self onNavigationRightItemBtnCreate];
    
}
-(void)showRightItemWithCustomerView:(UIView*)view
{
    [self.rightItemBtn removeFromSuperview];
    [self.rightItem    removeFromSuperview];
    [self.titleViewContainer addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.right.equalTo(self.titleViewContainer).offset(-kPadding);
         make.centerY.equalTo(self.titleViewContainer);
     }];
    
    self.rightItem = view;
    [self onNavigationRightItemBtnCreate];
}


-(void)onNavigationLeftItemBtnCreate
{
    [self.titleViewContainer addSubview:self.leftItemBtn];
    [self.leftItemBtn mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.edges.equalTo(self.leftItem).insets(UIEdgeInsetsMake(0, -kPadding, 0, -kPadding));
    }];
}

-(void)onNavigationRightItemBtnCreate
{
    
    [self.titleViewContainer addSubview:self.rightItemBtn];
    [self.rightItemBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.rightItem).insets(UIEdgeInsetsMake(0, -kPadding, 0, 0));
    }];
    
}


-(void)showNavigationBar
{
    self.baseNavigationBar.hidden = NO;
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

-(void)hideNavigationBar
{
    self.baseNavigationBar.hidden = YES;
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

-(UIView *)titleViewContainer
{
    if (!_titleViewContainer)
    {
        _titleViewContainer = [[UIView alloc]init];
        _titleViewContainer.backgroundColor = [UIColor clearColor];
    }
    
    return _titleViewContainer;
}

-(UIView *)navigationBarSeparator
{
    if (!_navigationBarSeparator)
    {
         _navigationBarSeparator = [[UIView alloc]init];
         _navigationBarSeparator.backgroundColor = [ZHBaseKit appearance].naviBarSeparatorColor;
    }
    return _navigationBarSeparator;
}

-(UIButton *)leftItemBtn
{
    if (!_leftItemBtn)
    {
       _leftItemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
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
