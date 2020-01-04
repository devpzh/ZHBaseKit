//
//  ZHAppDelegate.m
//  ZHBaseKit
//
//  Created by Panzhenghui on 11/01/2019.
//  Copyright (c) 2019 Panzhenghui. All rights reserved.
//

#import "ZHAppDelegate.h"
#import "ZHViewController.h"

@implementation ZHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self customization];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[ZHViewController new]];
    [self.window makeKeyAndVisible];
    return YES;
}


-(void)customization
{
    [ZHBaseKit appearance].backIconName = @"back";
}


@end
