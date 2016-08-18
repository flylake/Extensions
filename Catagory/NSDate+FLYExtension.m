//
// 使用这个分类来判断时间
//

#import "NSDate+FLYExtension.h"

@implementation NSDate (FLYExtension)

- (BOOL)isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 获得某个时间的年月日时分秒
    NSDateComponents *dateCmps = [calendar components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *nowCmps = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    return dateCmps.year == nowCmps.year;
}

- (BOOL)isYesterday
{
    NSTimeInterval secondsPerDay = 24*60*60;
    //获取昨天时间
    NSDate *yesterday = [[NSDate date] dateByAddingTimeInterval: -secondsPerDay];
    
    //将日期按照统一格式处理
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *yesterdayStr = [fmt stringFromDate:yesterday];
    NSString *compareStr = [fmt stringFromDate:self];

    return [yesterdayStr isEqualToString:compareStr];
}

- (BOOL)isToday
{
    NSDate *now = [NSDate date];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *dateStr = [fmt stringFromDate:self];
    NSString *nowStr = [fmt stringFromDate:now];
    
    return [dateStr isEqualToString:nowStr];
}

- (BOOL)isTomorrow
{
    
    NSTimeInterval secondsPerDay = 24*60*60;
    //获取明天时间
    NSDate *tomorrow = [[NSDate date] dateByAddingTimeInterval: secondsPerDay];
    
    //将日期按照统一格式处理
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *tomorrowStr = [fmt stringFromDate:tomorrow];
    NSString *compareStr = [fmt stringFromDate:self];
    
    return [tomorrowStr isEqualToString:compareStr];
}




- (NSString *)creatTime
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    // 日历对象（方便比较两个日期之间的差距）
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // NSCalendarUnit枚举代表想获得哪些差值
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 计算两个日期之间的差值
    NSDateComponents *cmps = [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
    
    if ([self isThisYear]) { // 今年
        if ([self isYesterday]) { // 昨天
            fmt.dateFormat = @"昨天 HH:mm";
            return [fmt stringFromDate:self];
        } else if ([self isToday]) { // 今天
            if (cmps.hour >= 1) {
                return [NSString stringWithFormat:@"%zd小时前", cmps.hour];
            } else if (cmps.minute >= 1) {
                return [NSString stringWithFormat:@"%zd分钟前", cmps.minute];
            } else {
                return @"刚刚";
            }
        } else { // 今年的其他日子
            fmt.dateFormat = @"MM-dd HH:mm";
            return [fmt stringFromDate:self];
        }
    } else { // 非今年
        fmt.dateFormat = @"yyyy-MM-dd HH:mm";
        return [fmt stringFromDate:self];
    }
}

@end
