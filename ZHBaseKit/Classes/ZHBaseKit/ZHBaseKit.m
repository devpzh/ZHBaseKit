//
//  ZHBaseKit.m
//  ZHBaseKit
//
//  Created by pzh on 2019/11/25.
//

#import "ZHBaseKit.h"
#import "ZHUIMacro.h"

@implementation ZHBaseKit
+(instancetype)appearance
{
    static ZHBaseKit * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ZHBaseKit alloc]init];
    });
    return manager;
}

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        self.backgroundColor        = [UIColor clearColor];
        self.naviBarBackgroundColor = [UIColor whiteColor];
        self.naviBarTitleColor      = [UIColor blackColor];
        self.naviBarTitleFont       = kFontBold(16);
        self.leftItemTitleFont=self.rightItemTitleFont=kFont(15);
        self.rightItemTitleColor=self.rightItemTitleColor=[UIColor blackColor];
        self.naviBarSeparatorColor = RGB(235.0, 235.0, 235.0);
        
   }
    return self;

}

@end
