//
//  DWSearchController.h
//  wechat
//
//  Created by deerwang on 2020/9/14.
//  Copyright © 2020 deerwang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class UIViewController;
@protocol DWSearchResultControllerProtocol <UISearchResultsUpdating, UISearchBarDelegate, UISearchControllerDelegate>
- (void)setItemClickAction:(void (^)(__kindof UIViewController *searchResultVC, id data))itemClickAction;
@end

@interface DWSearchController : UISearchController
@property (nonatomic, assign) BOOL enableVoiceInput;
+ (DWSearchController *)createWithResultsContrller:(UIViewController<DWSearchResultControllerProtocol> *)resultVC;

@end

NS_ASSUME_NONNULL_END
