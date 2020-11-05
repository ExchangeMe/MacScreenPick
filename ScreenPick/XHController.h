//
//  XHController.h
//  ScreenPick
//
//  Created by huidu on 2020/10/23.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface XHController : NSWindowController
@property (assign, nonatomic) CGColorRef bgColor ;

@property (copy, nonatomic) NSString * titleString ;

@property (copy, nonatomic) NSString * subtitleString ;

@property (strong, nonatomic) NSImage *  image ;

@property (assign, nonatomic) NSInteger iphoneType ;
@end

NS_ASSUME_NONNULL_END
