//
//  CZNewFeatureController.m
//  gzweibo
//
//  Created by apple on 15/5/7.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "WSNewFeatureController.h"
#import "WSBeginView.h"

@interface WSNewFeatureController()<UIScrollViewDelegate>
@property (nonatomic,weak) UIPageControl *pageControl;

@end

@implementation WSNewFeatureController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //ScrollView添加UIImageView
    //1.ScrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.delegate = self;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    
    //1.添加4个UIImageView
    CGFloat imgW = scrollView.w;
    CGFloat imgH = scrollView.h;
    CGFloat imgX = 0;
    CGFloat imgY = 0;
    for (NSInteger i = 1; i < 5; i++) {
        UIImageView *imgView = [[UIImageView alloc] init];
        NSString *imgName =[NSString stringWithFormat:@"new_feature_%ld",i];
        imgView.image = [UIImage imageNamed:imgName];
        
        //设置imgView frm
        imgX = (i - 1) * imgW;
        imgView.frame = CGRectMake(imgX, imgY, imgW, imgH);
        
        
        [scrollView addSubview:imgView];
        
        //最近一个ImageView 添加 BeginView
        if (i == 4) {
            //设置图片可交互
            imgView.userInteractionEnabled = YES;
            WSBeginView *beginView = [WSBeginView beginView];
            CGFloat centerX = imgW * 0.5;
            CGFloat centerY = imgH * 0.5 + 200;
            beginView.center = CGPointMake(centerX, centerY);
            [imgView addSubview:beginView];
        }
    }
    
    //设置contentSize
    scrollView.contentSize = CGSizeMake(imgW * 4, imgH);
    
    //设置翻页属性
    scrollView.pagingEnabled = YES;
    
    
    //设置pageControl
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    CGFloat bottomMargin = 60;
    CGFloat pageControlH = 20;
    CGFloat pageControlY = self.view.h - pageControlH - bottomMargin;
    pageControl.frame = CGRectMake(0,  pageControlY , self.view.w, pageControlH);
    
//    pageControl.backgroundColor = [UIColor grayColor];
    
    //设置页数
    pageControl.numberOfPages = 4;
    
    //设置颜色
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    
    [self.view addSubview:pageControl];
    
    self.pageControl = pageControl;
    
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    MethodLog
    //设置页码
    self.pageControl.currentPage = scrollView.contentOffset.x / scrollView.w;
    NSLog(@"%f",scrollView.contentOffset.x);
}
@end
