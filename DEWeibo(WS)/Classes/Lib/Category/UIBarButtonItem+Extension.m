//
//  UIBarButtonItem+Extension.m
//  gzweibo
//
//  Created by apple on 15/5/5.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+(instancetype)barBtnItemWithNmlImg:(NSString *)nmlImg hltImg:(NSString *)hltImg target:(id)target action:(SEL)action{

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *nmlImage = [UIImage imageNamed:nmlImg];
    
    [btn setImage:nmlImage forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:hltImg] forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    btn.bounds = CGRectMake(0, 0, nmlImage.size.width, nmlImage.size.height);
    return [[UIBarButtonItem alloc] initWithCustomView:btn];

}

+(instancetype)barBtnItemWithTitle:(NSString *)title target:(id)target action:(SEL)action{
    
    UIFont *titleFont = [UIFont systemFontOfSize:16];
    //计算文字所要的尺寸
    CGSize maxSize =  CGSizeMake(MAXFLOAT, MAXFLOAT);
    CGSize titleSize = [title boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:titleFont} context:nil].size;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn  setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    
    //设置不可用字体颜色
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    //设置字体大小
    btn.titleLabel.font = titleFont;
    btn.bounds = CGRectMake(0, 0, titleSize.width, titleSize.height);
   
    //事件
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}


+(instancetype)backItemWithTitle:(NSString *)title target:(id)target action:(SEL)action{
    //设置返回按钮
    UIImage *nmlImg = [UIImage imageNamed:@"navigationbar_back_withtext"];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:nmlImg forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"navigationbar_back_withtext_highlighted"] forState:UIControlStateHighlighted];
    [backBtn setTitle:title forState:UIControlStateNormal];
    
    //设置字体大小
    UIFont *titleFont = [UIFont systemFontOfSize:16];
    backBtn.titleLabel.font = titleFont;
    
    //设置字体颜色
    [backBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    //计算文字所要的尺寸
    CGSize maxSize =  CGSizeMake(MAXFLOAT, MAXFLOAT);
    CGSize titleSize = [title boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:titleFont} context:nil].size;
    
    
    CGFloat btnH = nmlImg.size.height;
    CGFloat btnW = nmlImg.size.width + titleSize.width;
    
    //设置按钮尺寸
    backBtn.bounds = CGRectMake(0, 0, btnW, btnH);
    //    backBtn.backgroundColor = [UIColor blackColor];
    
    //监听事件
    [backBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
   return [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}

@end
