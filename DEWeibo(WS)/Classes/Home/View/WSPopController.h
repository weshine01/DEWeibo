//
//  CZPopController.h
//  gzweibo
//
//  Created by apple on 15/5/7.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    CZPopViewPositionBottomLeft,
    CZPopViewPositionBottomCenter,
    CZPopViewPositionBottomRight,
}CZPopViewPosition;

@interface WSPopController : NSObject

/**
 *  返回一个实例
 *
 *  @param contentView Pop里面内容View
 */
-(instancetype)initWithContentView:(UIView *)contentView;


/**
 *  在哪个view显示
 *  默认中心显示popView
 */
-(void)showInView:(UIView *)inView;


/**
 *  在哪个view 底部的某个位置显示
 */
-(void)showInView:(UIView *)inView position:(CZPopViewPosition)position;

/**
 *  给个遮盖透明度
 */
@property (nonatomic,assign) CGFloat alpha;

/**
 *  隐藏当前popview
 */
-(void)dissmiss;
@end
