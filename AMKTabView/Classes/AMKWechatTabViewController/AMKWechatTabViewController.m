//
//  AMKWechatTabViewController.m
//  AMKTabView
//
//  Created by 孟昕欣 on 2019/8/31.
//

#import "AMKWechatTabViewController.h"
#import <Masonry/Masonry.h>

@interface AMKWechatTabViewController ()

@end

@implementation AMKWechatTabViewController

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

#pragma mark - Data & Networking

#pragma mark - Layout Subviews

- (void)relayoutTabView {
    [self.tabView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
        make.width.mas_equalTo(70);
    }];
    [self.tabView.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.tabView.mas_right);
        make.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
    }];
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
