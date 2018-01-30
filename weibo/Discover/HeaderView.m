//
//  HeaderView.m
//  weibo
//
//  Created by user on 2018/1/17.
//  Copyright © 2018年 user. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        for(int i=0;i<4;i++){
            UIButton *btn=[[UIButton alloc]init];
            switch (i) {
                case 0:
                     [btn setTitle:@"视频" forState:UIControlStateNormal];
                     [btn setSelected:YES];
                    [btn setTag:0];
                     self.btn1=btn;
                    self.selected=self.btn1;
                    
                    break;
                 case 1:
                    [btn setTitle:@"头条" forState:UIControlStateNormal];
                    [btn setTag:1];
                    self.btn2=btn;
                    break;
                case 2:
                      [btn setTitle:@"榜单" forState:UIControlStateNormal];
                      [btn setTag:2];
                      self.btn3=btn;
                    break;
                case 3:
                    [btn setTitle:@"北京" forState:UIControlStateNormal];
                    [btn setTag:3];
                    self.btn4=btn;
                    break;
                default:
                    break;
            }
            [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
            btn.titleLabel.font=[UIFont boldSystemFontOfSize:16];
            [btn setContentMode:UIViewContentModeCenter];
            [btn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
            [btn sizeToFit];
            [self addSubview:btn];
        }
        UIView *view=[[UIView alloc]init];
        view.backgroundColor=[UIColor orangeColor];
        self.slider=view;
        [self addSubview:self.slider];
        
    }
    return self;
}
-(void)layoutSubviews{
    self.btn1.center=CGPointMake(self.frame.size.width*0.2, self.frame.size.height/2);
    self.btn2.center=CGPointMake(self.frame.size.width*0.4, self.frame.size.height/2);
    self.btn3.center=CGPointMake(self.frame.size.width*0.6, self.frame.size.height/2);
    self.btn4.center=CGPointMake(self.frame.size.width*0.8, self.frame.size.height/2);
    [self.slider setFrame:CGRectMake(self.frame.size.width*0.2-10, self.frame.size.height-5, 20, 3)];
}
-(void)clickButton:(UIButton *)button{
    button.selected=YES;
    [self.selected setSelected:NO];
    self.selected=button;
    [self.slider setCenter:CGPointMake(self.selected.center.x, self.frame.size.height-3.5)];
    if([self.delegate respondsToSelector:@selector(headerView:didSelectedButtonWithTag:)])
       [self.delegate headerView:self didSelectedButtonWithTag:self.selected.tag];
            
        
    
}
@end
