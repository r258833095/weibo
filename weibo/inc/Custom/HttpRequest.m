//
//  HttpRequest.m
//  weibo
//
//  Created by 斌 on 13-7-23.
//  Copyright (c) 2013年 斌. All rights reserved.
//

#import "HttpRequest.h"
#import "ASIHTTPRequest.h"

@implementation HttpRequest

+(NSString*)getUrlWithResponse:(BOOL)runRequest serverAddr:(NSString*)serverAddr datagramKey:(NSString*)datagramKey datagramDic:(NSDictionary*)datagramDic{
    
    NSString *urlStr=[NSString stringWithFormat:@"%@%@?",serverAddr,datagramKey];
    
    for (id key in datagramDic)
    {
        urlStr=[urlStr stringByAppendingFormat:@"&%@=%@",key,[datagramDic objectForKey:key]];
    }
    
    urlStr=[urlStr stringByAddingPercentEscapesUsingEncoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingUTF8)];
    
    NSURL *url = [NSURL URLWithString:urlStr];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    request.timeOutSeconds=50;
    request.shouldAttemptPersistentConnection = NO;
    request.defaultResponseEncoding = NSUTF8StringEncoding;
    
    if (runRequest) {
        [request startAsynchronous];
    }else{
        [request startSynchronous];
    }
    
    
    NSError *error = [request error];
    if (!error) {
        NSString *response = [request responseString];
        return response;
        
    }else{
        return @"err";
    }
    
}

@end
