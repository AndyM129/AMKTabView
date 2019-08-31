//
//  AMKTabView.h
//  AMKTabView
//
//  Created by 孟昕欣 on 2019/8/31.
//

#import <Cocoa/Cocoa.h>
#import "AMKTabViewItem.h"
@protocol AMKTabViewDelegate;

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
