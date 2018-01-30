//
//  MessageViewController.m
//  weibo
//
//  Created by user on 2018/1/8.
//  Copyright © 2018年 user. All rights reserved.
//

#import "MessageViewController.h"

#define WIDTH  [[UIScreen mainScreen]bounds].size.width
#define H      [[UIScreen mainScreen]bounds].size.height
@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   [self setTitle];
    self.scroll.delegate=self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setTitle{
    TitleView *title=[[TitleView alloc]initWithFrame:CGRectMake(0, 0, WIDTH*0.4, 44)];
    self.titleView=title;
    self.titleView.LBtnTitle=@"通知";
    self.titleView.RBtnTitle=@"聊天";
    self.navigationItem.titleView=self.titleView;
    
    [self.titleView.LBtn addTarget:self action:@selector(tongzhiClick) forControlEvents:UIControlEventTouchUpInside];
    [self.titleView.RBtn addTarget:self action:@selector(liaotianClick) forControlEvents:UIControlEventTouchUpInside];
}
-(void)tongzhiClick{
    UIButton *btn1=self.titleView.selected;
    UIButton *btn2=self.titleView.LBtn;
    UIButton *btn3=self.titleView.RBtn;
    if(btn1==btn2&&self.titleView.flag==0){
        //弹出通知下拉菜单
        [self.titleView showListView];
        self.titleView.flag=1;
        
    }else if(btn1==btn2&&self.titleView.flag==1){
        //隐藏下拉菜单
        self.titleView.flag=0;
        [self.titleView hideListView];
        
    }else if(btn1==btn3){
        //  切换主页面通知和聊天
        NSLog(@"%d",self.titleView.flag);
        self.titleView.selected=self.titleView.LBtn;
        //[self.titleView layoutSubviews];
        // [self.titleView.slider setFrame:CGRectMake(WIDTH*0.4/2-30-10, 44-5, 20, 3)];
        if(self.titleView.flag==1){
            self.titleView.flag=0;
            [self.titleView hideListView];
        }
        [self.titleView.LBtn setSelected:YES];
        [self.titleView.RBtn setSelected:NO];
        [self.scroll setContentOffset:CGPointMake(0, 0) animated:YES];
    }
}
-(void)liaotianClick{
    UIButton *btn1=self.titleView.selected;
    UIButton *btn2=self.titleView.RBtn;
    UIButton *btn3=self.titleView.LBtn;
    if(btn1==btn2&&self.titleView.flag==0){
        //弹出聊天下拉菜单；
        self.titleView.flag=1;
        [self.titleView showListView];
    }else if(btn1==btn2&&self.titleView.flag==1){
        //隐藏热门下拉菜单；
        self.titleView.flag=0;
        [self.titleView hideListView];
        
    }else if(btn1==btn3){
        self.titleView.selected=self.titleView.RBtn;
        [self.titleView.RBtn setSelected:YES];
        [self.titleView.LBtn setSelected:NO];
        [self.scroll setContentOffset:CGPointMake(WIDTH, 0) animated:YES];
        //[self.titleView layoutSubviews];
        //[self.slider setFrame:CGRectMake(WIDTH/2+30-10, height-5, 20, 3)]
        if(self.titleView.flag==1){
            self.titleView.flag=0;
            [self.titleView hideListView];
        }
        
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


#pragma mark --uiscrollviewdelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGRect frame=self.titleView.slider.frame;
    frame.origin.x=scrollView.contentOffset.x*60/WIDTH+self.titleView.frame.size.width/2-30-10;
    self.titleView.slider.frame=frame;
    
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if(self.titleView.flag==1){
        [self.titleView hideListView];
        self.titleView.flag=0;
    }
}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if(self.titleView.slider.frame.origin.x>self.titleView.frame.size.width/2-10){
        self.titleView.selected=self.titleView.RBtn;
        [self.titleView.RBtn setSelected:YES];
        [self.titleView.LBtn setSelected:NO];
        NSLog(@"%d",self.titleView.flag);
    }else
    {  self.titleView.selected=self.titleView.LBtn;
        [self.titleView.LBtn setSelected:YES];
        [self.titleView.RBtn setSelected:NO];
        NSLog(@"%d",self.titleView.flag);
    }
    
}

  @end
  
