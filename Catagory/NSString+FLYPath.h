//
//
//

#import <Foundation/Foundation.h>

@interface NSString (FLYPath)

/**
 *  追加沙盒目录
 */

///  追加文档目录
- (NSString *)appendDocumentPath;
///  追加缓存目录
- (NSString *)appendCachePath;
///  追加临时目录
- (NSString *)appendTempPath;

/**
 *  获得本地文件的MINEType
 */

- (NSString *)MIMEType;
- (NSString *)MIMEType2;

@end
