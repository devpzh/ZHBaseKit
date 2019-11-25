//
//  ZHProxy.h
//  ZHBaseKit_Example
//
//  Created by pzh on 2019/11/25.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHProxy : NSObject
@property (nonatomic, strong, readonly) NSPointerArray *targets;
- (void)addTarget:(id)target;
- (void)removeTarget:(id)target;
@end

NS_ASSUME_NONNULL_END
