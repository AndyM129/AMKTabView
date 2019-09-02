//
//  AMKWechatTabView.h
//  AMKTabView
//
//  Created by 孟昕欣 on 2019/8/31.
//

#import "AMKTabView.h"
@protocol AMKWechatTabViewDelegate;

/// 仿微信TabView
@interface AMKWechatTabView : AMKTabView
@property(nonatomic, strong, nullable) NSButton *profileButton;                                 //!< 头像（左上角）
@property(nonatomic, strong, nullable) NSButton *menuButton;                                    //!< 菜单（左下角）
@property(nonatomic, strong, nullable) id<AMKWechatTabViewDelegate> delegate;
@end

/// 仿微信TabView 代理
@protocol AMKWechatTabViewDelegate <AMKTabViewDelegate>
@optional
- (void)tabView:(AMKWechatTabView *_Nullable)tabView didClickProfileButton:(NSButton *_Nullable)profileButton;
- (void)tabView:(AMKWechatTabView *_Nullable)tabView didClickMenuButton:(NSButton *_Nullable)menuButton;
@end
