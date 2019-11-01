//
//  UIMacro.h
//  FitnessNews
//
//  Created by apple on 16/3/5.
//  Copyright © 2016年 com.e-mxing. All rights reserved.
//

#ifndef UIMacro_h
#define UIMacro_h

#pragma mark color


#pragma mark font

#define kFont(X)            [UIFont fontWithName:@"PingFangSC-Regular" size:X]
#define kFontBold(X)        [UIFont fontWithName:@"PingFangSC-Medium" size:X]
#define kFontThin(X)        [UIFont fontWithName:@"PingFangSC-Regular-Thin"  size:X]
#define kFontLight(X)       [UIFont fontWithName:@"PingFangSC-Regular-Light" size:X]


#pragma mark size
#define kScreemWidth        [UIScreen mainScreen].bounds.size.width
#define kScreemHeight       [UIScreen mainScreen].bounds.size.height


#define kPadding 15.0

#define kNavigationBarHeight  (is_iPhoneX ? 88.f : 64.f)
#define kStatusBarHeight      (is_iPhoneX ? 44.f : 20.f)
#define kTabbarHeight         (is_iPhoneX ? 83.f : 49.f)
#define kBottomGapHeight      (is_iPhoneX ? 34.f : 0.f) //部分页面底部按钮适配 iPhoneX 所需高度

#define is_iPhoneX  ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) ||    CGSizeEqualToSize(CGSizeMake(1242, 2688),  [[UIScreen mainScreen] currentMode].size) ||  CGSizeEqualToSize(CGSizeMake(828, 1792),   [[UIScreen mainScreen] currentMode].size)) : NO)

#define is_iPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)



#endif /* UIMacro_h */
