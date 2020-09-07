//
//  DWTabBarButton.m
//  wechat
//
//  Created by deerwang on 2020/9/3.
//  Copyright © 2020 deerwang. All rights reserved.
//

#import "DWTabBarButton.h"
#define DWTabBarButtonImageRatio 0.6

@implementation DWTabBarButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11.f];
    }
    return self;
}
#pragma mark - 调整按钮图片和文案的位置
//重写image
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * DWTabBarButtonImageRatio;
    return CGRectMake(0, 0, imageW, imageH);
}

//重写title
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleY = contentRect.size.height * DWTabBarButtonImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

#pragma mark - 重新高亮函数，去除高亮效果
- (void)setHighlighted:(BOOL)highlighted { }

- (void)setTabBarItem:(UITabBarItem *)tabBarItem {
    _tabBarItem = tabBarItem;
    //设置文案
    [self setTitle:self.tabBarItem.title forState:UIControlStateNormal];
    [self setTitle:self.tabBarItem.title forState:UIControlStateSelected];
    [self setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    [self setTitleColor:[UIColor greenColor]forState:UIControlStateSelected];
    
    //设置图片
    [self setImage:self.tabBarItem.image forState:UIControlStateNormal];
    [self setImage:self.tabBarItem.selectedImage forState:UIControlStateSelected];
}

@end
