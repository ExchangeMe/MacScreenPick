//
//  DragDropImageView.m
//  ScreenPick
//
//  Created by huidu on 2020/10/22.
//

#import "DragDropImageView.h"

@implementation DragDropImageView
@synthesize delegate = _delegate;

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
}

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //NSPasteboardTypeFileURL这个根据需求进行修改
        [self registerForDraggedTypes:[NSArray arrayWithObjects:NSPasteboardTypeFileURL, nil]];
    }
    return self;
}

/***
 第二步：当拖动数据进入view时会触发这个函数，返回值不同会显示不同的图标
 ***/
-(NSDragOperation)draggingEntered:(id<NSDraggingInfo>)sender{
    NSPasteboard *pboard = [sender draggingPasteboard];
    
    if ([[pboard types] containsObject:NSPasteboardTypeFileURL]) {
        return NSDragOperationCopy;
    }
    return NSDragOperationNone;
}

/***
 第三步：当在view中松开鼠标键时会触发以下函数
 ***/
-(BOOL)prepareForDragOperation:(id<NSDraggingInfo>)sender{
    // 获取拖动数据中的粘贴板
    NSPasteboard *pboard = [sender draggingPasteboard];
    NSString *fileURL;
    NSArray *filelist;
    // 判断是否拖进单文件
    if (pboard.pasteboardItems.count <= 1) {
        //直接获取文件路径
        fileURL = [[NSURL URLFromPasteboard:pboard] path];
        filelist = [NSArray arrayWithObjects:fileURL,nil];
    }
    //多文件，目前暂不支持
    else {
        filelist = [pboard propertyListForType:NSPasteboardTypeFileURL];
    }
    // 将接受到的文件链接数组通过代理传送
    if(self.delegate && [self.delegate respondsToSelector:@selector(dragDropViewFileDidReceiveList:)])
        [self.delegate dragDropViewFileDidReceiveList:filelist];
    return YES;
}
@end
