//
//  NotificationAPIClient.h
//  showtime
//
//  Created by 马 烜￼昊 on 15/10/13.
//  Copyright © 2015年 agfa. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "APIUrl.h"

typedef enum
{
    Get = 0,
    Post,
    Put,
    Delete
} NetworkMethod;

@interface NotificationAPIClient : AFHTTPRequestOperationManager

+ (id)sharedJsonClient;
+ (void)saveCookieData;
+ (void)removeCookieData;

- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary*)params
                 withMethodType:(int)NetworkMethod
                       andBlock:(void (^)(id data, NSError *error))block;

@end
