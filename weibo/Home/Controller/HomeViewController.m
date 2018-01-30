//
//  HomeViewController.m
//  weibo
//
//  Created by user on 2018/1/8.
//  Copyright © 2018年 user. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCell.h"
#import "TitleView.h"
#import "DateTools.h"

#define WIDTH  [[UIScreen mainScreen]bounds].size.width
#define H      [[UIScreen mainScreen]bounds].size.height
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.guanzhuTable.delegate=self;
    self.guanzhuTable.dataSource=self;
    self.remenTable.dataSource=self;
    self.remenTable.delegate=self;
    self.scroll.delegate=self;
    [self setTitle];
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    format.dateFormat=@"EEE MMM dd HH:mm:ss z yyyy";
    NSString *str=@"Thu Jan 25 08:40:01 +0800 2018";
    format.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"en-us"];
    NSDate *date=[format dateFromString:str];
    if(date.timeIntervalSinceNow>-60){
        NSLog(@"刚刚");
    }else {
        NSLog(@"%@",date.timeAgoSinceNow);
    }
}
-(NSArray *)statusArray{
    NSData *data=[[NSData alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"weibo_0" ofType:@"json"]];
    NSArray *dataArray=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    _statusArray=dataArray;
    return _statusArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setTitle{
    TitleView *title=[[TitleView alloc]initWithFrame:CGRectMake(0, 0, WIDTH*0.4, 44)];
    self.titleView=title;
    self.titleView.LBtnTitle=@"关注";
    self.titleView.RBtnTitle=@"热门";
    self.navigationItem.titleView=self.titleView;
    
    [self.titleView.LBtn addTarget:self action:@selector(guanzhuClick) forControlEvents:UIControlEventTouchUpInside];
    [self.titleView.RBtn addTarget:self action:@selector(remenClick) forControlEvents:UIControlEventTouchUpInside];
}
- (IBAction)search:(id)sender{
     [sender setImage:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] forState:UIControlStateHighlighted];
    }

- (IBAction)popAction:(id)sender {
    [sender setImage:[UIImage imageNamed:@"navigationbar_pop_highlighted"] forState:UIControlStateHighlighted];
}
-(void)guanzhuClick{
    UIButton *btn1=self.titleView.selected;
    UIButton *btn2=self.titleView.LBtn;
    UIButton *btn3=self.titleView.RBtn;
    if(btn1==btn2&&self.titleView.flag==0){
        //弹出关注下拉菜单
        [self.titleView showListView];
         self.titleView.flag=1;
       
        
    }else if(btn1==btn2&&self.titleView.flag==1){
        //隐藏下拉菜单
        self.titleView.flag=0;
        [self.titleView hideListView];
        
    }else if(btn1==btn3){
        //  切换主页面关注和热门
        self.titleView.selected=self.titleView.LBtn;
        if(self.titleView.flag==1){
         self.titleView.flag=0;
            [self.titleView hideListView];
        }
        [self.titleView.LBtn setSelected:YES];
        [self.titleView.RBtn setSelected:NO];
        [self.scroll setContentOffset:CGPointMake(0, 0) animated:YES];
    }
}
-(void)remenClick{
    UIButton *btn1=self.titleView.selected;
    UIButton *btn2=self.titleView.RBtn;
    UIButton *btn3=self.titleView.LBtn;
    
    if(btn1==btn2&&self.titleView.flag==0){
        //弹出热门下拉菜单；
        self.titleView.flag=1;
        [self.titleView showListView];
    }else if(btn1==btn2&&self.titleView.flag==1){
        //隐藏热门下拉菜单；
        self.titleView.flag=0;
        [self.titleView hideListView];
        
    }else if(btn1==btn3){
        self.titleView.selected=self.titleView.RBtn;
        if(self.titleView.flag==1){
         self.titleView.flag=0;
         [self.titleView hideListView];
        }
        
        [self.titleView.RBtn setSelected:YES];
        [self.titleView.LBtn setSelected:NO];
        [self.scroll setContentOffset:CGPointMake(WIDTH, 0) animated:YES];
    }
    
}

#pragma  mark ----tableviewdatasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section==0)
        return 1;
    return 400;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0){
        return 60;
    }
    return 30;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView registerClass:[HomeCell class] forCellReuseIdentifier:@"homeCell"];
       HomeCell *cell=[tableView dequeueReusableCellWithIdentifier:@"homeCell"];
    if(cell==nil)
        cell=[[HomeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"homeCell"];
    //cell.backgroundColor=[UIColor lightGrayColor];
    if(indexPath.section==0){
        
    }
    else{
        
    }
        
     return cell;
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
