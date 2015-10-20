//
//  APIUrl.h
//  showtime
//
//  Created by 马 烜￼昊 on 15/10/13.
//  Copyright © 2015年 agfa. All rights reserved.
//

#ifndef APIUrl_h
#define APIUrl_h


#endif /* APIUrl_h */

#define Code_CookieData             @"sessionCookies"

/*api接口请求都放这里*/

#pragma mark BaseUrl
//生产
#define kNetPath_Code_Base          @"http://everhealth.sinaapp.com/"

#pragma mark ConfigUrl

#define kNetPath_Code_Login         @"api/login"

#define DebugLog(s, ...) NSLog(@"%s(%d): %@", __FUNCTION__, __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
