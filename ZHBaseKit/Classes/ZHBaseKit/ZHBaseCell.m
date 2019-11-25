//
//  ZHBaseCell.m
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/6.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import "ZHBaseCell.h"
#import "ZHBaseCellModel.h"

@implementation ZHBaseCell
{
    dispatch_once_t onceToken;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        dispatch_once(&onceToken, ^{
            [self onLoad];
        });
        if(frame.size.width > 0 || frame.size.height > 0)
            [self layoutDidFinish];
    }
    return self;
}

-(instancetype)init
{
    self = [super init];
    if(self)
    {
        dispatch_once(&onceToken, ^{
            [self onLoad];
        
        });
    }
    
    return self;
}


-(void)setData:(id)data
{
    _data = data;
     if ([data isKindOfClass:[ZHBaseCellModel class] ])
     {
        ZHBaseCellModel * model = (ZHBaseCellModel*)data;
        if (model.delegate)
        {
            self.delegate = model.delegate;
        }
    }
    
    [self dataDidChanged];
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    if(frame.size.width > 0 || frame.size.height > 0){
        
        [self layoutDidFinish];
    }
    
}


-(void)setTapEnabled:(BOOL)tapEnabled
{
    
    _tapEnabled = tapEnabled;
    if (_tapEnabled)
    {
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer * gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onTouch)];
        [self addGestureRecognizer:gesture];
        
    }else
    {
        self.userInteractionEnabled = NO;
        for (UIGestureRecognizer *ges in self.gestureRecognizers)
        {
            [self removeGestureRecognizer:ges];
        }
        
        
    }
    
}

///< 默认父类添加手势,当子类有手势的时候不要调用Super onLoad,否则无效。
-(void)onLoad
{
    self.tapEnabled = YES;
}

-(void)dataDidChanged{}


-(void)onTouch{}


-(void)layoutSubviews
{
    if(self.frame.size.width > 0 || self.frame.size.height > 0)
    {
        [self layoutDidFinish];
    }
    
}

-(void)layoutDidFinish{}



@end
