//
//  ZLImage.h
//  ScreenPick
//
//  Created by Tom Max on 2020/10/22.
//

#import <Cocoa/Cocoa.h>
#import <CoreImage/CoreImage.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLImage : NSImage
#pragma mark - NSView 转 NSImage
+ (NSImage *)imageFromView:(NSView *)cview;

+ (ZLImage *)imageWithNSView:(NSView *)cview;

#pragma mark - 保存图片到本地
// filename必须为绝对路径
+ (BOOL)saveImage:(NSImage *)image fileName:(NSString *)fileName;

#pragma mark - 将图片按照比例压缩(修改图片的占用空间)
//rate 压缩比0.1～1.0之间
+ (NSData *)compressedImageDataWithImg:(NSImage *)img rate:(CGFloat)rate;

#pragma mark - 修改图片尺寸
+ (NSImage *)resizeImage:(NSImage*)sourceImage forSize:(NSSize)size;
+ (NSImage*)resizeImage1:(NSImage*)sourceImage forSize:(CGSize)targetSize;
// 等比缩放
+ (NSImage*)resizeImage2:(NSImage*)sourceImage forSize:(CGSize)targetSize;
#pragma mark - 将图片压缩到指定大小（KB）
+ (NSData *)compressImgData:(NSData *)imgData toAimKB:(NSInteger)aimKB;

#pragma mark - 组合图片
+ (NSImage *)jointedImageWithImages:(NSArray *)imgArray;

#pragma mark -  NSImage转CIImage
+ (CIImage *)getCIImageWithNSImage:(NSImage *)myImage;
@end

NS_ASSUME_NONNULL_END
