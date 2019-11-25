//
//  ZHBaseCellModel.h
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/6.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHBase.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZHBaseCellModel : NSObject

@property (nonatomic,weak)   id delegate;
@property (nonatomic,copy)   NSString * cellClassName;
@property (nonatomic,assign) CGFloat    cellHeight;
@property (nonatomic,assign) CGFloat    cellWidth;

@end

NS_ASSUME_NONNULL_END
