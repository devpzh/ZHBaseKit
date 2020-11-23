//
//  ZHUIMacro.h
//  ZHBaseKit
//
//  Created by pzh on 2019/11/6.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#ifndef ZHUIMacro_h
#define ZHUIMacro_h


#pragma mark color

#undef  RGB
#define RGB(R,G,B)        [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1.0f]

#undef    RGBA
#define RGBA(R,G,B,A)     [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]

#define kBarTitleColor      [UIColor blackColor]


#pragma mark font
#define kFont(X)            [UIFont fontWithName:@"PingFangSC-Regular" size:X]
#define kFontBold(X)        [UIFont fontWithName:@"PingFangSC-Medium" size:X]
#define kFontThin(X)        [UIFont fontWithName:@"PingFangSC-Regular-Thin"  size:X]
#define kFontLight(X)       [UIFont fontWithName:@"PingFangSC-Regular-Light" size:X]


#pragma mark size
#define kScreenWidth        [UIScreen mainScreen].bounds.size.width
#define kScreenHeight       [UIScreen mainScreen].bounds.size.height
#define kNavigationBarTitleViewWidth      (kScreenWidth*2/3)


#define kPadding 15.0

#define kNavigationBarHeight  (is_iPhoneX ? 88.f : 64.f)
#define kStatusBarHeight      (is_iPhoneX ? 44.f : 20.f)
#define kTabbarHeight         (is_iPhoneX ? 83.f : 49.f)
#define kBottomPaddingHeight      (is_iPhoneX ? 34.f : 0.f) //部分页面底部按钮适配 iPhoneX 所需高度

#define is_iPhoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})


#define is_iPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)


#endif /* ZHUIMacro_h */
