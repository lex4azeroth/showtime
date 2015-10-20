//
//  LoginViewController.m
//  NotificationApp
//
//  Created by 马 烜￼昊 on 15/9/24.
//  Copyright (c) 2015年 lex. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import "MainListViewController.h"
#import "sys/utsname.h"
@interface LoginViewController() <UIGestureRecognizerDelegate, UIActionSheetDelegate/*, TTTAttributedLabelDelegate*/>

@property UIButton* submit;
//@property TTTAttributedLabel *tips;

@end

@implementation LoginViewController

- (void)login
{
    // Check network first
    
    // Validate inputs
    NSString* user = _accountTextField.text;
    NSString* password = _passwordTextField.text;
    
//    if (user.length == 0) {
//        // make a toast here
//        return;
//    }
//    
//    if (password.length == 0) {
//        // make a toast here
//        return;
//    }
    
    NSDictionary* loginPara = @{@"appKey"   :@"notificationApp",
                                @"user"     :user,
                                @"password" :password};
    
    MainListViewController* mainListViewController = [[MainListViewController alloc] init];
    
    [self.navigationController pushViewController:mainListViewController animated:YES];
    
//    UINavigationController *front = [[UINavigationController alloc] initWithRootViewController:mainListViewController];
//    AppDelegate *appDelegate = [AppDelegate sharedAppDelegate];
//    [appDelegate showMainListViewAnimated:NO];
    
    
//    if ([user isEqualToString:@"Peter"] && [password isEqualToString:@"P"]) {
//        // Login without network.
//        MainListViewController* mainListViewController = [[MainListViewController alloc] init];
//        
//        UINavigationController *front = [[UINavigationController alloc] initWithRootViewController:mainListViewController];
////        AppDelegate *appDelegate = [AppDelegate sharedAppDelegate];
////        [appDelegate.revealController setFrontViewController:front];
////        [appDelegate.revealController showViewController:self.revealController.frontViewController];
//    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Welcome to Notification Center";
    
    [self initSubviews];
    [self setLayout];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
#if 1
    [self.navigationController.navigationBar setTranslucent:NO];
#else
    //适配iOS7uinavigationbar遮挡tableView的问题
    if([[[UIDevice currentDevice]systemVersion]floatValue]>=7.0)
    {
        self.parentViewController.edgesForExtendedLayout = UIRectEdgeNone;
        self.parentViewController.automaticallyAdjustsScrollViewInsets = NO;
    }
#endif
    
    //    if (self.navigationController.viewControllers.count <= 1) {
    //        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"three_lines"]
    //                                                                                 style:UIBarButtonItemStylePlain
    //                                                                                target:self
    //                                                                                action:@selector(showMenu)];
    //    }
    
    
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
//    [self.navigationItem setBackBarButtonItem:backItem];
//    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注册"
//                                                                              style:UIBarButtonItemStylePlain
//                                                                             target:self
//                                                                             action:@selector(createAccount)];
}

