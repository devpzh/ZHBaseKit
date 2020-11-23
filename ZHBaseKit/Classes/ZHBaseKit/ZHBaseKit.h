//
//  ZHBaseKit.h
//  ZHBaseKit
//
//  Created by pzh on 2019/11/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHBaseKit : NSObject

+(instancetype)appearance;

///< backgroundColor default whiteColor
@property (nonatomic, strong) UIColor * backgroundColor;

///< naviBarBackgroundColor   default white
@property (nonatomic, strong) UIColor * naviBarBackgroundColor;

///< naviBarTitleColor default black
@property (nonatomic, strong) UIColor * naviBarTitleColor;

///< naviBarTitleFont  default boldFont16
@property (nonatomic, strong) UIFont * naviBarTitleFont;

///< leftItemTitleColor  default black
@property (nonatomic, strong) UIColor * leftItemTitleColor;

///< leftItemTitleFont default font15
@property (nonatomic, strong) UIFont * leftItemTitleFont;

///< rightItemTitleColor  default black
@property (nonatomic, strong) UIColor * rightItemTitleColor;

///< rightItemTitleFont default font15
@property (nonatomic, strong) UIFont * rightItemTitleFont;

///< default RGB(235.0, 235.0, 235.0)
@property (nonatomic, strong) UIColor * naviBarSeparatorColor;

///< backIconName
@property (nonatomic, copy)   NSString * backIconName;


@end

NS_ASSUME_NONNULL_END
