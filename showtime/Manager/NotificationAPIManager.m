//
//  NotificationAPIManager.m
//  showtime
//
//  Created by 马 烜￼昊 on 15/10/13.
//  Copyright © 2015年 agfa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NotificationAPIManager.h"

@implementation NotificationAPIManager

+ (instancetype)sharedManager {
    static NotificationAPIManager *shared_manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        shared_manager = [[self alloc] init];
    });
    return shared_manager;
}

- (void)request_Records:(NSString *)curMemberId andBlock:(void (^)(NSArray *dataArray, NSError *error))block {
    NSDictionary *params = @{@"appkey"   : @"appkey_test",
                             @"member_id"  : curMemberId};
    
    [[NotificationAPIClient sharedJsonClient] requestJsonDataWithPath:@"api/record/get" withParams:params withMethodType:Get andBlock:^(id data, NSError *error) {
        if (data) {
            NSString *resultCode = [data valueForKeyPath:@"result_code"];
            NSString *resultMsg  = [data valueForKeyPath:@"result_msg"];
            NSDictionary* records = [data valueForKeyPath:@"record"];
            
            if ([resultCode isEqualToString:@"0"]) {
                
                NSMutableArray *recordsArray = [[NSMutableArray alloc] initWithCapacity:20];
                
                for (NSDictionary *item in records) {
//                    NSString* record_id   = [item objectForKey:@"id"];
//                    NSString* symptom = [item objectForKey:@"symptom"];
//                    NSString* cause = [item objectForKey:@"cause"];
//                    NSString* conclusion = [item objectForKey:@"conclusion"];
//                    
//                    Record *record = [[Record alloc] initWithParameters: record_id
//                                                             andSymptom:symptom
//                                                               andCause:cause
//                                                          andConclusion:conclusion
//                                                            andMemberId:curMemberId];
//                    
//                    [recordsArray addObject:record];
                    
                }
                
                block(recordsArray, nil);
            }
            else {
                DebugLog(@"Failed to get records, result_code: %@, result_msg: %@", resultCode, resultMsg);
                
                NSString *domain = @"com.agfa.notification";
                NSString *desc = resultMsg;
                NSDictionary *userInfo = @{ NSLocalizedDescriptionKey : desc };
                
                NSError *errorCustom = [NSError errorWithDomain:domain
                                                           code:[resultCode integerValue]
                                                       userInfo:userInfo];
                
                block(nil, errorCustom);
            }
        }
        else{
            block(nil, error);
        }
    }];
}


@end