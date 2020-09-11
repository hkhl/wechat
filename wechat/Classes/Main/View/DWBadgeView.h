//
//  DWBadgeView.h
//  wechat
//
//  Created by deerwang on 2020/9/11.
//  Copyright © 2020 deerwang. All rights reserved.
//  from:https://www.jianshu.com/p/54e2305be369

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DWBadgeView : UIView
@property (nonatomic, strong) IBInspectable UIColor *bgColor;
@property (nonatomic, strong) IBInspectable NSString *badgeValue;
@property (nonatomic, strong) IBInspectable UIColor *textColor;
@property (nonatomic, strong) IBInspectable UIFont *textFont;
@end

NS_ASSUME_NONNULL_END
