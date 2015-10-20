//
//  Task.m
//  showtime
//
//  Created by 马 烜￼昊 on 15/10/13.
//  Copyright © 2015年 agfa. All rights reserved.
//

#import "Task.h"

@implementation Task

- (instancetype)initWithParameters:(NSString *)taskId
             andRequstedProcedures:(NSArray *)requestedProcedures
                  andPriorityLevel:(NSString *)priorityLevel {
    if (self = [super init]) {
        _taskId = taskId;
        _requestedProcedures = requestedProcedures;
        _priorityLevel = priorityLevel;
    }
    
    return self;
}

@end
