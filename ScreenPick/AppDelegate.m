//
//  AppDelegate.m
//  ScreenPick
//
//  Created by huidu on 2020/10/22.
//

#import "AppDelegate.h"

@interface AppDelegate ()

//1280x800 1440x900 2560x1600 2880x1800
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}
- (IBAction)shhow:(id)sender {
    NSAlert * alert = [[NSAlert alloc]init];
    [alert setMessageText:@"帮助"];
    [alert setInformativeText:@"预览图生产器为了方便开发者快速生产上架预览图，操作使用简单，设置标题和副标题后，拖入对应截图文件到右侧，点击生成即可生成对应图片~\n版本：1.0\n欢迎大家使用体验"];
    [alert addButtonWithTitle:@"好的"];
    [alert setAlertStyle:NSAlertStyleInformational];
    [alert runModal];
    
    
}

 

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}



@end
