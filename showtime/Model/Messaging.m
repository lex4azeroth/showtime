//
//  Messaging.m
//  showtime
//
//  Created by 马 烜￼昊 on 15/10/13.
//  Copyright © 2015年 agfa. All rights reserved.
//

#import "Messaging.h"

@implementation Messaging

- (instancetype)initWithParameters:(NSArray *)taskInstances andSubject:(NSInteger)taskCount {
    if (self = [super init]) {
        _taskInstances = taskInstances;
        _taskCount = taskCount;
    }
    
    return self;
}

@end

