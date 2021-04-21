//
//  XHController.m
//  ScreenPick
//
//  Created by huidu on 2020/10/23.
//

#import "XHController.h"
#import "ZLImage.h"
@interface XHController ()
@property (weak) IBOutlet NSImageView *imageview;
@property (weak) IBOutlet NSTextField *titleLabel;
@property (weak) IBOutlet NSTextField *subTitlteLabel;
@property (weak) IBOutlet NSView *bgview;

@end

@implementation XHController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    self.window.title = @"预览图2688x1242";
    self.bgview.wantsLayer = YES;
    self.bgview.layer.backgroundColor = self.bgColor;
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    self.titleLabel.stringValue = self.titleString;
    self.subTitlteLabel.stringValue = self.subtitleString;
    self.imageview.image = self.image;
    [self savePic];
    
    NSMenu * menu = [[NSMenu alloc]initWithTitle:@"菜单"];
    NSMenuItem * item1 = [[NSMenuItem alloc]initWithTitle:@"保存" action:@selector(savePic) keyEquivalent:@""];
    item1.target = self;
    [menu addItem:item1];
    menu.autoenablesItems = YES;
    [self.bgview setMenu:menu];
}
-(void)savePic{
    NSSavePanel*    panel = [NSSavePanel savePanel];
    [panel setNameFieldStringValue:@"2688x1242"];
    [panel setMessage:@"Choose the path to save the document"];
    [panel setAllowsOtherFileTypes:YES];
    [panel setAllowedFileTypes:@[@".jpg"]];//设置新建文件默认的后缀,默认是无后缀需自己添加
    [panel setExtensionHidden:YES];
    [panel setCanCreateDirectories:YES];
    [panel beginSheetModalForWindow:self.window completionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton) {//NSFileHandlingPanelOKButton
            NSString *path = [[panel URL] path];
            
            //                   获取屏幕截图
            NSBitmapImageRep * rep = [self.bgview bitmapImageRepForCachingDisplayInRect:self.bgview.bounds];
            rep.alpha = 0;
            [self.bgview cacheDisplayInRect:self.bgview.bounds toBitmapImageRep:rep];
            
            //                  保存图片
            NSImage *image = [[NSImage alloc] initWithSize:self.bgview.frame.size];
            [image addRepresentation:rep];
            NSData * data = [ZLImage compressedImageDataWithImg:[ZLImage resizeImage2:image forSize:CGSizeMake(2688,1242)] rate:0.4];
            if ([data writeToFile:path atomically:YES]) {
                [self.window close];
            }
        }
        
    }];
}


@end
