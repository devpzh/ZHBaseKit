//
//  BaseCell.m
//
//  Created by apple on 16/6/25.
//  Copyright © 2016年 me. All rights reserved.
//

#import "BaseCell.h"
@implementation BaseCell
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
     if ([data isKindOfClass:[BaseCellModel class] ])
     {
        BaseCellModel * model = (BaseCellModel*)data;
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
{  self.tapEnabled = YES;
}

-(void)dataDidChanged{}


-(void)whenTapped{}


-(void)layoutSubviews
{
    if(self.frame.size.width > 0 || self.frame.size.height > 0)
    {
        [self layoutDidFinish];
    }
    
}

-(void)layoutDidFinish{}

@end
