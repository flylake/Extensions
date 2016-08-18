//
//
// 拼接沙盒路径
#import "NSString+FLYPath.h"

//获得本地文件的MINEType
#import "NSString+MIMEType.h"
#import <MobileCoreServices/MobileCoreServices.h>

@implementation NSString (FLYPath)
//拼接沙盒路径
- (NSString *)appendDocumentPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:self.lastPathComponent];
}

- (NSString *)appendCachePath {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:self.lastPathComponent];
}

- (NSString *)appendTempPath {
    return [NSTemporaryDirectory() stringByAppendingPathComponent:self.lastPathComponent];
}

//获得本地文件的MINEType
- (NSString *)MIMEType
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:self]) {
        return nil;
    }
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge  CFStringRef)[self pathExtension], NULL);
    CFStringRef MIMEType = UTTypeCopyPreferredTagWithClass (UTI, kUTTagClassMIMEType);
    CFRelease(UTI);
    if (!MIMEType) {
        return @"application/octet-stream";
    }
    return (__bridge NSString *)MIMEType;
}

- (NSString *)MIMEType2
{
    NSURLResponse *response = nil;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:self]];
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    return response.MIMEType;
}
@end
