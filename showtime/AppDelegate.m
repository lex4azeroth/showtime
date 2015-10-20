//
//  AppDelegate.m
//  NotificationApp
//
//  Created by 马 烜￼昊 on 15/9/24.
//  Copyright (c) 2015年 lex. All rights reserved.
//

#import "AppDelegate.h"
#import "DetailViewController.h"
#import "LoginViewController.h"
#import "MainListViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (AppDelegate *)sharedAppDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    [self showLoginViewIfNeededAnimated: NO];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)showLoginViewIfNeededAnimated:(BOOL)animated
{
    UIViewController *presenter = self.window.rootViewController;
    if (presenter.presentedViewController)
    {
        [presenter dismissViewControllerAnimated:animated completion:^{
            [self showLoginViewAnimated:animated];
        }];
    }
    else
    {
        [self showLoginViewAnimated:animated];
    }
}

- (void)showLoginViewAnimated:(BOOL)animated
{
    LoginViewController *loginViewController = [[LoginViewController alloc] init];
    
    _navigationController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    _navigationController.navigationBar.translucent = NO;
    
    [self.window.rootViewController presentViewController:_navigationController animated:animated completion:nil];
}

- (void)showMainListViewAnimated:(BOOL)animated
{
    MainListViewController* mainListViewController = [[MainListViewController alloc] init];
    
//    _navigationController = [[UINavigationController alloc] initWithRootViewController:mainListViewController];
    _navigationController.navigationBar.translucent = NO;
    
//    _navigationController.visibleViewController = mainListViewController;
//    [self.window.rootViewController presentViewController:_navigationController animated:animated completion:nil];

    
}
@end
