//
//  CZBeginView.m
//  gzweibo
//
//  Created by apple on 15/5/7.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "WSBeginView.h"
#import "WSTabController.h"

@interface WSBeginView()
- (IBAction)beginBtnClick;


@end

@implementation WSBeginView


+(instancetype)beginView{
    return [[[NSBundle mainBundle] loadNibNamed:@"WSBeginView" owner:nil options:nil] lastObject];
}
- (IBAction)beginBtnClick {
    //保存当前版本号
    [NSUserDefaults saveCurrentVersion];
    
    //进度主界面（UITabbar）
    //更改主窗口的rootView
    WSTabController *tabbarContr = [[WSTabController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabbarContr;
}
@end
