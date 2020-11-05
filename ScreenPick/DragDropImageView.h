//
//  DragDropImageView.h
//  ScreenPick
//
//  Created by huidu on 2020/10/22.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DragDropViewDelegate;

@interface DragDropImageView : NSImageView
@property (weak) id<DragDropViewDelegate> delegate;
@end

@protocol DragDropViewDelegate <NSObject>
-(void)dragDropViewFileDidReceiveList:(NSArray*)fileList;
@end
NS_ASSUME_NONNULL_END
