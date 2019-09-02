//
//  AMKContentViewController.m
//  AMKTabView
//
//  Created by 孟昕欣 on 2019/8/31.
//  Copyright © 2019 Andy Meng. All rights reserved.
//

#import "AMKContentViewController.h"
#import <Masonry.h>

@interface AMKContentViewController ()

@end

@implementation AMKContentViewController

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

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    self.textField.stringValue = title;
}

- (NSTextField *)textField {
    if (!_textField) {
        _textField = [NSTextField.alloc init];
        _textField.font = [NSFont systemFontOfSize:40];
        _textField.alignment = NSTextAlignmentCenter;
        _textField.editable = NO;
        _textField.drawsBackground = NO;
        _textField.bordered = NO;
        _textField.wantsLayer = YES;
        _textField.shadow = ({
            NSShadow *shadow = [[NSShadow alloc] init];
            shadow.shadowColor = [NSColor colorWithWhite:0 alpha:0.45];
            shadow.shadowOffset = NSMakeSize(2, 2);
            shadow.shadowBlurRadius = 1;
            shadow;
        });
        [self.view addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self.view).priorityLow();
            make.center.mas_equalTo(self.view);
        }];
    }
    return _textField;
}

#pragma mark - Data & Networking

#pragma mark - Layout Subviews

#pragma mark - Public Methods

#pragma mark - Private Methods

#pragma mark - Notifications

#pragma mark - KVO

#pragma mark - Delegate

#pragma mark - Override

#pragma mark - Helper Methods



@end
