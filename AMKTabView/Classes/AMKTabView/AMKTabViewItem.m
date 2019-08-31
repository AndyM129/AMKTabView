//
//  AMKTabViewItem.m
//  AMKTabView
//
//  Created by 孟昕欣 on 2019/8/31.
//

#import "AMKTabViewItem.h"

@interface AMKTabViewItem ()
@property(nonatomic, assign) NSInteger index;
@property(nonatomic, strong) NSImage *normalImage;
@property(nonatomic, strong) NSImage *selectedImage;
@end

@implementation AMKTabViewItem

#pragma mark - Init Methods

- (void)dealloc {
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.imagePosition = NSImageOnly;
        self.imageScaling = NSImageScaleNone;
        self.bordered = NO;
        [self setButtonType:NSButtonTypeMomentaryChange];
    }
    return self;
}

+ (instancetype)tabViewItemWithImage:(NSImage *)image selectedImage:(NSImage *)selectedImage {
    AMKTabViewItem *tabViewItem = [AMKTabViewItem.alloc init];
    tabViewItem.normalImage = image;
    tabViewItem.selectedImage = selectedImage;
    tabViewItem.image = image;
    tabViewItem.alternateImage = selectedImage;
    return tabViewItem;
}

#pragma mark - Properties

- (void)setState:(NSControlStateValue)state {
    [super setState:state];
    self.image = state==NSControlStateValueOn ? self.selectedImage : self.normalImage;
}

- (void)setContentView:(NSView *)contentView {
    [_contentView removeFromSuperview];
    _contentView = contentView;
}

- (void)setContentViewController:(NSViewController *)contentViewController {
    _contentViewController = contentViewController;
    self.contentView = _contentViewController.view;
    self.toolTip = _contentViewController.title;
}

#pragma mark - Layout Subviews

#pragma mark - Public Methods

#pragma mark - Private Methods

#pragma mark - Notifications

#pragma mark - KVO

#pragma mark - Delegate

#pragma mark - Override

#pragma mark - Helper Methods

@end