#pragma mark - about subviews
- (void)initSubviews
{
    self.accountTextField = [[UITextField alloc] init];
    self.accountTextField.placeholder = @"Account/Email";
    self.accountTextField.textColor = [UIColor colorWithRed:56.0f/255.0f green:84.0f/255.0f blue:135.0f/255.0f alpha:1.0f];
    self.accountTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.accountTextField.keyboardType = UIKeyboardTypeEmailAddress;
    self.accountTextField.delegate = self;
    self.accountTextField.returnKeyType = UIReturnKeyNext;
    self.accountTextField.enablesReturnKeyAutomatically = YES;
    
    [self.accountTextField addTarget:self action:@selector(returnOnKeyboard:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.view addSubview: self.accountTextField];
    
    self.passwordTextField = [UITextField new];
    self.passwordTextField.placeholder = @"Password";
    self.passwordTextField.textColor = [UIColor colorWithRed:56.0f/255.0f green:84.0f/255.0f blue:135.0f/255.0f alpha:1.0f];
    self.passwordTextField.secureTextEntry = YES;
    self.passwordTextField.delegate = self;
    self.passwordTextField.returnKeyType = UIReturnKeyDone;
    self.passwordTextField.enablesReturnKeyAutomatically = YES;
    
    [self.accountTextField addTarget:self action:@selector(returnOnKeyboard:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.passwordTextField addTarget:self action:@selector(returnOnKeyboard:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self.view addSubview: self.accountTextField];
    [self.view addSubview: self.passwordTextField];
    
    self.submit = [UIButton buttonWithType:UIButtonTypeCustom];
//    [Tools roundView:self.submit cornerRadius:5.0];
    self.submit.backgroundColor = [UIColor colorWithRed:0.000 green:0.620 blue:0.059 alpha:1.0];
    [self.submit setTitle:@"Login" forState:UIControlStateNormal];
    self.submit.titleLabel.font = [UIFont systemFontOfSize:17];
    [self.submit addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: self.submit];

    
    //添加手势，点击屏幕其他区域关闭键盘的操作
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidenKeyboard)];
    gesture.numberOfTapsRequired = 1;
    gesture.delegate = self;
    [self.view addGestureRecognizer:gesture];
}

- (void)setLayout
{
    UIImageView *loginLogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loginLogo"]];
    loginLogo.contentMode = UIViewContentModeScaleAspectFit;
    UIImageView *email = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"email"]];
    email.contentMode = UIViewContentModeScaleAspectFill;
    UIImageView *password = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"password"]];
    password.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:loginLogo];
    [self.view addSubview:email];
    [self.view addSubview:password];
    
    for (UIView *view in [self.view subviews]) {
        view.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    NSDictionary *viewsDict = NSDictionaryOfVariableBindings(loginLogo, email, password, _accountTextField, _passwordTextField, /*_tips,*/ _submit);
    
//    NSDictionary *viewsDict = NSDictionaryOfVariableBindings(loginLogo, email, password, _accountTextField, _passwordTextField);
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[loginLogo(90)]-25-[email(20)]-20-[password(20)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:viewsDict]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|->=50-[loginLogo(90)]->=50-|"
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:viewsDict]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:loginLogo
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.f constant:0.f]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-30-[email(20)]-[_accountTextField]-30-|"
                                                                      options:NSLayoutFormatAlignAllCenterY
                                                                      metrics:nil
                                                                        views:viewsDict]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-30-[password(20)]-[_passwordTextField]-30-|"
                                                                      options:NSLayoutFormatAlignAllCenterY
                                                                      metrics:nil
                                                                        views:viewsDict]];
    
    //    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[password]->=20-[submit(35)]-20-[_tips]"
    //                                                                      options:NSLayoutFormatAlignAllLeft
    //                                                                      metrics:nil
    //                                                                        views:viewsDict]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[password]->=20-[_submit(35)]"
                                                                      options:NSLayoutFormatAlignAllLeft
                                                                      metrics:nil
                                                                        views:viewsDict]];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_passwordTextField]-30-[_submit]"
                                                                      options:NSLayoutFormatAlignAllRight
                                                                      metrics:nil
                                                                        views:viewsDict]];
}

//点击键盘上的Return按钮响应的方法
- (void)returnOnKeyboard:(UITextField *)sender
{
    if (sender == self.accountTextField)
    {
        [self.passwordTextField becomeFirstResponder];
    }
    else if (sender == self.passwordTextField)
    {
        [self hidenKeyboard];
        [self login];
    }
}

- (void)hidenKeyboard
{
    [self.accountTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    [self resumeView];
}

-(void)textFieldDidBeginEditing:(UITextField *)sender{
    //键盘高度216
    
    //滑动效果（动画）
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@ "ResizeForKeyboard"  context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
//    if ([deviceString isEqualToString:@"iPhone1,1"]) return @"iPhone 1G";
//    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
//    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
//    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
//    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
//    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
//    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
//    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
//    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
//    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
//    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
//    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
//    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
//    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
//    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
//    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
//    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";

    CGFloat y = -100.0f;
    if ([deviceString isEqualToString:@"iPhone4,1"]) {
        y = -70.0f;
    }
    
    //将视图的Y坐标向上移动，以使下面腾出地方用于软键盘的显示
    self.view.frame = CGRectMake(0.0f, y, self.view.frame.size.width, self.view.frame.size.height); //64-216
    
    [UIView commitAnimations];
}

-( void )textFieldDidEndEditing:(UITextField *)textField
{
    //滑动效果
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@ "ResizeForKeyboard"  context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //恢复屏幕
    self.view.frame = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height); //64-216
    
    [UIView commitAnimations];
}

- (void)resumeView
{
    NSTimeInterval animationDuration=0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
#if 1
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    //如果当前View是父视图，则Y为20个像素高度，如果当前View为其他View的子视图，则动态调节Y的高度
    CGFloat y;
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        y = 64;
    } else {
        y = 0;
    }
    
    CGRect rect=CGRectMake(0.0f, y, width, height);
    self.view.frame=rect;
#else
    CGRect frame = self.view.frame;
    frame.origin.y += 40;
    frame.size. height -= 40;
    self.view.frame = frame;
#endif
    [UIView commitAnimations];
}


@end