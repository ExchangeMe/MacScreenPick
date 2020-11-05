//
//  NSView+Draw.m
//  ScreenPick
//
//  Created by Tom Max on 2020/10/22.
//

#import "NSView+Draw.h"

@implementation NSView (Draw)
- (void)drawRecursively
{
    [self drawRect:self.bounds];
    for (NSView *subview in self.subviews)
    {
        [subview drawRecursively];
    }
}

-(void)mouseDown:(NSEvent *)event{
    
//    if (self.mouseDownInsideBlock) {
//        self.mouseDownInsideBlock(event);
//    }
    [super mouseDown:event];
    
}

 

@end
