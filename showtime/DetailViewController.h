//
//  DetailViewController.h
//  demo
//
//  Created by 马 烜￼昊 on 15/9/26.
//  Copyright (c) 2015年 lex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Notification.h"

@interface DetailViewController : UIViewController {
    Notification *CurNotification;
}

@property (strong, nonatomic) id messageId;
@property (strong, nonatomic) IBOutlet UILabel *subjectLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;
@property (strong, nonatomic) IBOutlet UILabel *fromLabel;
@property (strong, nonatomic) IBOutlet UILabel *toLabel;

@property (nonatomic, strong) IBOutlet UITextField *subjectTextField;
@property (nonatomic, strong) IBOutlet UITextView *contentTextView;
@property (nonatomic, strong) IBOutlet UITextField *fromTextField;
@property (nonatomic, strong) IBOutlet UITextField *toTextField;


- (instancetype) initWithParameter:(Notification *)notification;
@end

