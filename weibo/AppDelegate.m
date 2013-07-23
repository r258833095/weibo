//
//  AppDelegate.m
//  weibo
//
//  Created by 斌 on 13-7-19.
//  Copyright (c) 2013年 斌. All rights reserved.
//

#import "AppDelegate.h"
#import <ShareSDK/ShareSDK.h>
#import "WBApi.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    [ShareSDK registerApp:@"5fa4090d522"];
    
    [ShareSDK connectSinaWeiboWithAppKey:@"3188745070"
                               appSecret:@"f9e985edf291ac408dd04fcd1692cbcb"
                             redirectUri:@"http://uibear.com"];
    
    [ShareSDK connectTencentWeiboWithAppKey:@"801387334"
                                  appSecret:@"e0c6f2f8d343de754283e4d4632cc19a"
                                redirectUri:@"http://uibear.com"
                                   wbApiCls:[WBApi class]];


    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
