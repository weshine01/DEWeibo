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
#import "WSTitleButton.h"
#import "WSPopController.h"

@interface WSHomeViewController ()
@property (nonatomic,strong) WSPopController * popControl;

@end

@implementation WSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航条左两边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barBtnItemWithNmlImg:@"navigationbar_friendsearch" hltImg:@"navigationbar_friendsearch_highlighted" target:self action:@selector(friendsearchBtnClick)];
    
    //设置导航条右两边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barBtnItemWithNmlImg:@"navigationbar_pop" hltImg:@"navigationbar_pop_highlighted" target:self action:@selector(qrcScan)];
    
    self.title = @"首页";
    
    WSTitleButton *titleButton = [WSTitleButton buttonWithType:UIButtonTypeCustom];
    titleButton.bounds = CGRectMake(0, 0, 100, 30);
    [titleButton setTitle:@"倚楼听风雨" forState:UIControlStateNormal];
    [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleButton;
    
}



#pragma mark 标题按钮点击
-(void)titleButtonClick:(WSTitleButton *)btn{
#warning 没有必要每次都创建一个PopController,相当于懒加载
    if (!self.popControl) {
        UIButton *contentView = [[UIButton alloc] init];
        contentView.bounds = CGRectMake(0, 0, 150, 200);
        contentView.backgroundColor = [UIColor redColor];
        
        [contentView addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        
        //初始化popControl
        WSPopController *popControl = [[WSPopController alloc] initWithContentView:contentView];
        
        popControl.alpha = 0;
        
        self.popControl = popControl;
    }
    
    //展现
    [self.popControl showInView:btn position:CZPopViewPositionBottomRight];
    
    
    
}


-(void)click{
    MethodLog;
    [self.popControl dissmiss];
}




-(void)friendsearchBtnClick{
    
    WSTwoViewController *twoVc = [[WSTwoViewController alloc] init];
    
    [self.navigationController pushViewController:twoVc animated:YES];
}


-(void)qrcScan{
    NSLog(@"%s",__func__);
}




@end
