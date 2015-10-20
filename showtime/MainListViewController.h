//
//  MainListViewController.h
//  demo
//
//  Created by 马 烜￼昊 on 15/9/27.
//  Copyright (c) 2015年 lex. All rights reserved.
//

#ifndef demo_MainListViewController_h
#define demo_MainListViewController_h

#import <UIKit/UIKit.h>

@interface MainListViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) NSMutableArray *listNotification;


- (void) prepareNotifications;
@end
#endif
