//
//  AppDelegate.m
//  Eat
//
//  Created by Skylin on 2017/8/31.
//  Copyright © 2017年 Sky. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initEatList];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:[[ViewController alloc]init]];
    nav.navigationBar.translucent=NO;
    [self.window setRootViewController:nav];
    [self.window makeKeyAndVisible];
    
    return YES;
}
-(void)initEatList
{
    if (!ARRAY_IS_NOT_EMPTY(GetUserDefaults(k_UserDefine_EatList))) {
        NSArray * arr = @[@"拉面",@"麻辣烫",@"水饺"];
        SaveUserDefaults(k_UserDefine_EatList, arr);
    }
}
@end
