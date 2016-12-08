//
//  UIBarButtonItem+Extension.h
//  gzweibo
//
//  Created by apple on 15/5/5.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)


/**
 *
 *
 *  @param nmlIme 正常状态的图片
 *  @param hltImg 高度状态的图片
 *  @param target 按钮taget
 *  @param action 按钮点击触发方法
 *
 *  @return UIBarButtonItem
 */
+(instancetype)barBtnItemWithNmlImg:(NSString *)nmlIme hltImg:(NSString *)hltImg target:(id)target action:(SEL)action;


/**
 *  返回固定样式导航条Item
 */
+(instancetype)barBtnItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;


/**
 *  固定样式的返回按钮
 *
 */
+(instancetype)backItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
@end
