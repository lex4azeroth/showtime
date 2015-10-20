//
//  Task.h
//  showtime
//
//  Created by 马 烜￼昊 on 15/10/13.
//  Copyright © 2015年 agfa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property(readonly, nonatomic) NSString *taskId;
@property(readonly, nonatomic) NSArray *requestedProcedures;
@property(readonly, nonatomic) NSString *priorityLevel;

- (instancetype) initWithParameters:(NSString *)taskId
              andRequstedProcedures:(NSArray *)requestedProcedures
                   andPriorityLevel:(NSString *)priorityLevel;

@end
