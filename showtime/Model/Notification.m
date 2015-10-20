//
//  Notification.m
//  demo
//
//  Created by 马 烜￼昊 on 15/9/29.
//  Copyright (c) 2015年 lex. All rights reserved.
//

#import "Notification.h"

@implementation Notification

- (instancetype)initWithParameters:(NSInteger)messageId
                        andSubject:(NSString *)subject
                        andContent:(NSString *)content
                           andFrom:(NSString *)from
                             andTo:(NSString *)to {
    if (self = [super init]) {
        _messageId = messageId;
        _subject = subject;
        _from = from;
        _to = to;
        _content = content;
    }
    
    return self;
}

@end
