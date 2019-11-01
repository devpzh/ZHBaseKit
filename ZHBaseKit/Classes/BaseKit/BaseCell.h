
//
//  Created by pzh on 16/9/23.
//  Copyright © 2016年 me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCellModel.h"
@interface BaseCell : UIView

-(void)onLoad;
-(void)dataDidChanged;
-(void)layoutDidFinish;
-(void)whenTapped;

@property (nonatomic,strong) id data;
@property (nonatomic,weak)   id delegate;
@property (nonatomic,assign) BOOL tapEnabled;
@end
