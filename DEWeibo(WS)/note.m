//
//  note.m
//  DEWeibo(WS)
//
//  Created by user on 2016/12/1.
//  Copyright © 2016年 王韦翔. All rights reserved.
//

UI结构：tabController + navigationController + viewController


编码记录：

--第一部分
>准备工作：
新建各模块文件夹(包含MVC子文件夹)，删除不需要的文件，把图片等资源添加到项目里面来

>显示UI主体架构：
AppDelegate.m里初始化window，设置跟控制器，并显示，
 自定义WSTabController
 自定义WSNavigationController
 自定义WSHomeViewController、WSMessageViewController、WSDiscoverViewController、WSMeViewController

>进一步UI编码：
设置WSHomeViewController、WSMessageViewController、WSMeViewController导航条item
 自定义分类UIBarButtonItem (Extension)
 自定义WSTwoViewController和WSThreeViewController
设置WSMessageViewController导航条搜索框

--第二部分
自定义WSTitleButton，用于显示主要导航栏的标题
自定义WSPopController，点击主要导航栏标题会弹出一个视图
