//
//  WSDiscoverViewController.m
//  DEWeibo(WS)
//
//  Created by user on 2016/12/7.
//  Copyright © 2016年 王韦翔. All rights reserved.
//

#import "WSDiscoverViewController.h"
#import "WSDiscoverSearchBar.h"

@interface WSDiscoverViewController ()

@end

@implementation WSDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //往导航栏标签View添加搜索框
    WSDiscoverSearchBar *searchbar = [WSDiscoverSearchBar searchBar];
    //    searchbar.backgroundColor = [UIColor redColor];
    //设置searchbar的bound
    CGFloat searchBarW = [UIScreen mainScreen].bounds.size.width - 20;
    
    CGRect  searchbarBounds = searchbar.bounds;
    //重新设置宽度
    searchbarBounds.size.width = searchBarW;
    searchbar.bounds = searchbarBounds;
    
    
    self.navigationItem.titleView  = searchbar;
}

@end
