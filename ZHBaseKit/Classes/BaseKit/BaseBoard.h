//
//
//  BaseBoard.h
//
//  Created by pzh on 16/9/23.
//  Copyright © 2016年 me. All rights reserved.
//

#pragma mark -
#import <UIKit/UIKit.h>

@interface BaseBoard : UIViewController

@property(nonatomic,strong)UIView  *baseNavigationBar; //导航栏
@property(nonatomic,strong)UIView  *titleContainer;//导航标题栏容器
@property(nonatomic,strong)UIView  *barSeparatorView;//导航栏分割线


@property(nonatomic,strong)UIView  *leftItem; //导航左键
@property(nonatomic,strong)UIView  *rightItem; //导航右键
@property(nonatomic,strong)UIView  *titleView; //导航标题栏


@property(nonatomic,assign)BOOL   allowedSwipeToBack;

-(void)onload;
-(void)onUnload;

-(void)onViewCreate;
-(void)onViewLayOut;
-(void)onViewWillAppear;
-(void)onViewDidAppear;
-(void)onViewWillDisappear;
-(void)onViewDiddisappear;


-(void)onLeftTouch;
-(void)onRightTouch;

-(void)onNavigationBarCreate;
-(void)onNavigationTitleViewCreate;
-(void)onNavigationLeftItemCreate;
-(void)onNavigationRightItemCreate;


-(void)hideNavigationBar;
-(void)showNavigationBar;
-(void)showNavigationTitle:(NSString*)title;
-(void)showNavigationTitleWithImage:(UIImage*)image;
-(void)showNavigationTitleWithView:(UIView*)view;


///< 下面方法放到onCreateNavigationLeftItem
-(void)showLeftItemWithText:(NSString*)text;
-(void)showLeftItemWithImage:(UIImage*)image;
-(void)showLeftItemWithCustomerView:(UIView*)view;

///< 下面方法放到onCreateNavigationRightItem
-(void)showRightItemWithText:(NSString*)text;
-(void)showRightItemWithImage:(UIImage*)image;
-(void)showRightItemWithCustomerView:(UIView*)view;

-(void)showNavigationLeftItem;
-(void)showNavigationRightItem;
-(void)hideNavigationLeftItem;
-(void)hideNavigationRightItem;



@end
