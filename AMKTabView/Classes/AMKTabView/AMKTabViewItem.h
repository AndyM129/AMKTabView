//
//  AMKTabViewItem.h
//  AMKTabView
//
//  Created by 孟昕欣 on 2019/8/31.
//

#import <Cocoa/Cocoa.h>

/// AMKTabView: 可点击项
@interface AMKTabViewItem : NSButton
@property(nonatomic, assign, readonly) NSInteger index;                             //!< AMKTabViewItem 下标
@property(nonatomic, strong, nullable) NSView *contentView;                         //!< AMKTabViewItem 对应的内容视图
@property(nonatomic, strong, nullable) NSViewController *contentViewController;     //!< AMKTabViewItem 对应的视图控制器

+ (instancetype _Nullable)tabViewItemWithImage:(NSImage *_Nullable)image selectedImage:(NSImage *_Nullable)selectedImage;
@end
