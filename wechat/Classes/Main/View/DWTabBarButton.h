//
//  DWTabBarButton.h
//  wechat
//
//  Created by deerwang on 2020/9/3.
//  Copyright © 2020 deerwang. All rights reserved.
//  表示工具条中一个按钮

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DWTabBarButton : UIButton
//提供一个tabBarItem属性，用来存储UITabBarItem的三个属性（文案，图片，选中图片）
@property (nonatomic, strong) UITabBarItem *tabBarItem;
@end

NS_ASSUME_NONNULL_END
