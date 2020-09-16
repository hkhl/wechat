//
//  DWSearchController.m
//  wechat
//
//  Created by deerwang on 2020/9/14.
//  Copyright © 2020 deerwang. All rights reserved.
//

#import "DWSearchController.h"

@implementation DWSearchController
{
    UIStatusBarStyle lastBarStyle;
}

+ (DWSearchController *)createWithResultsContrller:(UIViewController<DWSearchResultControllerProtocol> *)resultVC
{
    if (!resultVC) {
        return nil;
    }
    
    UIViewController *vc = [UIViewController new];
    DWSearchController *searchController = [[DWSearchController alloc] initWithSearchResultsController:vc];
    [searchController setSearchResultsUpdater:resultVC];
    return searchController;
}

- (id)initWithSearchResultsController:(UIViewController<DWSearchResultControllerProtocol>  *)searchResultsController
{
    if (self = [super initWithSearchResultsController:searchResultsController]) {
        [self setDelegate:searchResultsController];
        self.definesPresentationContext = YES;
        
        // searchResultsController
        searchResultsController.edgesForExtendedLayout = UIRectEdgeNone;
        
        // searchBar
        [self.searchBar setPlaceholder:@"搜索"];
        [self.searchBar setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SEARCHBAR_HEIGHT)];
        [self.searchBar setBarTintColor:RGBColor(239.0, 239.0, 244.0)]; //灰色
        [self.searchBar setTintColor:RGBColor(2.0, 187.0, 0.0)]; //绿色
        [self.searchBar setDelegate:searchResultsController];
        [self.searchBar setTranslucent:NO];
        self.searchBar.layer.borderWidth = 0.5;
        self.searchBar.layer.borderColor = [RGBColor(239.0, 239.0, 244.0) CGColor];
        
        //设置textField
        UITextField *tf = [[[self.searchBar.subviews firstObject] subviews] lastObject];
        [tf.layer setMasksToBounds:YES];
        [tf.layer setBorderWidth:BORDER_WIDTH_1PX];
        [tf.layer setBorderColor:[UIColor colorWithWhite:0.5 alpha:0.3].CGColor];
        [tf.layer setCornerRadius:5.0f];
        
        //设置取消按钮
        [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]].title = @"取消";
    }
    return self;
}

//语音
- (void)setEnableVoiceInput:(BOOL)showVoiceButton
{
    _enableVoiceInput = showVoiceButton;
    if (showVoiceButton) {
        [self.searchBar setShowsBookmarkButton:YES];
        [self.searchBar setImage:[UIImage imageNamed:@"searchBar_voice"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
        [self.searchBar setImage:[UIImage imageNamed:@"searchBar_voice_HL"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateHighlighted];
    }
    else {
        [self.searchBar setShowsBookmarkButton:NO];
    }
}

@end
