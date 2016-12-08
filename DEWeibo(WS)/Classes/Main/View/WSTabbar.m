//
//  CZTabbar.m
//  gzweibo
//
//  Created by apple on 15/5/7.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "WSTabbar.h"

@interface WSTabbar()

@property (nonatomic,weak) UIButton *plusBtn;

@end

@implementation WSTabbar


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //添加中间“十号”按钮
        //设置背景图片
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar_background_os7"]];
        MethodLog
        [self setupPlusBtn];
    }
    
    return self;
}

-(void)setupPlusBtn{
    UIButton *plusBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
    //设置背景图片
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    
    //设置image
//    tabbar_compose_icon_add_highlighted
    [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    
    //设置size
    plusBtn.size = CGSizeMake(64, 44);
    
    [self addSubview:plusBtn];
    
    self.plusBtn = plusBtn;
}

-(void)layoutSubviews{
    [super layoutSubviews];
#warning 这个种做只适合大于3，5，7个按钮可以
    //重新步局
    [self setupBtnsFrm];

}

#pragma mark 设置内部5个按钮frm
-(void)setupBtnsFrm{
    // 1.设置加号按钮的center
    CGFloat centerX = self.w * 0.5;
    CGFloat centerY = self.h * 0.5;
    self.plusBtn.center = CGPointMake(centerX, centerY);
    //    NSLog(@"%@",NSStringFromCGPoint(self.center));
    
    // 2.设置系统4个UITabBarButton的frm
    //    NSLog(@"%@",self.items);
    
    CGFloat btnW = self.w / (self.items.count + 1);
    CGFloat btnH = self.h;
    
    NSInteger index = 0;
    for (UIView *view in self.subviews) {
        
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (index > 1) {
                view.frame = CGRectMake(btnW * (index + 1), 0, btnW, btnH);
            }else{
                view.frame = CGRectMake(btnW * index, 0, btnW, btnH);
            }
            
            //            NSLog(@"%@",[view class]);
            //设置lable的颜色
            [self setupLabelColorWithBtn:view index:index];
            
            index ++;
            
        }
    }

}

#pragma mark 设置选中的文字颜色
-(void)setupLabelColorWithBtn:(UIView *)btnView index:(NSInteger)index{
    
    NSInteger selectedIndex = [self.items indexOfObject:self.selectedItem];
    NSLog(@"选中索引%ld %ld",selectedIndex,index);
    
    for (id view in btnView.subviews) {
        NSLog(@"%@",[view superclass]);
        if ([view isKindOfClass:[UILabel class]]) {
            UILabel *label = view;
            // 选中时，设置orangeColor 未选中，设置grayColor
            if (selectedIndex == index) {
                label.textColor = [UIColor orangeColor];
            }else{
                label.textColor = [UIColor grayColor];
            }
        }
        
    }
    
        NSLog(@"============================");
}
@end
