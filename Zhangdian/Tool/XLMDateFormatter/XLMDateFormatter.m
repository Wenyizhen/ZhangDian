//
//  XLMDateFormatter.m
//  MaoMeng
//
//  Created by xlingmao on 16/4/7.
//  Copyright © 2016年 xlingmao. All rights reserved.
//

#import "XLMDateFormatter.h"

@implementation XLMDateFormatter

+ (NSDateFormatter *)sharedDateFormatter{
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = NSDateFormatter.new;
        [NSTimeZone resetSystemTimeZone];
        [instance setTimeZone:[NSTimeZone systemTimeZone]];
        [instance setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    });
    return instance;
}


/**
 *  日期转字符串
 *
 *  @param date         日期
 *  @param formatString 日期格式
 *
 *  @return 字符串
 */
+ (NSString *) dateToStringCustom:(NSDate *)date formatString:(NSString *)formatString {
    NSDateFormatter *dateFormatter = [XLMDateFormatter sharedDateFormatter];
    [NSTimeZone resetSystemTimeZone];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    [dateFormatter setDateFormat:formatString];
    return [dateFormatter stringFromDate:date];
}

/**
 *  字符串转日期类型
 *
 *  @param dateString   日期字符串
 *  @param formatString 日期格式
 *
 *  @return 日期
 */
+ (NSDate *) stringToDateCustom:(NSString *)dateString formatString:(NSString *)formatString {
    NSDateFormatter *dateFormatter = [XLMDateFormatter sharedDateFormatter];
    [NSTimeZone resetSystemTimeZone];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    [dateFormatter setDateFormat:formatString];
    return [dateFormatter dateFromString:dateString];
}



/**
 *  时间戳转时间
 *
 *  @param _fTime 时间戳
 *
 *  @return 时间
 */
+(NSDate *)turnTimestampToDate:(double)_fTime  formatString:(NSString *)formatString{
    NSDate *date                   = [NSDate dateWithTimeIntervalSince1970:(_fTime/1000)];
    NSDateFormatter *dateFormatter = [XLMDateFormatter sharedDateFormatter];
    [NSTimeZone resetSystemTimeZone];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    [dateFormatter setDateFormat:formatString];
    NSString *strDate              = [dateFormatter stringFromDate:date];
    return [dateFormatter dateFromString:strDate];
}

/**
 *  时间戳转时间
 *
 *  @param _fTime 时间戳
 *
 *  @return 时间
 */
+(NSString *)turnTimestampToString:(double)_fTime  formatString:(NSString *)formatString{
    NSDate *date                   = [NSDate dateWithTimeIntervalSince1970:(_fTime/1000)];
    NSDateFormatter *dateFormatter = [XLMDateFormatter sharedDateFormatter];
    [NSTimeZone resetSystemTimeZone];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    [dateFormatter setDateFormat:formatString];
    NSString *strDate              = [dateFormatter stringFromDate:date];
    return strDate;
}


@end
