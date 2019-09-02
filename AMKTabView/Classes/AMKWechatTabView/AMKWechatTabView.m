//
//  AMKWechatTabView.m
//  AMKTabView
//
//  Created by 孟昕欣 on 2019/8/31.
//

#import "AMKWechatTabView.h"
#import <Masonry/Masonry.h>

@interface AMKTabViewItem (AMKTabView)
@property(nonatomic, assign) NSInteger index;
@end

@implementation AMKWechatTabView

#pragma mark - Init Methods

- (void)dealloc {
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

#pragma mark - Properties

- (NSButton *)profileButton {
    if (!_profileButton) {
        _profileButton = [NSButton.alloc init];
        _profileButton.layer.backgroundColor = [NSColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.00].CGColor;
        _profileButton.imagePosition = NSImageOnly;
        _profileButton.imageScaling = NSImageScaleAxesIndependently;
        _profileButton.layer.masksToBounds = YES;
        _profileButton.layer.cornerRadius = 10;
        _profileButton.toolTip = @"用户信息";
        _profileButton.bordered = NO;
        _profileButton.target = self;
        _profileButton.action = @selector(didClickProfileButton:);
        [_profileButton setButtonType:NSButtonTypeMomentaryPushIn];
        [self addSubview:_profileButton];
        [_profileButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.top.mas_equalTo(75);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(40);
        }];
    }
    return _profileButton;
}

- (NSButton *)menuButton {
    if (!_menuButton) {
        _menuButton = [NSButton.alloc init];
        _menuButton.layer.backgroundColor = [NSColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.00].CGColor;
        _menuButton.imagePosition = NSImageOnly;
        _menuButton.imageScaling = NSImageScaleNone;
        _menuButton.toolTip = @"更多设置";
        _menuButton.bordered = NO;
        _menuButton.target = self;
        _menuButton.action = @selector(didClickMenuButton:);
        [_menuButton setButtonType:NSButtonTypeMomentaryPushIn];
        [self addSubview:_menuButton];
        [_menuButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.bottom.mas_equalTo(self.mas_bottom).offset(-20);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(40);
        }];
    }
    return _menuButton;
}

- (void)setTabPosition:(AMKTabPosition)tabPosition {
    NSAssert(NO, @"当前类不支持修改该值");
}

#pragma mark - Layout Subviews

- (void)relayoutTabViewItems {
    [self.tabViewItems enumerateObjectsUsingBlock:^(__kindof AMKTabViewItem * _Nonnull tabViewItem, NSUInteger idx, BOOL * _Nonnull stop) {
        tabViewItem.index = idx;
        tabViewItem.target = self;
        tabViewItem.action = @selector(didClickTabViewItem:);
        [self addSubview:tabViewItem];
        [tabViewItem mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.height.mas_equalTo(40);
            make.width.mas_equalTo(40);
            if (idx == 0) {
                make.top.mas_equalTo(self.profileButton.mas_bottom).offset(40);
            } else {
                make.top.mas_equalTo(self.tabViewItems[idx-1].mas_bottom).offset(20);
            }
        }];
    }];
}

#pragma mark - Public Methods

#pragma mark - Private Methods

- (void)didClickProfileButton:(id)sender {
    if (!self.delegate) return;
    if (![self.delegate respondsToSelector:@selector(tabView:didClickProfileButton:)]) return;
    [self.delegate tabView:self didClickProfileButton:self.profileButton];
}

- (void)didClickMenuButton:(id)sender {
    if (!self.delegate) return;
    if (![self.delegate respondsToSelector:@selector(tabView:didClickMenuButton:)]) return;
    [self.delegate tabView:self didClickMenuButton:self.menuButton];
}

#pragma mark - Notifications

#pragma mark - KVO

#pragma mark - Delegate

#pragma mark - Override

#pragma mark - Helper Methods

@end
