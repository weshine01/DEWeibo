//
//  NSBundle+Extension.m
//  gzweibo
//
//  Created by apple on 15/5/5.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "NSBundle+Extension.h"

@implementation NSBundle (Extension)


+(instancetype)loadViewFromNibName:(NSString *)nibName{
    return [[[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil] lastObject];
}
@end
