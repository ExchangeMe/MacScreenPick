//
//  BaseImageView.m
//  ScreenPick
//
//  Created by huidu on 2020/10/22.
//

#import "BaseImageView.h"

@implementation BaseImageView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    if (_backgroundColor) {
           NSRect rect = self.frame;
           [_backgroundColor set];
           [NSBezierPath fillRect:rect];
       }
    // Drawing code here.
}
- (void)setBackgroundColor:(NSColor *)backgroundColor {
    _backgroundColor = backgroundColor;
    [self setNeedsDisplay:YES];
}

@end
