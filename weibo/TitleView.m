//
//  TitleView.m
//  weibo
//
//  Created by user on 2018/1/12.
//  Copyright © 2018年 user. All rights reserved.
//

#import "TitleView.h"
#import "HomeViewController.h"
#define W [[UIScreen mainScreen]bounds].size.width
#define H [[UIScreen mainScreen]bounds].size.height
@implementation TitleView{
    UIView *_listView;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
         UIButton *btn1=[[UIButton alloc]init];
        
         //[btn1 setTitle:self.LBtnTitle forState:UIControlStateNormal];
         [btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
         [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
         btn1.titleLabel.font=[UIFont boldSystemFontOfSize:15];
         [btn1 setSelected:YES];
         self.LBtn=btn1;
         [self.LBtn sizeToFit];
        UIButton *btn2=[[UIButton alloc]init];
       //[btn2 setTitle:self.RBtnTitle forState:UIControlStateNormal];
        [btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        btn2.titleLabel.font=[UIFont boldSystemFontOfSize:15];
        //[btn2 addTarget:self action:@selector(remenClick) forControlEvents:UIControlEventTouchUpInside];
        self.RBtn=btn2;
        [self.RBtn sizeToFit];
        UIView *slider=[[UIView alloc]init];
        self.slider=slider;
        self.slider.backgroundColor=[UIColor orangeColor];
        [self addSubview:self.LBtn];
        [self addSubview:self.RBtn];
        [self addSubview:self.slider];
        _listView=[[UIView alloc]initWithFrame:CGRectMake(frame.origin.x-0.3*W, frame.origin.y+frame.size.height,W, 0)];
        [self addSubview:_listView];
        self.selected=_LBtn;
        self.flag=0;
        
    }
    return self;
}
-(void)setRBtnTitle:(NSString *)rBtnTitle{
    _RBtnTitle=rBtnTitle;
   [self.RBtn setTitle:_RBtnTitle forState:UIControlStateNormal];
    
}
-(void)setLBtnTitle:(NSString *)lBtnTitle{
     _LBtnTitle=lBtnTitle;
    [self.LBtn  setTitle:_LBtnTitle forState:UIControlStateNormal];
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width=self.frame.size.width;
    CGFloat height=self.frame.size.height;
    CGRect bframe=self.LBtn.frame;
    bframe.size.width=40;
    bframe.size.height=40;
    self.LBtn.frame=bframe;
    self.RBtn.frame=bframe;
    self.LBtn.center=CGPointMake(width/2-30, height/2);
    self.RBtn.center=CGPointMake(width/2+30, height/2);
    if(self.selected==self.LBtn){
    [self.slider setFrame:CGRectMake(width/2-30-10, height-5, 20, 3)];
    }else if(self.selected==self.RBtn){
        [self.slider setFrame:CGRectMake(width/2+30-10, height-5, 20, 3)];
    }
}
-(void)showListView{
    //[self bringSubviewToFront:_listView];
    if ([self.delegate respondsToSelector:@selector(dropdownMenuWillShow:)]) {
        [self.delegate dropdownMenuWillShow:self]; // 将要显示回调代理
    }
    [UIView animateWithDuration:0.1f animations:^{
        _listView.frame=CGRectMake(self.frame.origin.x-0.3*W, self.frame.origin.y+self.frame.size.height, W,H/2 );
        _listView.backgroundColor=[UIColor lightGrayColor];
    } completion:^(BOOL finished) {
        if ([self.delegate respondsToSelector:@selector(dropdownMenuDidShow:)]) {
            [self.delegate dropdownMenuDidShow:self]; // 已经显示回调代理
        }
    }];
}
-(void)hideListView{
    if ([self.delegate respondsToSelector:@selector(dropdownMenuWillHidden:)]) {
        [self.delegate dropdownMenuWillHidden:self]; // 将要隐藏回调代理
    }
    [UIView animateWithDuration:0.1f animations:^{
        _listView.frame=CGRectMake(self.frame.origin.x-0.3*W, self.frame.origin.y+self.frame.size.height, W,0 );
    } completion:^(BOOL finished) {
        if ([self.delegate respondsToSelector:@selector(dropdownMenuDidHidden:)]) {
            [self.delegate dropdownMenuDidHidden:self]; // 已经隐藏回调代理
        }
    }];
}
@end
