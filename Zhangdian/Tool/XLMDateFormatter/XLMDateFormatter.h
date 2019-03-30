//
//  XLMDateFormatter.h
//  MaoMeng
//
//  Created by xlingmao on 16/4/7.
//  Copyright © 2016年 xlingmao. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const def_YearMonthDayWeekChn             = @"yyyy年MM月dd日 EEEE";
static NSString *const def_YearMonthDayWeekChn_DF          = @"yyyy年MM月dd日 EE";
static NSString *const def_Year1Month1DayWeekChn_DF        = @"yyyy年M月d日 EE";
static NSString *const def_Year1Month1Day_DF               = @"yyyy年M月d日";
static NSString *const def_YearMonthDayChn_DF              = @"yyyy年MM月dd日";
static NSString *const def_MonthYearChn_DF                 = @"MM月/yyyy年";
static NSString *const def_YearWeekChn_DF                  = @"yyyy年 EEEE";
static NSString *const def_MonthDayWeekTwoChn_DF           = @"MM月dd日 EE";
static NSString *const def_MonthDayWeekChn_DF              = @"M月d日 EE";
static NSString *const def_WeekMonthDayChn_DF              = @"EE M月d日";
static NSString *const def_MonthDayChn_DF                  = @"M月d日";
static NSString *const def_YearMonthDayTHourMinuteSec_DF   = @"yyyy-MM-dd'T'HH:mm:ss.SSSZ";
static NSString *const def_YearMonthDayHourMinuteChn_DF    = @"yyyy年MM月dd日 HH:mm";
static NSString *const def_YearMonthDayHourMinuteSecChn_DF = @"yyyy年MM月dd日 HH:mm:ss";
static NSString *const def_GangYearMonthDayHourMinute_DF   = @"yyyy/MM/dd HH:mm";
static NSString *const def_YearMonthDayHourMinute_DF       = @"yyyy-MM-dd HH:mm";
static NSString *const def_YearMonthDayHourMinuteSec_DF    = @"yyyy-MM-dd HH:mm:ss";
static NSString *const def_YearMonthDayWeek                = @"yyyy-MM-dd EEEE";
static NSString *const def_YearMonthDayWeek_DF             = @"yyyy-MM-dd EE";
static NSString *const def_YearMonthDay                    = @"yyyyMMdd";
static NSString *const def_YearMonthDay_DF                 = @"yyyy-MM-dd";
static NSString *const def_YearMonthDay_DF_DOT             = @"yyyy.MM.dd";
static NSString *const def_YearMonthDayHourMinute          = @"yyyy-M-d HH:mm";
static NSString *const def_MonthDayHourMinute_DF           = @"MM-dd HH:mm";
static NSString *const def_WeekYearMonthDay_DF             = @"EE yyyy-MM-dd";
static NSString *const def_Year1Month1Day                  = @"yyyy-M-d";
static NSString *const def_Year2Month2Day                  = @"yyyy-MM-dd";
static NSString *const def_YearMonth                       = @"yyyy-MM";
static NSString *const def_HourMinuteSecond_DF             = @"HH:mm:ss";
static NSString *const def_HourMinute_DF                   = @"HH:mm";
static NSString *const def_Hour_DF                         = @"HH";
static NSString *const def_MonthYear                       = @"MM/YY";
static NSString *const def_MonthDay_DF                     = @"MM/dd";
static NSString *const def_MonthDayPoint_DF                = @"MM.dd";
static NSString *const def_MonthDayLine_DF                 = @"MM-dd";
static NSString *const def_JustWeek_DF                     = @"EE";
static NSString *const def_Month                           = @"M";
static NSString *const def_MonthChn_DF                     = @"MMMM";
static NSString *const def_Day                             = @"d";
static NSString *const def_MonthDayHourMS_DF               = @"MM月d日 HH:mm";

static NSString *const def_YearMonthDayHourMinuteSec_DF_Point    = @"yyyy.MM.dd HH:mm";

@interface XLMDateFormatter : NSObject


/**
 *  日期转字符串
 *
 *  @param date         日期
 *  @param formatString 日期格式
 *
 *  @return 字符串
 */
+ (NSString *) dateToStringCustom:(NSDate *)date formatString:(NSString *)formatString;

/**
 *  字符串转日期类型
 *
 *  @param dateString   日期字符串
 *  @param formatString 日期格式
 *
 *  @return 日期
 */
+ (NSDate *) stringToDateCustom:(NSString *)dateString formatString:(NSString *)formatString;

/**
 *  时间戳转时间
 *
 *  @param _fTime 时间戳
 *
 *  @return 时间
 */
+(NSDate *)turnTimestampToDate:(double)_fTime  formatString:(NSString *)formatString;



/**
 时间戳转时间(string)

 @param _fTime       时间戳
 @param formatString 日期类型

 @return string
 */
+(NSString *)turnTimestampToString:(double)_fTime  formatString:(NSString *)formatString;


/**
 时间戳

 @return 时间戳
 */
+ (NSString *)timestamp;

@end
