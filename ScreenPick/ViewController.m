//
//  ViewController.m
//  ScreenPick
//
//  Created by huidu on 2020/10/22.
//

#import "ViewController.h"
#import "BaseImageView.h"
#import "DragDropImageView.h"
#import "TwoController.h"
#import "iPhoneXController.h"
#import "PlusHController.h"
#import "XHController.h"
@interface ViewController ()<DragDropViewDelegate>
@property (weak) IBOutlet NSTextField *titelTF;

@property (weak) IBOutlet NSTextField *subTF;

@property (weak) IBOutlet DragDropImageView *rightView;

@property (weak) IBOutlet NSTextField *colorView;

@property (assign, nonatomic) CGFloat slider0 ;
@property (assign, nonatomic) CGFloat slider1 ;
@property (assign, nonatomic) CGFloat slider2 ;

@property (assign, nonatomic) NSInteger indexForWindow ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    (width = 1680, height = 1050)
    // Do any additional setup after loading the view. 
    [self.rightView setWantsLayer:YES];
 
    self.rightView.delegate = self;

    
    self.slider0 = 0;
    self.slider1 = self.slider2 = 139;
    self.colorView.wantsLayer = YES;
    self.colorView.layer.backgroundColor = [NSColor colorWithRed:self.slider0/255 green:self.slider1/255 blue:self.slider2/255 alpha:1].CGColor;
}
 
#pragma mark DragDropImageViewDelegate
- (void)dragDropViewFileDidReceiveList:(NSArray *)fileList {
    //判断是否为空
    if(!fileList || [fileList count] <= 0)
        return;
    //暂时只支持单个文件
    [self processImportFile:fileList[0]];
}
- (IBAction)changeSize:(NSSegmentedControl *)sender {
    self.indexForWindow = sender.indexOfSelectedItem;
}
- (IBAction)pushOK:(id)sender {
    if (self.rightView.image == [NSImage imageNamed:@"plcae"]) {
        NSAlert * alert = [[NSAlert alloc]init];
        [alert setMessageText:@"请添加截图文件"];
        [alert setInformativeText:@"拖入文件到右侧，建议对应比例的截图"];
        [alert addButtonWithTitle:@"好的"];
        [alert setAlertStyle:NSAlertStyleWarning];
        [alert runModal];
 
        return;
    }
    switch (self.indexForWindow) {
        case 0:
        { //1242*2208
            TwoController * vc = [[TwoController alloc]initWithWindowNibName:NSStringFromClass([TwoController class])];
            vc.bgColor = self.colorView.layer.backgroundColor;
            vc.titleString = self.titelTF.stringValue;
            vc.subtitleString = self.subTF.stringValue;
            vc.image = self.rightView.image;
            [vc.window center];
             [vc.window orderFront:nil];
        }
            break;
        case 1:
        {
            //1242*2688 
            iPhoneXController * vc = [[iPhoneXController alloc]initWithWindowNibName:NSStringFromClass([iPhoneXController class])];
            vc.bgColor = self.colorView.layer.backgroundColor;
            vc.titleString = self.titelTF.stringValue;
            vc.subtitleString = self.subTF.stringValue;
            vc.image = self.rightView.image;
            [vc.window center];
            [vc.window orderFront:nil];
            
        }
            break;
        case 2:
        {
            //2208*1242
            PlusHController * vc = [[PlusHController alloc]initWithWindowNibName:NSStringFromClass([PlusHController class])];
            vc.bgColor = self.colorView.layer.backgroundColor;
            vc.titleString = self.titelTF.stringValue;
            vc.subtitleString = self.subTF.stringValue;
            vc.image = self.rightView.image;
            [vc.window center];
            [vc.window orderFront:nil];
        }
            break;
        case 3:
        {
            //2688*1242
            XHController * vc = [[XHController alloc]initWithWindowNibName:NSStringFromClass([XHController class])];
            vc.bgColor = self.colorView.layer.backgroundColor;
            vc.titleString = self.titelTF.stringValue;
            vc.subtitleString = self.subTF.stringValue;
            vc.image = self.rightView.image;
            [vc.window center];
            [vc.window orderFront:nil];
        }
            break;
        default:
        {
            //nil
        }
            break;
    }
  
   
}

//文件操作详细内容
- (void)processImportFile:(NSString *)fileUrl {
    //自己对文件的操作
    self.rightView.image = [[NSImage alloc]initWithContentsOfFile:fileUrl];
}
 

 
- (IBAction)slier0:(NSSlider *)sender {
//
    self.slider0 = sender.floatValue;
    
    self.colorView.layer.backgroundColor = [NSColor colorWithRed:self.slider0/255 green:self.slider1/255 blue:self.slider2/255 alpha:1].CGColor;
    
 
}
- (IBAction)slier1:(NSSlider *)sender {
    self.slider1 = sender.floatValue;
    
    self.colorView.layer.backgroundColor = [NSColor colorWithRed:self.slider0/255 green:self.slider1/255 blue:self.slider2/255 alpha:1].CGColor;
 
}

- (IBAction)slier2:(NSSlider *)sender {
    self.slider2 = sender.floatValue;
    
    self.colorView.layer.backgroundColor = [NSColor colorWithRed:self.slider0/255 green:self.slider1/255 blue:self.slider2/255 alpha:1].CGColor;
 
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
