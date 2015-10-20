//
//  ProcedureDefinition.m
//  showtime
//
//  Created by 马 烜￼昊 on 15/10/13.
//  Copyright © 2015年 agfa. All rights reserved.
//

#import "ProcedureDefinition.h"

@implementation ProcedureDefinition

- (instancetype) initWithParameter:(NSString *)name {
    if (self = [super init]) {
        _name = name;
    }
    
    return self;
}

@end
