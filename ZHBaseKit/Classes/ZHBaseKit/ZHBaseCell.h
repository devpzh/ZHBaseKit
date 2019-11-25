//
//  ZHBaseCell.h
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/6.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface ZHBaseCell : UIView

-(void)onLoad;
-(void)dataDidChanged;
-(void)layoutDidFinish;
-(void)onTouch;

@property (nonatomic,strong) id data;
@property (nonatomic,weak)   id delegate;
@property (nonatomic,assign) BOOL tapEnabled;


@end

NS_ASSUME_NONNULL_END
