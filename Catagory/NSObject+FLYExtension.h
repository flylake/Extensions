//
// 可以使用performSelector传递多个参数
//

#import <Foundation/Foundation.h>

@interface NSObject (FLYExtension)
- (id)performSelector:(SEL)selector withObjects:(NSArray *)objects;
@end
