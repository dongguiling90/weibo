//
//  CloseBar.m
//  weibo
//
//  Created by user on 2018/1/11.
//  Copyright © 2018年 user. All rights reserved.
//

#import "CloseBar.h"

@implementation CloseBar

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        UIButton *btn=[[UIButton alloc]init];
        btn.frame=CGRectMake(0, 0, frame.size.height, frame.size.height);
        btn.center=CGPointMake(frame.size.width/2, frame.size.height/2);
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_close"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(closeClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
    }
    return self;
}
-(void)closeClick{
    if(_close){
        _close();
    }
}
@end
