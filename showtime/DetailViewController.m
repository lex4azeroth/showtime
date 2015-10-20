//
//  DetailViewController.m
//  demo
//
//  Created by 马 烜￼昊 on 15/9/26.
//  Copyright (c) 2015年 lex. All rights reserved.
//

#import "DetailViewController.h"
#import "Notification.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (instancetype) initWithParameter:(Notification *)curNotification {
    if (self = [super init]) {
        CurNotification = curNotification;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Detail";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    [self initSubViews];
    [self setLayout];
}

- (void) setLayout {
    for (UIView *view in [self.view subviews]) {
        view.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    NSDictionary *viewDict = NSDictionaryOfVariableBindings(_subjectLabel, _subjectTextField, _fromLabel, _fromTextField, _toLabel, _toTextField, _contentLabel, _contentTextView);
    
    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:|-20-[_subjectLabel]-10-[_fromLabel]-10-[_toLabel]-10-[_contentLabel]-5-[_contentTextView]"
                                                                       options: 0
                                                                       metrics: nil
                                                                         views: viewDict]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-20-[_subjectLabel]-[_subjectTextField]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:viewDict]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-20-[_fromLabel]-[_fromTextField]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:viewDict]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-20-[_toLabel]-[_toTextField]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:viewDict]];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-20-[_contentLabel]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:viewDict]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-20-[_contentTextView]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:viewDict]];
}
- (void) initSubViews {
    // Init labels.
    self.subjectLabel = [[UILabel alloc] init];
    self.subjectLabel.text = @"Subject:";
    self.subjectLabel.backgroundColor = [UIColor clearColor];
    
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.text = @"Content:";
    self.contentLabel.backgroundColor = [UIColor clearColor];
    
    self.fromLabel = [[UILabel alloc] init];
    self.fromLabel.text = @"From:";
    self.fromLabel.backgroundColor = [UIColor clearColor];
    
    self.toLabel = [[UILabel alloc] init];
    self.toLabel.text = @"To:";
    self.toLabel.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview: self.subjectLabel];
    [self.view addSubview: self.contentLabel];
    [self.view addSubview: self.fromLabel];
    [self.view addSubview: self.toLabel];
    
    // Init text fields and text view.
    self.subjectTextField = [[UITextField alloc] init];
    self.subjectTextField.text = CurNotification.subject;
    [self.subjectTextField setEnabled: NO];
    [self.view addSubview: self.subjectTextField];
    
    self.fromTextField = [[UITextField alloc] init];
    self.fromTextField.text = CurNotification.from;
    [self.fromTextField setEnabled: NO];
    [self.view addSubview: self.fromTextField];
    
    self.toTextField = [[UITextField alloc] init];
    self.toTextField.text = CurNotification.to;
    [self.toTextField setEnabled: NO];
    [self.view addSubview: self.toTextField];
    
    self.contentTextView = [[UITextView alloc] init];
    self.contentTextView.scrollEnabled = YES;
    self.contentTextView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.contentTextView.textAlignment = NSTextAlignmentLeft;
    [self.contentTextView setEditable: NO];
    self.contentTextView.backgroundColor = [UIColor clearColor];
//    self.contentTextView.textColor = [UIColor blackColor];
//    self.contentTextView.backgroundColor = [UIColor whiteColor];
    self.contentTextView.layer.borderWidth = 1.0;
    self.contentTextView.layer.cornerRadius = 5.0;
    self.contentTextView.layer.borderColor = [[UIColor grayColor] CGColor];
    self.contentTextView.autocapitalizationType = UITextAutocapitalizationTypeNone;
//    self.contentTextView.delegate = self;
    self.contentTextView.text = @"test";
    [self.view addSubview: self.contentTextView];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
