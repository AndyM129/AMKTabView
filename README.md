# AMKTabView

[![CI Status](https://img.shields.io/travis/AndyM129/AMKTabView.svg?style=flat)](https://travis-ci.org/AndyM129/AMKTabView)
[![Version](https://img.shields.io/cocoapods/v/AMKTabView.svg?style=flat)](https://cocoapods.org/pods/AMKTabView)
[![License](https://img.shields.io/cocoapods/l/AMKTabView.svg?style=flat)](https://cocoapods.org/pods/AMKTabView)
[![Platform](https://img.shields.io/cocoapods/p/AMKTabView.svg?style=flat)](https://cocoapods.org/pods/AMKTabView)

## Introduction

在 iOS 开发中，UITabBar 是一个非常常用的控件，以便实现多页面的点击切换；
在 MacOS 中则是通过 NSTabView 来实现，但不是那么好看，所以作者参考Mac端微信、QQ客户端，结合iOS开发经验，参考 UITabBar 类的接口设计，开发了这个 AMKTabView，以便在MacOS中使用类似 UITabBar 的控件。

- AMKTabViewController.h

| ![](https://raw.githubusercontent.com/AndyM129/ImageHosting/master/images/20190902211710.png) | ![](https://raw.githubusercontent.com/AndyM129/ImageHosting/master/images/20190902211744.png) | ![](https://raw.githubusercontent.com/AndyM129/ImageHosting/master/images/20190902211612.png) | ![](https://raw.githubusercontent.com/AndyM129/ImageHosting/master/images/20190902211819.png) |
| :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
|                      AMKTabPositionTop                       |                      AMKTabPositionLeft                      |                     AMKTabPositionRight                      |                     AMKTabPositionRight                    |

- AMKWechatTabViewController.h
| ![](https://raw.githubusercontent.com/AndyM129/ImageHosting/master/images/20190902213421.png) | ![](https://raw.githubusercontent.com/AndyM129/ImageHosting/master/images/20190902213446.png) | ![](https://raw.githubusercontent.com/AndyM129/ImageHosting/master/images/20190902213504.png) |
| :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
|                           消息Tab                            |                          联系人Tab                           |                           收藏Tab                            |
## Features

使用该库，可以实现：

- 可快速创建一个类似 UITabBar 的视图，提供方便、优雅的事件回调，并支持深度自定义布局，甚至扩展；
- 可快速创建一个类似 UITabBarController 的页面；
- 可快速创建一个类似微信MacOS客户端的APP框架，开发自己的MacApp；

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- MacOS 10.10+

## Installation

AMKTabView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AMKTabView'
```

## Usage

### 1. `#import <AMKTabView/AMKTabView.h>` 

#### Interface 接口设计

```objective-c
/// AMKTabView的位置
typedef NS_ENUM(NSUInteger, AMKTabPosition) {
    AMKTabPositionNone                  = 0,
    AMKTabPositionTop                   = 1,
    AMKTabPositionLeft                  = 2,
    AMKTabPositionBottom                = 3,
    AMKTabPositionRight                 = 4
};

/// AMKTabView
@interface AMKTabView : NSView
@property(nonatomic, assign) AMKTabPosition tabPosition;                                        //!< TabView的位置
@property(nonatomic, strong, nullable) NSView *contentView;                                     //!< 主内容视图
@property(nonatomic, assign, nullable) id<AMKTabViewDelegate> delegate;                         //!< 代理
@property(nonatomic, strong, nullable) AMKTabViewItem *selectedTabViewItem;                     //!< 当前选中的可点击项
@property(nonatomic, copy, nullable) NSArray<__kindof AMKTabViewItem *> *tabViewItems;          //!< 所有可点击项

- (void)addTabViewItem:(AMKTabViewItem *)tabViewItem;                                           //!< 在后面追加可点击项
- (void)insertTabViewItem:(AMKTabViewItem *)tabViewItem atIndex:(NSInteger)index;               //!< 在指定位置插入可点击项
- (void)removeTabViewItem:(AMKTabViewItem *)tabViewItem;                                        //!< 删除指定位置的可点击项

- (NSInteger)numberOfTabViewItems;                                                              //!< 所有可点击项的数量
- (NSInteger)indexOfTabViewItem:(AMKTabViewItem *_Nullable)tabViewItem;                         //!< 指定可点击项的下标
- (AMKTabViewItem *_Nullable)tabViewItemAtIndex:(NSInteger)index;                               //!< 返回指定下标的可点击项

- (void)selectTabViewItem:(AMKTabViewItem *_Nullable)tabViewItem;                               //!< 选中指定可点击项
- (void)selectTabViewItemAtIndex:(NSInteger)index;                                              //!< 选中指定下标的可点击项
- (void)selectFirstTabViewItem:(id _Nullable)sender;                                            //!< 选中第一个的可点击项
- (void)selectLastTabViewItem:(id _Nullable)sender;                                             //!< 选中最后一个的可点击项
- (void)selectNextTabViewItem:(id _Nullable)sender;                                             //!< 选中当前指定下标的后一个可点击项
- (void)selectPreviousTabViewItem:(id _Nullable)sender;                                         //!< 选中当前指定下标的前一个可点击项
@end

/// 可子类重写的方法
@interface AMKTabView (AMKSubclassing)
- (void)relayoutTabViewItems;                                                                   //!< 重新布局 tabViewItems
@end

/// AMKTabView 代理
@protocol AMKTabViewDelegate <NSObject>
@optional
- (BOOL)tabView:(AMKTabView *_Nullable)tabView shouldSelectTabViewItem:(AMKTabViewItem *_Nullable)tabViewItem;
- (void)tabView:(AMKTabView *_Nullable)tabView willSelectTabViewItem:(AMKTabViewItem *_Nullable)tabViewItem;
- (void)tabView:(AMKTabView *_Nullable)tabView didSelectTabViewItem:(AMKTabViewItem *_Nullable)tabViewItem;
- (void)tabViewDidChangeNumberOfTabViewItems:(AMKTabView *_Nullable)tabView;
@end

```

#### Coding 编码示例
```objective-c
- (AMKTabView *)tabView {
    if (!_tabView) {
        _tabView = [AMKTabView.alloc init];
        _tabView.wantsLayer = YES;
        _tabView.layer.backgroundColor = [NSColor colorWithRed:0.27 green:0.62 blue:0.89 alpha:1.00].CGColor;
        _tabView.contentView = [NSView.alloc init];
        _tabView.contentView.wantsLayer = YES;
        _tabView.contentView.layer.backgroundColor = [NSColor colorWithRed:0.98 green:0.87 blue:0.30 alpha:1.00].CGColor;
        _tabView.delegate = self;
        [self.view addSubview:_tabView];
        [self.view addSubview:_tabView.contentView];
    }
    return _tabView;
}
```

### 2. `#import <AMKTabView/AMKTabViewController.h>`

```objective-c
#import <AMKTabView/AMKTabViewController.h>

/// AMKTabViewController 示例
@interface AMKExampleTabViewController : AMKTabViewController

@end

@implementation AMKExampleTabViewController

- (void)loadView {
    self.view = [NSView.alloc init];
    [self.tabView selectTabViewItemAtIndex:0];
}

- (AMKTabView *)tabView {
    if (!_tabView) {
        _tabView = [super tabView];
        _tabView.wantsLayer = YES;
        _tabView.tabPosition = AMKTabPositionRight;
        _tabView.layer.backgroundColor = [NSColor colorWithRed:0.18 green:0.18 blue:0.18 alpha:1.00].CGColor;
        _tabView.contentView.wantsLayer = YES;
        _tabView.contentView.layer.backgroundColor = [NSColor colorWithRed:0.20 green:0.20 blue:0.20 alpha:1.00].CGColor;
        [_tabView addTabViewItem:({
            AMKTabViewItem *tabViewItem =
            [AMKTabViewItem tabViewItemWithImage:[NSImage imageNamed:@"amk_root_tab_message_n"] selectedImage:[NSImage imageNamed:@"amk_root_tab_message_s"]];
            tabViewItem.contentViewController = [AMKContentViewController.alloc init];
            tabViewItem.contentViewController.title = @"消息";
            tabViewItem.toolTip = tabViewItem.contentViewController.title;
            tabViewItem;
        })];
        [_tabView addTabViewItem:({
            AMKTabViewItem *tabViewItem =
            [AMKTabViewItem tabViewItemWithImage:[NSImage imageNamed:@"amk_root_tab_contact_n"] selectedImage:[NSImage imageNamed:@"amk_root_tab_contact_s"]];
            tabViewItem.contentViewController = [AMKContentViewController.alloc init];
            tabViewItem.contentViewController.title = @"联系人";
            tabViewItem.toolTip = tabViewItem.contentViewController.title;
            tabViewItem;
        })];
        [_tabView addTabViewItem:({
            AMKTabViewItem *tabViewItem =
            [AMKTabViewItem tabViewItemWithImage:[NSImage imageNamed:@"amk_root_tab_collection_n"] selectedImage:[NSImage imageNamed:@"amk_root_tab_collection_s"]];
            tabViewItem.contentViewController = [AMKContentViewController.alloc init];
            tabViewItem.contentViewController.title = @"收藏";
            tabViewItem.toolTip = tabViewItem.contentViewController.title;
            tabViewItem;
        })];
        [self relayoutTabView];
    }
    return _tabView;
}

#pragma mark AMKTabViewDelegate

- (BOOL)tabView:(AMKTabView *)tabView shouldSelectTabViewItem:(nullable AMKTabViewItem *)tabViewItem {
    NSLog(@"%@", tabViewItem.toolTip);
    return tabView.selectedTabViewItem == tabViewItem ? NO : YES;
}

- (void)tabView:(AMKTabView *)tabView willSelectTabViewItem:(nullable AMKTabViewItem *)tabViewItem {
    NSLog(@"%@", tabViewItem.toolTip);
}

- (void)tabView:(AMKTabView *)tabView didSelectTabViewItem:(nullable AMKTabViewItem *)tabViewItem {
    NSLog(@"%@", tabViewItem.toolTip);
}

- (void)tabViewDidChangeNumberOfTabViewItems:(AMKTabView *)tabView {
    NSLog(@"%@", tabView.tabViewItems);
}

@end

```

### 3. `#import <AMKTabView/AMKWechatTabView.h>` 仿微信Mac客户端TabView

#### Coding

```objective-c
- (AMKWechatTabView *)tabView {
    if (!_tabView) {
        _tabView = [AMKWechatTabView.alloc init];
        _tabView.wantsLayer = YES;
        _tabView.layer.backgroundColor = [NSColor colorWithRed:0.27 green:0.62 blue:0.89 alpha:1.00].CGColor;
        _tabView.contentView = [NSView.alloc init];
        _tabView.contentView.wantsLayer = YES;
        _tabView.contentView.layer.backgroundColor = [NSColor colorWithRed:0.98 green:0.87 blue:0.30 alpha:1.00].CGColor;
        _tabView.delegate = self;
        [self.view addSubview:_tabView];
        [self.view addSubview:_tabView.contentView];
    }
    return _tabView;
}
```

### 4. `#import <AMKTabView/AMKWechatTabViewController.h>`   仿微信Mac客户端TabView

```
#import "AMKWechatTabViewController.h"

@interface AMKExampleWechatTabViewController : AMKWechatTabViewController

@end

@implementation AMKExampleWechatTabViewController

- (void)loadView {
    self.view = [NSView.alloc init];
    [self.tabView selectTabViewItemAtIndex:0];
}

- (AMKWechatTabView *)tabView {
    if (!_tabView) {
        _tabView = [super tabView];
        _tabView.wantsLayer = YES;
        _tabView.layer.backgroundColor = [NSColor colorWithRed:0.13 green:0.12 blue:0.13 alpha:1.00].CGColor;
        _tabView.contentView.wantsLayer = YES;
        _tabView.contentView.layer.backgroundColor = [NSColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.00].CGColor;
        _tabView.profileButton.image = [NSImage imageNamed:@"AppIcon"];
        _tabView.menuButton.image = [NSImage imageNamed:@"amk_root_tab_menu_n"];
        _tabView.menuButton.alternateImage = [NSImage imageNamed:@"amk_root_tab_menu_s"];
        [_tabView addTabViewItem:({
            AMKTabViewItem *tabViewItem =
            [AMKTabViewItem tabViewItemWithImage:[NSImage imageNamed:@"amk_root_tab_message_n"] selectedImage:[NSImage imageNamed:@"amk_root_tab_message_s"]];
            tabViewItem.contentViewController = [AMKContentViewController.alloc init];
            tabViewItem.contentViewController.title = @"消息";
            tabViewItem.toolTip = tabViewItem.contentViewController.title;
            tabViewItem;
        })];
        [_tabView addTabViewItem:({
            AMKTabViewItem *tabViewItem =
            [AMKTabViewItem tabViewItemWithImage:[NSImage imageNamed:@"amk_root_tab_contact_n"] selectedImage:[NSImage imageNamed:@"amk_root_tab_contact_s"]];
            tabViewItem.contentViewController = [AMKContentViewController.alloc init];
            tabViewItem.contentViewController.title = @"联系人";
            tabViewItem.toolTip = tabViewItem.contentViewController.title;
            tabViewItem;
        })];
        [_tabView addTabViewItem:({
            AMKTabViewItem *tabViewItem =
            [AMKTabViewItem tabViewItemWithImage:[NSImage imageNamed:@"amk_root_tab_collection_n"] selectedImage:[NSImage imageNamed:@"amk_root_tab_collection_s"]];
            tabViewItem.contentViewController = [AMKContentViewController.alloc init];
            tabViewItem.contentViewController.title = @"收藏";
            tabViewItem.toolTip = tabViewItem.contentViewController.title;
            tabViewItem;
        })];
        [self relayoutTabView];
    }
    return _tabView;
}

#pragma mark AMKWechatTabViewDelegate

- (void)tabView:(AMKWechatTabView *_Nullable)tabView didClickProfileButton:(NSButton *_Nullable)profileButton {
    NSLog(@"%@", profileButton.toolTip);
}

- (void)tabView:(AMKWechatTabView *_Nullable)tabView didClickMenuButton:(NSButton *_Nullable)menuButton {
    NSLog(@"%@", menuButton.toolTip);
}

- (BOOL)tabView:(AMKWechatTabView *)tabView shouldSelectTabViewItem:(nullable AMKTabViewItem *)tabViewItem {
    NSLog(@"%@", tabViewItem.toolTip);
    return tabView.selectedTabViewItem == tabViewItem ? NO : YES;
}

- (void)tabView:(AMKWechatTabView *)tabView willSelectTabViewItem:(nullable AMKTabViewItem *)tabViewItem {
    NSLog(@"%@", tabViewItem.toolTip);
}

- (void)tabView:(AMKWechatTabView *)tabView didSelectTabViewItem:(nullable AMKTabViewItem *)tabViewItem {
    NSLog(@"%@", tabViewItem.toolTip);
}

- (void)tabViewDidChangeNumberOfTabViewItems:(AMKWechatTabView *)tabView {
    NSLog(@"%@", tabView.tabViewItems);
}

@end

```

## Author

AndyM129, andy_m129@163.com

## License

AMKTabView is available under the MIT license. See the LICENSE file for more info.
