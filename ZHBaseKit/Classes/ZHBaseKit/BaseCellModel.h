//
//  BaseCellModel.h
//  爱动
//
//  Created by apple on 16/6/25.
//  Copyright © 2016年 aidong. All rights reserved.
//


#import "BaseModel.h"

@interface BaseCellModel : BaseModel

@property (nonatomic,weak)id delegate;
@property (nonatomic,copy)   NSString * cellClassName;
@property (nonatomic,assign) CGFloat    cellHeight;
@property (nonatomic,assign) CGFloat    cellWidth;
@end
