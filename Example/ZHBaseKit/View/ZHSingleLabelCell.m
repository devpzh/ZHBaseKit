//
//  ZHOneLabelCell.m
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/7.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHSingleLabelCell.h"
#import "ZHSingleLabelCellModel.h"

@implementation ZHSingleLabelCell

-(void)onLoad
{
    [super onLoad];
   
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.contentLb];
    [self.contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kPadding);
        make.centerY.equalTo(self);
    }];
    
    [self addSubview:self.line];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(8);
        make.right.equalTo(self).offset(-8);
        make.bottom.equalTo(self);
        make.height.equalTo(@0.5);
    }];
    
}

-(void)dataDidChanged
{
    if (!self.data) return;
    
    ZHSingleLabelCellModel * model = (ZHSingleLabelCellModel*)self.data;
    self.contentLb.text = model.content;
    
}

-(void)onTouch
{
    DEF_PROTOCOL(ZHSingleLabelCell, Touch, self.data)
}

#pragma mark --- Lazy Loading
-(UILabel *)contentLb
{
    if (!_contentLb)
    {
        _contentLb = [[UILabel alloc]init];
        _contentLb.textColor = [UIColor blackColor];
        _contentLb.font = kFont(15.0);
    }
    return _contentLb;
}

-(UIView *)line
{
    
    if (!_line)
    {
        _line = [[UIView alloc] init];
        _line.backgroundColor = RGB(235.0, 235.0, 235.0);

    }
    
    return _line;
}

@end
