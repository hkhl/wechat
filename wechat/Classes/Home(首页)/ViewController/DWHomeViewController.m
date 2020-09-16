//
//  DWHomeViewController.m
//  wechat
//
//  Created by deerwang on 2020/9/11.
//  Copyright © 2020 deerwang. All rights reserved.
//

#import "DWHomeViewController.h"
#import "DWSearchController.h"

@interface DWHomeViewController ()
@property(nonatomic, strong)UIViewController *resultVC;//搜索控制器
@property(nonatomic, strong)UISearchController *searchController;//搜索控制器
@end

@implementation DWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSearchBarcontroller];
}

- (void)initSearchBarcontroller {
    self.searchController = [DWSearchController createWithResultsContrller:[UIViewController new]];
    self.navigationItem.searchController = self.searchController;
    //清空tableview多余的空格线
    [self.tableView setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
}
@end
