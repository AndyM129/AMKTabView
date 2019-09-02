//
//  AMKWechatTabViewController.h
//  AMKTabView
//
//  Created by 孟昕欣 on 2019/8/31.
//

#import <Cocoa/Cocoa.h>
#import <AMKTabView/AMKWechatTabView.h>

/// 仿微信TabViewController
@interface AMKWechatTabViewController : NSViewController <AMKTabViewDelegate> {
@protected
    AMKWechatTabView *_tabView;
}

/// tabView
@property(nonatomic, strong, nullable, readonly) AMKWechatTabView *tabView;

@end

#pragma mark -

/// 可子类重写的方法
@interface AMKWechatTabViewController (AMKSubclassing)

/// 重新布局tabView
- (void)relayoutTabView;

@end
