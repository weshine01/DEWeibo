//
//  WSHomeViewController.m
//  DEWeibo(WS)
//
//  Created by user on 2016/12/7.
//  Copyright © 2016年 王韦翔. All rights reserved.
//

#import "WSHomeViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "WSTwoViewController.h"

@interface WSHomeViewController ()

@end

@implementation WSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航条左两边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barBtnItemWithNmlImg:@"navigationbar_friendsearch" hltImg:@"navigationbar_friendsearch_highlighted" target:self action:@selector(friendsearchBtnClick)];
    
    //设置导航条右两边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barBtnItemWithNmlImg:@"navigationbar_pop" hltImg:@"navigationbar_pop_highlighted" target:self action:@selector(qrcScan)];
    
    self.title = @"首页";
    
    
    
}

-(void)friendsearchBtnClick{
    
    WSTwoViewController *twoVc = [[WSTwoViewController alloc] init];
    
    [self.navigationController pushViewController:twoVc animated:YES];
}


-(void)qrcScan{
    NSLog(@"%s",__func__);
}


@end
