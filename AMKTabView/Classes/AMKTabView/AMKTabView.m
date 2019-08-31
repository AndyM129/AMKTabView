//
//  AMKTabView.m
//  AMKTabView
//
//  Created by 孟昕欣 on 2019/8/31.
//

#import "AMKTabView.h"
#import <Masonry/Masonry.h>

@interface AMKTabViewItem (AMKTabView)
@property(nonatomic, assign) NSInteger index;
@end

@interface AMKTabView ()

@end

@implementation AMKTabView

#pragma mark - Init Methods

- (void)dealloc {
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

#pragma mark - Properties

- (void)setTabPosition:(AMKTabPosition)tabPosition {
    if (_tabPosition == tabPosition) return;
    _tabPosition = tabPosition;
    [self relayoutTabViewItems];
}

- (void)setTabViewItems:(NSArray<__kindof AMKTabViewItem *> *)tabViewItems {
    BOOL tabViewDidChangeNumberOfTabViewItems = _tabViewItems.count==tabViewItems.count ? NO : YES;
    [self.tabViewItems makeObjectsPerformSelector:@selector(removeFromSuperview)];
    _tabViewItems = tabViewItems.copy;
    
    if (!tabViewDidChangeNumberOfTabViewItems) return;
    if (!self.delegate) return;
    if (![self.delegate respondsToSelector:@selector(tabViewDidChangeNumberOfTabViewItems:)]) return;
    [self.delegate tabViewDidChangeNumberOfTabViewItems:self];
}

#pragma mark - Layout Subviews

- (void)relayoutTabViewItems {
    [self.tabViewItems enumerateObjectsUsingBlock:^(__kindof AMKTabViewItem * _Nonnull tabViewItem, NSUInteger idx, BOOL * _Nonnull stop) {
        tabViewItem.index = idx;
        tabViewItem.target = self;
        tabViewItem.action = @selector(didClickTabViewItem:);
        [self addSubview:tabViewItem];
        
        // 左边或右边，则竖直方向对齐
        if (self.tabPosition==AMKTabPositionLeft || self.tabPosition==AMKTabPositionRight) {
            [tabViewItem mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(self);
                make.height.mas_equalTo(self).multipliedBy(1.0 / self.tabViewItems.count);
                make.left.mas_equalTo(self);
                make.right.mas_equalTo(self);
                if (idx == 0) {
                    make.top.mas_equalTo(self);
                } else {
                    make.top.mas_equalTo(self.tabViewItems[idx-1].mas_bottom);
                }
            }];
        }
        // 顶部或底部，则水平方向对齐
        else {
            [tabViewItem mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(self);
                make.width.mas_equalTo(self).multipliedBy(1.0 / self.tabViewItems.count);
                make.top.mas_equalTo(self);
                make.bottom.mas_equalTo(self);
                if (idx == 0) {
                    make.left.mas_equalTo(self);
                } else {
                    make.left.mas_equalTo(self.tabViewItems[idx-1].mas_right);
                }
            }];
        }
    }];
}

#pragma mark - Public Methods

- (void)addTabViewItem:(AMKTabViewItem *)tabViewItem {
    NSMutableArray *tabViewItems = (self.tabViewItems?:@[]).mutableCopy;
    [tabViewItems addObject:tabViewItem];
    self.tabViewItems = tabViewItems;
    [self relayoutTabViewItems];
}

- (void)insertTabViewItem:(AMKTabViewItem *)tabViewItem atIndex:(NSInteger)index {
    NSMutableArray *tabViewItems = (self.tabViewItems?:@[]).mutableCopy;
    [tabViewItems insertObject:tabViewItem atIndex:index];
    self.tabViewItems = tabViewItems;
    [self relayoutTabViewItems];
}

- (void)removeTabViewItem:(AMKTabViewItem *)tabViewItem {
    NSMutableArray *tabViewItems = (self.tabViewItems?:@[]).mutableCopy;
    [tabViewItems removeObject:tabViewItem];
    self.tabViewItems = tabViewItems;
    [self relayoutTabViewItems];
}

- (NSInteger)numberOfTabViewItems {
    return self.tabViewItems.count;
}

- (NSInteger)indexOfTabViewItem:(AMKTabViewItem *)tabViewItem {
    return [self.tabViewItems indexOfObject:tabViewItem];
}

- (AMKTabViewItem *)tabViewItemAtIndex:(NSInteger)index {
    return [self.tabViewItems objectAtIndex:index];
}

- (void)selectTabViewItem:(nullable AMKTabViewItem *)tabViewItem {
    [self didClickTabViewItem:tabViewItem];
}

- (void)selectTabViewItemAtIndex:(NSInteger)index {
    AMKTabViewItem *tabViewItem = [self tabViewItemAtIndex:index];
    [self selectTabViewItem:tabViewItem];
}

- (void)selectFirstTabViewItem:(nullable id)sender {
    [self selectTabViewItemAtIndex:0];
}

- (void)selectLastTabViewItem:(nullable id)sender {
    [self selectTabViewItemAtIndex:self.numberOfTabViewItems-1];
}

- (void)selectNextTabViewItem:(nullable id)sender {
    NSInteger selectedTabViewItemIndex = [self indexOfTabViewItem:self.selectedTabViewItem];
    [self selectTabViewItemAtIndex:selectedTabViewItemIndex+1];
}

- (void)selectPreviousTabViewItem:(nullable id)sender {
    NSInteger selectedTabViewItemIndex = [self indexOfTabViewItem:self.selectedTabViewItem];
    [self selectTabViewItemAtIndex:selectedTabViewItemIndex-1];
}

#pragma mark - Private Methods

- (void)didClickTabViewItem:(AMKTabViewItem *)tabViewItem {
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabView:shouldSelectTabViewItem:)]) {
        if (![self.delegate tabView:self shouldSelectTabViewItem:tabViewItem]) return;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabView:willSelectTabViewItem:)]) {
        [self.delegate tabView:self willSelectTabViewItem:tabViewItem];
    }
    
    if (self.contentView) {
        [self.selectedTabViewItem.contentView removeFromSuperview];
        [self.contentView addSubview:tabViewItem.contentView];
        [tabViewItem.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.contentView);
        }];
    }
    tabViewItem.state = NSControlStateValueOn;
    self.selectedTabViewItem.state = NSControlStateValueOff;
    self.selectedTabViewItem = tabViewItem;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabView:didSelectTabViewItem:)]) {
        [self.delegate tabView:self didSelectTabViewItem:tabViewItem];
    }
}

#pragma mark - Notifications

#pragma mark - KVO

#pragma mark - Delegate

#pragma mark - Override

#pragma mark - Helper Methods

@end
