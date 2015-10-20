//
//  Notification.h
//  demo
//
//  Created by 马 烜￼昊 on 15/9/29.
//  Copyright (c) 2015年 lex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Notification : NSObject

@property (readwrite, nonatomic) NSInteger messageId;
@property (readwrite, nonatomic, strong) NSString *subject;
@property (readwrite, nonatomic, strong) NSString *content;
@property (readwrite, nonatomic, strong) NSString *from;
@property (readwrite, nonatomic, strong) NSString *to;

- (instancetype)initWithParameters:(NSInteger)messageId
                        andSubject:(NSString *)subject
                        andContent:(NSString *)content
                           andFrom:(NSString *)from
                             andTo:(NSString *)to;

@end