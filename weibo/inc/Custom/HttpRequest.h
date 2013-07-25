//
//  HttpRequest.h
//  weibo
//
//  Created by 斌 on 13-7-23.
//  Copyright (c) 2013年 斌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpRequest : NSObject

+(NSString*)getUrlWithResponse:(BOOL)runRequest serverAddr:(NSString*)serverAddr datagramKey:(NSString*)datagramKey datagramDic:(NSDictionary*)datagramDic;

@end
