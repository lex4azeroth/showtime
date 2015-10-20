//
//  ProcedureDefinition.h
//  showtime
//
//  Created by 马 烜￼昊 on 15/10/13.
//  Copyright © 2015年 agfa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProcedureDefinition : NSObject

@property(readonly, nonatomic) NSString *name;

- (instancetype) initWithParameter:(NSString *)name;

@end
