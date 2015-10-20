//
//  NotificationAPIClient.m
//  showtime
//
//  Created by 马 烜￼昊 on 15/10/13.
//  Copyright © 2015年 agfa. All rights reserved.
//

#import "NotificationAPIClient.h"



@implementation NotificationAPIClient

+ (NotificationAPIClient *)sharedJsonClient
{
    static NotificationAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedClient = [[NotificationAPIClient alloc] initWithBaseURL:[NSURL URLWithString:kNetPath_Code_Base]];
    });
    
    return _sharedClient;
}

+ (void)saveCookieData{
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    for (NSHTTPCookie *cookie in cookies) {
        // Here I see the correct rails session cookie
        DebugLog(@"\nSave cookie: \n====================\n%@", cookie);
    }
    
    NSData *cookiesData = [NSKeyedArchiver archivedDataWithRootObject: [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject: cookiesData forKey: Code_CookieData];
    [defaults synchronize];
}

+ (void)removeCookieData{
    NSURL *url = [NSURL URLWithString:kNetPath_Code_Base];
    if (url) {
        NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:url];
        for (int i = 0; i < [cookies count]; i++) {
            NSHTTPCookie *cookie = (NSHTTPCookie *)[cookies objectAtIndex:i];
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
            DebugLog(@"\nDelete cookie: \n====================\n%@", cookie);
        }
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:Code_CookieData];
    [defaults synchronize];
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", nil];
    [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    self.securityPolicy.allowInvalidCertificates = YES;
    
    return self;
}



- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary*)params
                 withMethodType:(int)NetworkMethod
                       andBlock:(void (^)(id data, NSError *error))block{
    //log请求数据
    DebugLog(@"\n===========request===========\n%@:\n%@", aPath, params);
//    DebugLog(@"\n===========request===========\n%@", aPath);
    aPath = [aPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    //发起请求
    switch (NetworkMethod)
    {
        case Get:
        {
            [self GET:aPath parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
                DebugLog(@"\n%@===========response===========:\n%@", aPath, responseObject);
                
                id error = [self handleResponse:responseObject];
                if (error) {
                    block(nil, error);
                }else{
                    block(responseObject, nil);
                }
            }
              failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                  DebugLog(@"\n%@===========response===========:\n%@", aPath, error);
                  
//                  [self showError:error];
                  
                  block(nil, error);
              }];
            break;
        }
        case Post:
        {
            [self POST:aPath parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
                DebugLog(@"\n%@===========response===========:\n%@", aPath, responseObject);
                id error = [self handleResponse:responseObject];
                if (error) {
                    block(nil, error);
                }else{
                    if ([aPath isEqualToString:kNetPath_Code_Login]) {
                        [NotificationAPIClient saveCookieData];
                    }
                    block(responseObject, nil);
                }
            }
               failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                   DebugLog(@"\n%@===========response===========:\n%@", aPath, error);
//                   [self showError:error];
                   block(nil, error);
               }];
            break;
        }
        case Put:
        {
            [self PUT:aPath parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
                DebugLog(@"\n%@===========response===========:\n%@", aPath, responseObject);
                id error = [self handleResponse:responseObject];
                if (error) {
                    block(nil, error);
                }else{
                    block(responseObject, nil);
                }
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                DebugLog(@"\n%@===========response===========:\n%@", aPath, error);
//                [self showError:error];
                block(nil, error);
            }];
            break;
        }
        case Delete:
        {
            [self DELETE:aPath parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
                DebugLog(@"\n%@===========response===========:\n%@", aPath, responseObject);
                id error = [self handleResponse:responseObject];
                if (error) {
                    block(nil, error);
                }else{
                    block(responseObject, nil);
                }
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                DebugLog(@"\n%@===========response===========:\n%@", aPath, error);
//                [self showError:error];
                block(nil, error);
            }];
        }
        default:
            break;
    }
}

-(id)handleResponse:(id)responseJSON{
    NSError *error = nil;
    //code为非0值时，表示有错
    NSNumber *resultCode = [responseJSON valueForKeyPath:@"code"];
    
    if (resultCode.intValue != 0) {
        error = [NSError errorWithDomain:kNetPath_Code_Base code:resultCode.intValue userInfo:responseJSON];
//        [self showError:error];
        
        //        if (resultCode.intValue == 1000) {//用户未登录
        //            [self loginOutToLoginVC];
        //        }
    }
    //    数据为空时，构造error提示
    //    id resultData = [responseJSON valueForKeyPath:@"data"];
    //    if (!resultData) {
    //        error = [NSError errorWithDomain:kNetPath_Code_Base code:resultCode.intValue userInfo:
    //                          [NSDictionary dictionaryWithObject:
    //                           [NSDictionary dictionaryWithObject:@"获取的数据为空" forKey:@"tipMsg"] forKey:@"msg"]];
    //    }
    return error;
}

@end
