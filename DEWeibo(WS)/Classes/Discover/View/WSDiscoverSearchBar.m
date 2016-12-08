//
//  CZDiscoverSearchBar.m
//  gzweibo
//
//  Created by apple on 15/5/5.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "WSDiscoverSearchBar.h"

@interface WSDiscoverSearchBar()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;

@property (weak, nonatomic) IBOutlet UITextField *textField;
/**
 *  文本输入右边约束
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textFieldRightConstraint;

@property (nonatomic,strong) UIImageView * searchImgView;

/**
 *  箭头按钮
 */
@property (nonatomic,strong) UIButton *arrowBtn;

@end

@implementation WSDiscoverSearchBar

-(UIImageView *)searchImgView{
    
    if (!_searchImgView) {
        UIImageView *searchImgView = [[UIImageView alloc] init];
        UIImage *searchImg = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        searchImgView.image = searchImg ;
        
        //设置图片不拉伸
        searchImgView.contentMode = UIViewContentModeCenter;
        
        searchImgView.bounds = CGRectMake(0, 0, searchImg.size.width + 15, searchImg.size.height);
        _searchImgView = searchImgView;
    }
    
    return _searchImgView;
}


-(UIButton *)arrowBtn{
    if (!_arrowBtn) {
        _arrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_arrowBtn setImage:[UIImage imageNamed:@"popover_arrow"] forState:UIControlStateNormal];
        _arrowBtn.bounds = self.searchImgView.bounds;
        //图片控制转180度
        _arrowBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI);
    }
    
    return _arrowBtn;
}

+(instancetype)searchBar{
//    return [NSBundle loadViewFromNibName:@"CZDiscoverSearchBar"];
    return [[[NSBundle mainBundle] loadNibNamed:@"WSDiscoverSearchBar" owner:nil options:nil] lastObject];
}

-(void)awakeFromNib{
    //添加textField左边view
    
    self.textField.leftView = self.searchImgView;
    
    //设置左边view显示模式
#warning 一定要设置，否则不显示
    self.textField.leftViewMode =  UITextFieldViewModeAlways;
    
    
    //设置代理
    self.textField.delegate = self;
}

#pragma mark 文本输入框代理
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    MethodLog
    //取消按钮可见
    self.cancelBtn.hidden = NO;
    
    //搜索框宽度变小
    self.textFieldRightConstraint.constant = self.cancelBtn.w + 10;
   
    
    // 更新左边view
    self.textField.leftView = self.arrowBtn;
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    MethodLog
}


- (IBAction)cancelBtnClick {
    
    //隐藏按钮
    self.cancelBtn.hidden = YES;
  
    //恢复textField的约束
    self.textFieldRightConstraint.constant = 0;
    
    
    //恢复搜索imagView
    self.textField.leftView = self.searchImgView;
    
    //添加动画效果
#warning 约束动画不能把约束改变直接放在block
    [UIView animateWithDuration:0.25 animations:^{
        //要添加使用，调用父控件的layoutIfNeeded
        [self layoutIfNeeded];
    }];
    [self endEditing:YES];
}

@end
