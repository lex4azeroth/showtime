//
//  AppDelegate.h
//  NotificationApp
//
//  Created by 马 烜￼昊 on 15/9/24.
//  Copyright (c) 2015年 lex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) UINavigationController *navigationController;
//@property (strong, nonatomic) PKRevealController *revealController;

+ (AppDelegate *)sharedAppDelegate;

- (void)showLoginViewIfNeededAnimated:(BOOL)animated;
- (void)showMainListViewAnimated:(BOOL)animated;
@end

