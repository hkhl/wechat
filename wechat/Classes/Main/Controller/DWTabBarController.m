//
//  DWTabBarController.m
//  wechat
//
//  Created by deerwang on 2020/9/3.
//  Copyright © 2020 deerwang. All rights reserved.
//

#import "DWTabBarController.h"
#import "DWTabBar.h"
#import "DWNavigationController.h"

@interface DWTabBarController () <DWTabBarDelegate>
@property (nonatomic, strong) DWTabBar *customTabBar;
@end

@implementation DWTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化tabbar
    [self setupTabBar];
    //初始化控制器
    [self setupViewController];
}

- (void)setupTabBar {
    //初始化自定义tabBar，设置位置颜色，添加到view中
    DWTabBar *customTabBar = [[DWTabBar alloc] init];
    //设置tabbar位置
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    //tabbar赋值
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}

- (void)setupViewController {
    UIViewController *v1 = [[UIViewController alloc] init];
    UIViewController *v2 = [[UIViewController alloc] init];
    v2.view.backgroundColor = [UIColor redColor];
    UIViewController *v3 = [[UIViewController alloc] init];
    UIViewController *v4 = [[UIViewController alloc] init];
    [self initWithController:v1 title:@"微信" tabBarImage:@"tabbar_home" tabBarImageHL:@"tabbar_homeHL"];
    [self initWithController:v2 title:@"通讯录" tabBarImage:@"tabbar_contacts" tabBarImageHL:@"tabbar_contactsHL"];
    [self initWithController:v3 title:@"发现" tabBarImage:@"tabbar_discover" tabBarImageHL:@"tabbar_discoverHL"];
    [self initWithController:v4 title:@"我" tabBarImage:@"tabbar_me" tabBarImageHL:@"tabbar_meHL"];
}

- (void)initWithController:(UIViewController *)vc
                     title:(NSString *)title
               tabBarImage:(NSString *)image
             tabBarImageHL:(NSString *)imageHL {
    //导航控制器
    vc.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:imageHL];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    [self.customTabBar addTabBarButtonWithItem:vc.tabBarItem];
}

//移除系统自带tabBar
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    for (UIView *child in self.tabBar.subviews) {
        if([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

#pragma mark - DWTabBarDelegate
- (void)tabBar:(DWTabBar *)tabBar controllerFrom:(NSUInteger)from to:(NSUInteger)to {
    //控制控制器跳转
    //NSLog(@"from:%d to:%d",from, to);
    self.selectedIndex = to;
}

//解决重影 ? 
//-(void)viewWillLayoutSubviews{
//    [super viewWillLayoutSubviews];
//    for (UIView *child in self.tabBar.subviews) {
//        if ([child isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
//            [child removeFromSuperview];
//        }
//    }
//}

@end
