//
//  SearchView.m
//  weibo
//
//  Created by user on 2018/1/18.
//  Copyright © 2018年 user. All rights reserved.
//

#import "SearchView.h"

@implementation SearchView
-(void)awakeFromNib{
    [super awakeFromNib];
}

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        self=[[[NSBundle mainBundle] loadNibNamed:@"SearchView" owner:nil options:nil] firstObject];
        self.frame=frame;
        /**代码设置SearchView控件
         UIView *view0=[[UIView alloc]init];
        view0.backgroundColor=[UIColor whiteColor];
        UITextField *text=[[UITextField alloc]init];
        text.backgroundColor=[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
        text.borderStyle=UITextBorderStyleRoundedRect;
        text.font=[UIFont systemFontOfSize:14];
        self.text=text;
        [view0 addSubview:self.text];
        UIButton *btn=[[UIButton alloc]init];
        [btn setTitle:@"取消" forState:UIControlStateNormal];
        btn.titleLabel.font=[UIFont boldSystemFontOfSize:16];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setContentMode:UIViewContentModeCenter];
        [btn sizeToFit];
        [btn addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
        self.cancel=btn;
        [view0 addSubview:self.cancel];
        UIImageView *imageV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        imageV.contentMode=UIViewContentModeCenter ;
        CGRect frame=imageV.frame;
        frame.size.width+=20;
        imageV.frame=frame;
        text.leftView=imageV;
        text.leftViewMode=UITextFieldViewModeAlways;
        text.placeholder=@"大家都在搜：";
        self.tFView=view0;
        [self addSubview:view0];
        */
        UIImageView *imageV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        imageV.contentMode=UIViewContentModeCenter ;
        CGRect frame=imageV.frame;
        frame.size.width+=20;
        imageV.frame=frame;
        self.textfield.leftViewMode=UITextFieldViewModeAlways;
        self.textfield.placeholder=@"大家都在搜";
        self.textfield.leftView=imageV;
    }
    return self;
}

-(void)layoutSubviews{
    /*代码设置SearchView控件位置和大小
   self.tFView.frame=CGRectMake(0, 0, self.frame.size.width, 40);
    self.text.frame=CGRectMake(5, 5, self.tFView.frame.size.width-50,30);
    self.cancel.frame=CGRectMake(self.tFView.frame.size.width-45, 5, 45, 30);
     */
    
}
-(void)cancel:(UIButton *)button{
    if(_cancelBlock)
        self.cancelBlock();
}

- (IBAction)cancelClick:(id)sender {
    if(_cancelBlock)
        self.cancelBlock();
    
}
@end
