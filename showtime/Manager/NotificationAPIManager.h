//
//  NotificationAPIManager.h
//  showtime
//
//  Created by 马 烜￼昊 on 15/10/13.
//  Copyright © 2015年 agfa. All rights reserved.
//

#import "NotificationAPIClient.h"

@interface NotificationAPIManager : NSObject

+ (instancetype)sharedManager;

- (void)request_Records:(void (^)(NSArray *dataArray, NSError *error))block;

@end
