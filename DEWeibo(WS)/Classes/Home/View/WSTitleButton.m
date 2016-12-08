//
//  CZTitleButton.m
//  gzweibo
//
//  Created by apple on 15/5/7.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "WSTitleButton.h"

#define kImgWith 10 //图片宽度

@implementation WSTitleButton
#warning 只要调用 init 方法，内部调用 initWithFrame方法
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //设置背景图片
        [self setBackgroundImage:[UIImage imageNamed:@"timeline_card_bottom_line_highlighted"] forState:UIControlStateHighlighted];
        
        //设置图片
        [self setImage:[UIImage imageNamed:@"new_dot"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"new_dot"] forState:UIControlStateHighlighted];
        //设置文字颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        self.backgroundColor = [UIColor purpleColor];
        
        //设置图片不被 拉伸
        self.imageView.contentMode = UIViewContentModeCenter;
        
        //文字居中显示
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        //设置字体大小
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        
#warning 如果美工没有给圆角的背景图片，可以自己用代码来设置
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
    }
    
    return self;
}


//-(CGRect)imageRectForContentRect:(CGRect)contentRect{
//
//}
//
//-(CGRect)titleRectForContentRect:(CGRect)contentRect{
//
//}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    //重新设置按钮w,h
//    NSLog(@"%@",self.titleLabel.font);
    CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    CGFloat selfW = titleSize.width + kImgWith + 5;
    self.w = selfW;
    self.h = titleSize.height + 4;
    
    //重新步局titleView和imageView
    //1.imageView frm
    CGFloat imgX = self.w - kImgWith;
    CGFloat imgY = 0;
    CGFloat imgW =  kImgWith;
    CGFloat imgH = self.h;
    self.imageView.frame = CGRectMake(imgX, imgY, imgW, imgH);

    
    //2.titleView frm
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleW = imgX;
    CGFloat titleH = self.h;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    
    
}
@end
