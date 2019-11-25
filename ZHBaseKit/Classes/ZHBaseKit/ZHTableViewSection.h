//
//  ZHTableViewSection.h
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/6.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHBaseCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZHTableViewSection : NSObject

///< Section Header Model
@property (nonatomic, strong) ZHBaseCellModel * headerModel;

///< Section Footer Model
@property (nonatomic, strong) ZHBaseCellModel * footerModel;

///< Cell Model
@property (nonatomic, strong) NSMutableArray <ZHBaseCellModel*> * rowsArray;
@end

NS_ASSUME_NONNULL_END
