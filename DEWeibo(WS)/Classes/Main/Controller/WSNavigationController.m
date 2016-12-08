//
//  WSNavigationController.m
//  DEWeibo(WS)
//
//  Created by user on 2016/12/7.
//  Copyright © 2016年 王韦翔. All rights reserved.
//

#import "WSNavigationController.h"
#import "UIBarButtonItem+Extension.h"


@interface WSNavigationController ()

@end

@implementation WSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 设置导航条背景
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background_os7"] forBarMetrics:UIBarMetricsDefault];
    
}


#warning 导航控制器显示新控制器时，会调用下面方法
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    // 1.获取导航控制器的子控制器的个数
    NSInteger navChildCount = self.viewControllers.count;
    
//    NSLog(@"===%ld",self.viewControllers.count);
    if (navChildCount > 0) {
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
        
        //添加返回根控制器按钮,只有第二个控制器以上才要返回 "根控制器'
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem barBtnItemWithNmlImg:@"navigationbar_more" hltImg:@"navigationbar_more_highlighted" target:self action:@selector(backRootVc)];
    }
    
    if (navChildCount == 1) {//添加返回按钮标题为上一个控制器标题
        // 上一个控制器
        //        UIViewController *previousVc = viewController.navigationController.childViewControllers[0];
        UIViewController *previousVc = self.viewControllers[0];
        NSString *backTitle = previousVc.title;
        
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithTitle:backTitle target:self action:@selector(back)];
    }
    
    if (navChildCount > 1) {
        //添加返回按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithTitle:@"返回" target:self action:@selector(back)];
    }
    
    
    
    
    [super pushViewController:viewController animated:animated];
    
    
}

/**
 *  返回上一个控制器
 */
-(void)back{
    [self popViewControllerAnimated:YES];
}

/**
 *  返回根控制器
 */
-(void)backRootVc{
    [self popToRootViewControllerAnimated:YES];
}

@end
