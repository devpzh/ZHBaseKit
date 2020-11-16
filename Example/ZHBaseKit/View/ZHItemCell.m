//
//  ZHItemCell.m
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/8.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHItemCell.h"
#import "ZHItemCellModel.h"

@implementation ZHItemCell

-(void)onLoad
{
    [super onLoad];
    
    self.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.contentLb];
    [self.contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}


-(void)dataDidChanged
{
    if (!self.data) return;
    ZHItemCellModel * model = (ZHItemCellModel*)self.data;
    self.contentLb.text = model.content;
    
    
}

- (void)onTouch
{
    ZHItemCellModel * model = (ZHItemCellModel*)self.data;
    model.content = @"reload items";
    if (self.reloadsRowsBlock) {
        self.reloadsRowsBlock();
    }
    
}

-(UILabel *)contentLb
{
    if (!_contentLb)
    {
        _contentLb = [[UILabel alloc]init];
        _contentLb.textAlignment = NSTextAlignmentCenter;
        _contentLb.textColor = [UIColor blackColor];
        _contentLb.font = kFont(15.0);
    }
    return _contentLb;
}



@end
