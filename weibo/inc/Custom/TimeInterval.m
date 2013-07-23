//
//  TimeInterval.m
//  weibo
//
//  Created by 斌 on 13-7-23.
//  Copyright (c) 2013年 斌. All rights reserved.
//

#import "TimeInterval.h"

@implementation TimeInterval

+ (NSString *)intervalSinceNow: (NSString *) theDate
{
    NSLog(@"%@",theDate);
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"EEE MMM dd HH:mm:ss ZZZ yyyy"];
    date.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"en_US"]; 
    NSDate *d=[date dateFromString:theDate]; 
    NSTimeInterval late=[d timeIntervalSince1970]*1;
    
    //长度2
    NSRange range;
    range.length = 2;
    
    //获取月份
    range.location = 5;
    NSString *yString = [theDate substringWithRange:range];
    
    //获取日期
    range.location = 8;
    NSString *dString = [theDate substringWithRange:range];
    
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval now=[dat timeIntervalSince1970]*1;
    NSString *timeString=@"";
    
    NSTimeInterval cha=now-late;
    
    //小于一分钟
    if(cha/60<1){
        timeString = [NSString stringWithFormat:@"%f", cha];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@秒前发布", timeString];
    }
    
    //大于60秒，且小于1小时
    if (cha/60>1&&cha/3600<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/60];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@分钟前发布", timeString];
    }
    
    //大于60分钟，且小于1天
    if (cha/3600>1&&cha/86400<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/3600];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@小时前发布", timeString];
    }
    
    //大于1天，且小于3天
    if (cha/86400>1&&cha/86400<3)
    {
        timeString = [NSString stringWithFormat:@"%f", cha/86400];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@天前发布", timeString];
    }
    
    //超过3天
    if (cha/86400>3)
    {
        timeString=[NSString stringWithFormat:@"%@月%@日发布",yString,dString];
        
    }
    NSLog(@"%@",timeString);
    return timeString;
}

@end
