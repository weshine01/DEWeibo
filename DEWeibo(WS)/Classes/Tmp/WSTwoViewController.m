//
//  CZTwoViewController.m
//  gzweibo
//
//  Created by apple on 15/5/5.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "WSTwoViewController.h"
#import "WSThreeViewController.h"

@interface WSTwoViewController ()

@end

@implementation WSTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
#warning 下面的设置不能设置返回按钮样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    item.tintColor = [UIColor orangeColor];

    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"xxxx" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    
    self.title = @"two";
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *backTitle = @"首页";
    
   
//#warning 只要设置左边按钮，以前系统会生成返回按钮就不见
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithTitle:backTitle target:self action:@selector(back)];
    
}
//
//- (void)back {
//    [self.navigationController popViewControllerAnimated:YES];
//}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    WSThreeViewController *threeVc = [[WSThreeViewController alloc] init];
    [self.navigationController pushViewController:threeVc animated:YES];
}

@end
