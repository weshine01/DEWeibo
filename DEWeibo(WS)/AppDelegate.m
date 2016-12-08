//
//  AppDelegate.m
//  DEWeibo(WS)
//
//  Created by user on 2016/12/1.
//  Copyright © 2016年 王韦翔. All rights reserved.
//

#import "AppDelegate.h"
#import "WSTabController.h"
#import "WSNewFeatureController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 1.初始化窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    
    // 2.设置根控制器
    // 2.1如果用户没用使用过软件，显示新特性
    // 从沙盒取版本号
    NSString *version = [NSUserDefaults versionFromSandBox];
    NSString *currentVision = [NSUserDefaults versionFromInfoPlist];
    
    NSLog(@"== %@",version);
    if(version == nil){//代表未使用过应用
        WSNewFeatureController *newContr =[[WSNewFeatureController alloc] init];
        self.window.rootViewController = newContr;
    }else if([currentVision doubleValue] > [version doubleValue]){
        // 2.2如果版本号更新，显示新特性
        WSNewFeatureController *newContr =[[WSNewFeatureController alloc] init];
        self.window.rootViewController = newContr;
    }else{
        // 2.3显示TabbarController
        WSTabController *tabController = [[WSTabController alloc] init];
        self.window.rootViewController = tabController;
    }
    
    
    // 3.显示窗口
    [self.window makeKeyAndVisible];
    
    
    return YES;
    
}

















- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
