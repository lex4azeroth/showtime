//
//  Messaging.h
//  showtime
//
//  Created by 马 烜￼昊 on 15/10/13.
//  Copyright © 2015年 agfa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Messaging : NSObject

@property(readonly, nonatomic) NSArray *taskInstances;
@property(readonly, nonatomic) NSInteger taskCount;

- (instancetype)initWithParameters:(NSArray *)taskInstances
                        andSubject:(NSInteger)taskCount;

@end
