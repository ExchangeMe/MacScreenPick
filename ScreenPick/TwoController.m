//
//  TwoController.m
//  ScreenPick
//
//  Created by huidu on 2020/10/22.
//

#import "TwoController.h"
#import "NSView+Draw.h"
#import "ZLImage.h"

@interface TwoController ()
@property (weak) IBOutlet NSImageView *bgImageView;
@property (weak) IBOutlet NSTextField *titileLabel;
@property (weak) IBOutlet NSTextField *subLabel;
@property (weak) IBOutlet NSImageView *screenPic;
@property (weak) IBOutlet NSImageView *bgview;
@property (weak) IBOutlet NSView *curView;

@end

@implementation TwoController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    self.window.title = @"预览图";
    self.bgImageView.wantsLayer = YES;
    self.bgImageView.layer.backgroundColor = self.bgColor;
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    self.titileLabel.stringValue = self.titleString;
    self.subLabel.stringValue = self.subtitleString;
    self.screenPic.image = self.image;
   
    self.screenPic.imageScaling = NSImageScaleAxesIndependently;

    self.bgview.imageScaling = NSImageScaleAxesIndependently;
     
    [self savePic];
    
    
    NSMenu * menu = [[NSMenu alloc]initWithTitle:@"菜单"];
    NSMenuItem * item1 = [[NSMenuItem alloc]initWithTitle:@"保存" action:@selector(savePic) keyEquivalent:@""];
    item1.target = self;
    [menu addItem:item1];
    [self.curView setMenu:menu];

   
}


 
 
-(void)savePic{
    NSSavePanel*    panel = [NSSavePanel savePanel];
    [panel setNameFieldStringValue:@"1242*2208"];
    [panel setMessage:@"Choose the path to save the document"];
    [panel setAllowsOtherFileTypes:YES];
    [panel setAllowedFileTypes:@[@".jpg"]];//设置新建文件默认的后缀,默认是无后缀需自己添加
    [panel setExtensionHidden:YES];
    [panel setCanCreateDirectories:YES];
    [panel beginSheetModalForWindow:self.window completionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton) {//NSFileHandlingPanelOKButton
            NSString *path = [[panel URL] path];
            
            //                   获取屏幕截图
            NSBitmapImageRep * rep = [self.curView bitmapImageRepForCachingDisplayInRect:self.curView.bounds];
            rep.alpha = 0;
            [self.curView cacheDisplayInRect:self.curView.bounds toBitmapImageRep:rep];
            
            //                  保存图片
            NSImage *image = [[NSImage alloc] initWithSize:self.curView.frame.size];
            [image addRepresentation:rep];
            NSData * data = [ZLImage compressedImageDataWithImg:[ZLImage resizeImage2:image forSize:CGSizeMake(1242, 2208)] rate:0.4];
            
            if ([data writeToFile:path atomically:YES]) {
                [self.window close];
            }
        }
        
    }];
}
 
 
 

-(void)touchesBeganWithEvent:(NSEvent *)event{
    
}

 
@end
