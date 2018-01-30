//
//  TabBar.m
//  weibo
//
//  Created by user on 2018/1/10.
//  Copyright © 2018年 user. All rights reserved.
//

#import "TabBar.h"
@interface TabBar()

@end
@implementation TabBar
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        UIButton *btn=[[UIButton alloc]init];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [btn sizeToFit];
        [btn addTarget:self action:@selector(clickAdd) forControlEvents:UIControlEventTouchUpInside];
        self.add=btn;
        [self addSubview:self.add];
        
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat w=self.frame.size.width;
    CGFloat h=self.frame.size.height;
    self.add.center=CGPointMake(w*0.5, h*0.5);
    CGFloat tabBtnW=self.frame.size.width/5;
    CGFloat index=0;
    for(UIView *child in self.subviews){
        if([child isKindOfClass:NSClassFromString(@"UITabBarButton")]){
            CGRect temp=child.frame;
            temp.origin.x=index*tabBtnW;
            temp.size.width=tabBtnW;
            child.frame=temp;
            index++;
            if(index==2)
               index++;
        }
    }
    
    
}
-(void)clickAdd{
    if([self.tabBarDelegate respondsToSelector:@selector(tabBarDidClickAddButton:)]){
        [self.tabBarDelegate tabBarDidClickAddButton:self];
    }
}

@end
