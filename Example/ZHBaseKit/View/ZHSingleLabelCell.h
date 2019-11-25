//
//  ZHOneLabelCell.h
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/7.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHBaseCell.h"


NS_ASSUME_NONNULL_BEGIN
AD_PROTOCOL(ZHSingleLabelCell, Touch)
@interface ZHSingleLabelCell : ZHBaseCell
@property (nonatomic, strong) UILabel * contentLb;
@property (nonatomic, strong) UIView  * line;
@end

NS_ASSUME_NONNULL_END
