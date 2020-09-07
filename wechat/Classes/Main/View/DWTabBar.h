//
//  DWTabBar.h
//  wechat
//
//  Created by deerwang on 2020/9/3.
//  Copyright © 2020 deerwang. All rights reserved.
//  表示底部整个tabbar工具栏

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class DWTabBar;
@protocol DWTabBarDelegate <NSObject>
//tabbar代理通知 跳转到某个控制器
- (void)tabBar:(DWTabBar *)tabBar controllerFrom:(NSUInteger)from to:(NSUInteger)to;
@end


@interface DWTabBar : UIView
@property (nonatomic, weak) id<DWTabBarDelegate> delegate;
- (void)addTabBarButtonWithItem:(UITabBarItem *)item;
@end

NS_ASSUME_NONNULL_END
