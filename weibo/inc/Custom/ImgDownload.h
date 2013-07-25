//
//  ImgDownload.h
//  weibo
//
//  Created by 斌 on 13-7-24.
//  Copyright (c) 2013年 斌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImgDownload : NSObject


+(UIImage*)getUrlStrWithSynchronous:(NSString*)urlStr;

+(UIImage*)getUrlStrWithAsynchronous:(NSString*)urlStr;

@end
