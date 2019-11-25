//
//  ZHCollectionViewSection.h
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/7.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHBaseCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZHCollectionViewSection : NSObject

///< minimumLineSpacing
@property (nonatomic,assign) CGFloat minimumLineSpacing;

///< minimumInteritemSpacing
@property (nonatomic,assign) CGFloat minimumInteritemSpacing;

///<insetForSection
@property (nonatomic,assign) UIEdgeInsets edgeInset;

///< Section Header Model
@property (nonatomic, strong) ZHBaseCellModel * headerModel;

///< Section Footer Model
@property (nonatomic, strong) ZHBaseCellModel * footerModel;

///< Cell Model
@property (nonatomic, strong) NSMutableArray <ZHBaseCellModel*> * rowsArray;

@end

NS_ASSUME_NONNULL_END
