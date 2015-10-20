//
//  MainListViewController.m
//  demo
//
//  Created by 马 烜￼昊 on 15/9/27.
//  Copyright (c) 2015年 lex. All rights reserved.
//

#import "DetailViewController.h"
#import "MainListViewController.h"
#import "Notification.h"
#import "LoginViewController.h"

@interface MainListViewController()
@end

@implementation MainListViewController

@synthesize listNotification = _listNotification;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.navigationItem.leftBarButtonItem = ;
    UIBarButtonItem *logoutButton = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleDone target:self action:@selector(logout)];
    self.navigationItem.leftBarButtonItem = logoutButton;
    self.navigationItem.title = @"List";
    
    [self prepareNotifications];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.tableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:NO];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
//    self.tableView.emptyDataSetSource = self;
//    self.tableView.emptyDataSetDelegate = self;
    // A little trick for removing the cell separators
    self.tableView.tableFooterView = [UIView new];
//    
//    self.refreshControl = [UIRefreshControl new];
//    [self.refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
//    [self.tableView addSubview:self.refreshControl];

}

- (void)viewDidUnload {
    [super viewDidUnload];
    
    self.listNotification = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listNotification count];
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *TableSampleIdentifier = @"TableSampleIdentifier";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:TableSampleIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:TableSampleIdentifier];
    } else {
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    
    NSInteger row = [indexPath row];
    Notification *notification = [self.listNotification objectAtIndex:row];
    
    cell.textLabel.text = notification.subject;
    cell.detailTextLabel.text = notification.from;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = [indexPath row];
    Notification *selectedItem = [self.listNotification objectAtIndex:row];
    // Navigate to DetailViewController
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithParameter:selectedItem];
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        
        [self.listNotification removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//        NSDictionary *params = @{@"appkey"      : @"testappkey",
//                                 @"member_id"   : curMemberId,
//                                 @"record_id"   : selectedRecord.recordId,
//                                 @"is_default"  : @"False"};
        
//        [[EverHealthAPIManager sharedManager] request_DeleteRecord_WithParams:params andBlock:^(NSError *error) {
//            if (!error)
//            {
//                [self.listRecord removeObjectAtIndex:indexPath.row];
//                [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//            }
//            else
//            {
//                NSString *errorString = [error userInfo][@"error"];
//                // Show the errorString somewhere and let the user try again.
//                
//                NSString* msg = [NSString stringWithFormat:@"删除健康记录失败, 错误: %@", errorString];
//                
//                [self.view hideToastActivity];
//                
//                //                [Tools toastNotification:msg inView:weakSelf.view];
//            }
//        }];
//        
//    }
//    else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//    }
    }
}

// For local test only...
- (void)prepareNotifications {
    self.listNotification = [[NSMutableArray alloc] initWithCapacity:20];
    
    for (int index = 0; index < 20; index++) {
        NSString *subject = [NSString stringWithFormat:@"%@%d", @"Subject", index];
        NSString *content = [NSString stringWithFormat:@"%@%d", @"Content", index];
        NSString *from = [NSString stringWithFormat:@"%@%d", @"From", index];
        NSString *to = [NSString stringWithFormat:@"%@%d", @"To", index];
        Notification *notification = [[Notification alloc] initWithParameters:index
                                                                   andSubject:subject
                                                                   andContent:content
                                                                      andFrom:from
                                                                        andTo:to];
        [self.listNotification addObject:notification];
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *) scrollView {
    
    
    
//    NSIndexPath *path =  [self indexPathForRowAtPoint:CGPointMake(scrollView.contentOffset.x, scrollView.contentOffset.y)];
    
    NSLog(@"这是第行");
    
    
}

- (void)logout {
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
}

@end
