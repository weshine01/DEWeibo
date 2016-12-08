//
//  WSMeViewController.m
//  DEWeibo(WS)
//
//  Created by user on 2016/12/7.
//  Copyright © 2016年 王韦翔. All rights reserved.
//

#import "WSMeViewController.h"

@interface WSMeViewController ()

@end

@implementation WSMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barBtnItemWithTitle:@"设置" target:self action:@selector(settingBtnClick)];
    
    
}

-(void)settingBtnClick{
    NSLog(@"%s",__func__);;
}

@end
