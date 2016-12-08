//
//  WSTabControllerViewController.m
//  DEWeibo(WS)
//
//  Created by user on 2016/12/1.
//  Copyright © 2016年 王韦翔. All rights reserved.
//

#import "WSTabController.h"
#import "WSNavigationController.h"
#import "WSHomeViewController.h"
#import "WSMessageViewController.h"
#import "WSDiscoverViewController.h"
#import "WSMeViewController.h"

@interface WSTabController ()

@end

@implementation WSTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加子控制器
    
    // 添加首页
    WSHomeViewController *homeVc = [[WSHomeViewController alloc] init];
    [self addChildVCWith:homeVc title:@"首页" nmlImgName:@"tabbar_home" selImgName:@"tabbar_home_selected"];
    
    //添加信息
    WSMessageViewController *msgVc = [[WSMessageViewController alloc] init];
    [self addChildVCWith:msgVc title:@"信息" nmlImgName:@"tabbar_message_center" selImgName:
     @"tabbar_message_center_selected"];
    
    //添加发现
    WSDiscoverViewController *discVc = [[WSDiscoverViewController alloc] init];
    [self addChildVCWith:discVc title:@"发现" nmlImgName:@"tabbar_discover" selImgName:@"tabbar_discover_selected"];
    
    //添加我
    WSMeViewController *meVc = [[WSMeViewController alloc] init];
    [self addChildVCWith:meVc title:@"我" nmlImgName:@"tabbar_profile" selImgName:@"tabbar_profile_selected"];

    
}


// 添加tabController的子控制器，用导航控制器包装
-(void)addChildVCWith:(UIViewController *)vc title:(NSString *)title nmlImgName:(NSString *)nmlImgName selImgName:(NSString *)selImgName {
    
    // 用导航控制器包装
    WSNavigationController *nav = [[WSNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    
    //设置标题
    nav.tabBarItem.title = title;
    
    //设置普通状态图片
    nav.tabBarItem.image = [UIImage imageNamed:nmlImgName];
    
    //设置高亮
#warning 默认情况下，tabbar会选中的图片进行渲染成蓝色
    UIImage *selImg = [UIImage imageNamed:selImgName];
    selImg = [selImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = selImg;
    
    
    
}

@end
