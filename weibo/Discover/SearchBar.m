//
//  SearchBar.m
//  weibo
//
//  Created by user on 2018/1/16.
//  Copyright © 2018年 user. All rights reserved.
//

#import "SearchBar.h"


@implementation SearchBar
-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        self.font=[UIFont systemFontOfSize:14];
        //self.background=[UIImage imageNamed:@"searchbar_textfield_background"];
        self.backgroundColor=[UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1];
        self.borderStyle=UITextBorderStyleRoundedRect;
        UIImageView *imageV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        imageV.contentMode=UIViewContentModeCenter;
        CGRect iframe=imageV.frame;
        iframe.size.width+=20;
        imageV.frame=iframe;
        self.leftView=imageV;
        self.placeholder=@"大家都在搜：";
        self.leftViewMode=UITextFieldViewModeAlways;
        self.delegate=self;
    }
    return self;
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
   if(_editBlock)
       self.editBlock();
      return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [self resignFirstResponder];
}
@end
