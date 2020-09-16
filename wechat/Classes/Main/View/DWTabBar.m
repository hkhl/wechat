//
//  DWTabBar.m
//  wechat
//
//  Created by deerwang on 2020/9/3.
//  Copyright © 2020 deerwang. All rights reserved.
//

#import "DWTabBar.h"
#import "DWTabBarButton.h"

@interface DWTabBar()
@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, strong) DWTabBarButton *selectedButton;
@end

@implementation DWTabBar

- (NSMutableArray *)buttons {
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (void)addTabBarButtonWithItem:(UITabBarItem *)item {
    DWTabBarButton *barBtn = [[DWTabBarButton alloc] init];
    [self addSubview:barBtn];
    [self.buttons addObject:barBtn];
    barBtn.tabBarItem = item;

    //监听按钮点击
    [barBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    //默认点击第一个按钮
    self.selectedButton = self.buttons.firstObject;
    [self btnClick:self.selectedButton];
}

- (void)btnClick:(UIButton *)button {
    if ([self.delegate respondsToSelector:@selector(tabBar:controllerFrom:to:)]) {
        [self.delegate tabBar:self controllerFrom:self.selectedButton.tag to:button.tag];
    }
    self.selectedButton.selected = NO;
    self.selectedButton = (DWTabBarButton *)button;
    self.selectedButton.selected = YES;
}

//绘制出butonitem的位置
- (void)layoutSubviews {
    //先用普通布局方式， 再改为框架布局
    CGFloat buttonW = self.frame.size.width / self.subviews.count;
    CGFloat buttonH = self.frame.size.height;
    for (int index = 0; index < self.buttons.count; index++) {
        DWTabBarButton *btn = self.buttons[index];
        CGFloat buttonX = index * buttonW;
        btn.frame = CGRectMake(buttonX, 10, buttonW, buttonH);
        NSLog(@"%f ", self.frame.size.width-btn.frame.size.width-1);
        
        //设置button tag
        btn.tag = index;
    }
}

@end
