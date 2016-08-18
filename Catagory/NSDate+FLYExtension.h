//
//日期的分类
//

#import <Foundation/Foundation.h>

@interface NSDate (FLYExtension)
/** 判断是否为今年 */
- (BOOL)isThisYear;
/** 判断是否为昨天 */
- (BOOL)isYesterday;
/** 判断是否为今天 */
- (BOOL)isToday;
/** 判断是否为明天 */
- (BOOL)isTomorrow;
/** 返回创建时间 */
- (NSString *)creatTime;
@end
