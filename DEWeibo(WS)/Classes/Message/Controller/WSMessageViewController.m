//
//  WSMessageViewController.m
//  DEWeibo(WS)
//
//  Created by user on 2016/12/7.
//  Copyright © 2016年 王韦翔. All rights reserved.
//

#import "WSMessageViewController.h"
#import "WSTwoViewController.h"

@interface WSMessageViewController ()

@end

@implementation WSMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];//
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barBtnItemWithTitle:@"发起聊天" target:self action:@selector(chatting)];
    self.title = @"信息";
    //设置不可用
    //    self.navigationItem.rightBarButtonItem.enabled = NO;
    
}

- (void)chatting {
    NSLog(@"%s",__func__);
    WSTwoViewController *two = [[WSTwoViewController alloc] init];
    [self.navigationController pushViewController:two animated:YES];
    
}



@end
