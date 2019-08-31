//
//  AMKTabViewController.h
//  AMKTabView
//
//  Created by 孟昕欣 on 2019/8/31.
//

#import <Cocoa/Cocoa.h>
#import <AMKTabView/AMKTabView.h>

/// AMKTabViewController
@interface AMKTabViewController : NSViewController <AMKTabViewDelegate> {
@protected
    AMKTabView *_tabView;
}

/// tabView
@property(nonatomic, strong, nullable, readonly) AMKTabView *tabView;

/// tabView的大小
/// 当 tabView.tabPosition 为 AMKTabPositionLeft 或 AMKTabPositionRight 时, 取 preferredTabViewSize.width
/// 当 tabView.tabPosition 为 AMKTabPositionTop 或 AMKTabPositionBottom 时, 取 preferredTabViewSize.height
@property(nonatomic, assign) CGSize preferredTabViewSize;

@end

#pragma mark -

/// 可子类重写的方法
@interface AMKTabViewController (AMKSubclassing)

/// 重新布局tabView
- (void)relayoutTabView;

@end
