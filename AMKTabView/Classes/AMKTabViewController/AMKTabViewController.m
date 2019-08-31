//
//  AMKTabViewController.m
//  AMKTabView
//
//  Created by 孟昕欣 on 2019/8/31.
//

#import "AMKTabViewController.h"
#import <Masonry/Masonry.h>

@interface AMKTabViewController ()

@end

@implementation AMKTabViewController

#pragma mark - Life Circle

- (void)dealloc {
    
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

@synthesize tabView = _tabView;
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

- (CGSize)preferredTabViewSize {
    if (CGSizeEqualToSize(CGSizeZero, _preferredTabViewSize)) {
        _preferredTabViewSize = CGSizeMake(64, 64);
    }
    return _preferredTabViewSize;
}

#pragma mark - Data & Networking

#pragma mark - Layout Subviews

- (void)relayoutTabView {
    switch (self.tabView.tabPosition) {
        case AMKTabPositionTop: {
            [self.tabView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.view);
                make.top.mas_equalTo(self.view);
                make.right.mas_equalTo(self.view);
                make.height.mas_equalTo(self.preferredTabViewSize.height);
            }];
            [self.tabView.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.tabView.mas_bottom);
                make.left.mas_equalTo(self.view);
                make.bottom.mas_equalTo(self.view);
                make.right.mas_equalTo(self.view);
            }];
            break;
        }
        case AMKTabPositionLeft: {
            [self.tabView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.view);
                make.top.mas_equalTo(self.view);
                make.bottom.mas_equalTo(self.view);
                make.width.mas_equalTo(self.preferredTabViewSize.width);
            }];
            [self.tabView.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.tabView.mas_right);
                make.right.mas_equalTo(self.view);
                make.top.mas_equalTo(self.view);
                make.bottom.mas_equalTo(self.view);
            }];
            break;
        }
        case AMKTabPositionRight: {
            [self.tabView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self.view);
                make.top.mas_equalTo(self.view);
                make.bottom.mas_equalTo(self.view);
                make.width.mas_equalTo(self.preferredTabViewSize.width);
            }];
            [self.tabView.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self.tabView.mas_left);
                make.left.mas_equalTo(self.view);
                make.top.mas_equalTo(self.view);
                make.bottom.mas_equalTo(self.view);
            }];
            break;
        }
        case AMKTabPositionBottom:
        default: {
            [self.tabView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.view);
                make.bottom.mas_equalTo(self.view);
                make.right.mas_equalTo(self.view);
                make.height.mas_equalTo(self.preferredTabViewSize.height);
            }];
            [self.tabView.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.view.mas_left);
                make.top.mas_equalTo(self.view.mas_top);
                make.right.mas_equalTo(self.view.mas_right);
                make.bottom.mas_equalTo(self.tabView.mas_top);
            }];
            break;
        }
    }
}

#pragma mark - Public Methods

#pragma mark - Private Methods

#pragma mark - Notifications

#pragma mark - KVO

#pragma mark - Delegate

#pragma mark - Override

- (void)viewWillLayout {
    [super viewWillLayout];
    [self relayoutTabView];
}

#pragma mark - Helper Methods

@end
