//
//
//

#import "UIImage+FLYImage.h"

@implementation UIImage (FLYImage)

+(instancetype)imageWithoutRender:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
   return  [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end
