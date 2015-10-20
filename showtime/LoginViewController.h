//
//  LoginViewController.h
//  NotificationApp
//
//  Created by 马 烜￼昊 on 15/9/24.
//  Copyright (c) 2015年 lex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) UITableView* loginTableView;
@property (nonatomic, strong) UITextField* accountTextField;
@property (nonatomic, strong) UITextField* passwordTextField;

- (void)login;

@end