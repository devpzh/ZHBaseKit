//
//  ZHBaseBoard.h
//
//  Created by pzh on 2019/11/6.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHBase.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZHBaseBoard : UIViewController

@property(nonatomic,strong)UIView  *baseNavigationBar; //导航栏
@property(nonatomic,strong)UIView  *titleViewContainer;//导航标题栏容器
@property(nonatomic,strong)UIView  *navigationBarSeparator;//导航栏分割线

@property(nonatomic,strong)UIView  *leftItem;  //导航左键
@property(nonatomic,strong)UIView  *rightItem; //导航右键
@property(nonatomic,strong)UIView  *titleView; //导航标题栏


-(void)onload;
-(void)onUnload;

-(void)onViewCreate;
-(void)onViewLayOut;
-(void)onViewWillAppear;
-(void)onViewDidAppear;
-(void)onViewWillDisappear;
-(void)onViewDiddisappear;

/**
   default popViewControllerAnimated
 */
-(void)onLeftTouch;
-(void)onRightTouch;

/**
  The following method can be rewritten to extend.
 */
-(void)onNavigationBarCreate;
-(void)onNavigationTitleViewCreate;

/**
  default is back icon
 */
-(void)onNavigationLeftItemCreate;
-(void)onNavigationRightItemCreate;

/**
   titleView  text,image,view
 */
-(void)showNavigationTitle:(NSString*)text;
-(void)showNavigationTitleWithImage:(UIImage*)image;
-(void)showNavigationTitleWithView:(UIView*)view;

/**
  leftItem with text,image,view
*/
-(void)showLeftItemWithText:(NSString*)text;
-(void)showLeftItemWithImage:(UIImage*)image;
-(void)showLeftItemWithCustomerView:(UIView*)view;

/**
  rightItem with text,image,view
*/
-(void)showRightItemWithText:(NSString*)text;
-(void)showRightItemWithImage:(UIImage*)image;
-(void)showRightItemWithCustomerView:(UIView*)view;

/**
  navigationBar hidden or show
 */
-(void)hideNavigationBar;
-(void)showNavigationBar;

/**
  leftItem hidden or show
*/
-(void)showNavigationLeftItem;
-(void)hideNavigationLeftItem;

/**
  rightItem hidden or show
*/
-(void)showNavigationRightItem;
-(void)hideNavigationRightItem;



@end

NS_ASSUME_NONNULL_END
