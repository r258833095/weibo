//
//  ImgDownload.m
//  weibo
//
//  Created by 斌 on 13-7-24.
//  Copyright (c) 2013年 斌. All rights reserved.
//

#import "ImgDownload.h"

@implementation ImgDownload


+(UIImage*)getUrlStrWithSynchronous:(NSString*)urlStr{
    NSURL *url = [NSURL URLWithString:urlStr];
    UIImage *img = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:url]];
    return img;
}


+(UIImage*)getUrlStrWithAsynchronous:(NSString*)urlStr{
    static UIImage *img;
    UIImageFromURL( [NSURL URLWithString:urlStr], ^( UIImage * image )
                   {
                       img = image;
                       NSLog(@"%@",img);
                   }, ^(void){
                       NSLog(@"error!");
                   });
    return img;
}

void UIImageFromURL( NSURL * URL, void (^imageBlock)(UIImage * image), void (^errorBlock)(void) )
{
    dispatch_async( dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0 ), ^(void)
                   {
                       NSData * data = [[NSData alloc] initWithContentsOfURL:URL];
                       UIImage * image = [[UIImage alloc] initWithData:data];
                       dispatch_async( dispatch_get_main_queue(), ^(void){
                           if( image != nil )
                           {
                               imageBlock( image );
                           } else {
                               errorBlock();
                           }
                       });
                   });
}

@end
