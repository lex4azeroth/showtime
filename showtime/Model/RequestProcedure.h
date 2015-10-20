//
//  RequestProcedure.h
//  showtime
//
//  Created by 马 烜￼昊 on 15/10/13.
//  Copyright © 2015年 agfa. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ProcedureDefinition;

@interface RequestProcedure : NSObject

@property(readonly, nonatomic) NSArray *agilityReportStudies;
@property(readonly, nonatomic) ProcedureDefinition *procedureDefinition;
@property(readonly, nonatomic) NSString *datePerformed;
@property(readonly, nonatomic) NSString *studyUid;

- (instancetype) initWithParameters:(NSArray *)agilityReportStudies
             andProcedureDefinition:(ProcedureDefinition *)procedureDefinition
                   andDatePerformed:(NSString *)datePerformed
                        andStudyUid:(NSString *)studyUid;

@end
