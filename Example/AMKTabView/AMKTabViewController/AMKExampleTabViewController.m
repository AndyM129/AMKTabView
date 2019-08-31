//
//  AMKExampleTabViewController.m
//  AMKTabView
//
//  Created by 孟昕欣 on 2019/8/31.
//  Copyright © 2019 Andy Meng. All rights reserved.
//

#import "AMKExampleTabViewController.h"
#import "AMKContentViewController.h"

@interface AMKExampleTabViewController ()

@end

@implementation AMKExampleTabViewController

#pragma mark - Life Circle

- (void)dealloc {
    
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"";
    }
    return self;
}

- (void)loadView {
    self.view = [NSView.alloc init];
    [self.tabView selectTabViewItemAtIndex:0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear {
    [super viewWillAppear];
}

- (void)viewDidAppear {
    [super viewDidAppear];
}

- (void)viewWillDisappear {
    [super viewWillDisappear];
}

- (void)viewDidDisappear {
    [super viewDidDisappear];
}

#pragma mark - Properties

- (AMKTabView *)tabView {
    if (!_tabView) {
        _tabView = [super tabView];
        _tabView.wantsLayer = YES;
        _tabView.tabPosition = AMKTabPositionBottom;
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

#pragma mark - Data & Networking

#pragma mark - Layout Subviews

#pragma mark - Public Methods

#pragma mark - Private Methods

#pragma mark - Notifications

#pragma mark - KVO

#pragma mark - Delegate

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

#pragma mark - Override

#pragma mark - Helper Methods

@end
