//
//  DiscoverViewController.m
//  weibo
//
//  Created by user on 2018/1/9.
//  Copyright © 2018年 user. All rights reserved.
//

#import "DiscoverViewController.h"
#import "SearchBar.h"
#import "HeaderView.h"
#import "SearchView.h"

@interface DiscoverViewController ()

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setHidden:YES];
    if([self.baseTable respondsToSelector:@selector(setSeparatorInset:)]){
        [self.baseTable setSeparatorInset:UIEdgeInsetsZero];
    }
    if([self.baseTable respondsToSelector:@selector(setLayoutMargins:)])
       [self.baseTable setLayoutMargins:UIEdgeInsetsZero];
       
    self.baseTable.dataSource=self;
    self.baseTable.delegate=self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section==1){
        return 1;
    }
    return 6;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0){
        switch (indexPath.row) {
        case 0: return 40;
        case 1: return 80;
        case 2: return 120;
        case 3:return 60;
        case 4:return 30;
        case 5:return 100;
        default:
            break;
    }
}
    return CGRectGetHeight(self.view.bounds);
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section==0)
        return 0;
    return 40;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HeaderView *header=[[HeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
    self.header=header;
    self.header.delegate=self;
    return self.header;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"first"];
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"first"];
    }
    if(indexPath.section==0){
        switch (indexPath.row) {
            case 0:
                self.search=[[SearchBar alloc]initWithFrame:CGRectMake(5, 5, self.view.bounds.size.width-10, 30)];
                
                [self setSearchEditBlock];
                [cell.contentView addSubview:self.search];
                break;
             case 1:
                self.loop=[[LoopView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80)];
                [cell.contentView addSubview:self.loop];
                break;
            default:
                break;
        }
       
        
    }
     return cell;
    
}
-(void)setSearchEditBlock{
    __weak typeof(self) weakself=self;
    self.search.editBlock = ^{
        weakself.searchView=[[SearchView alloc]initWithFrame:CGRectMake(0, 20, weakself.view.bounds.size.width,weakself.view.bounds.size.height)];
       weakself.searchView.cancelBlock = ^{
           [weakself.searchView removeFromSuperview];
           [weakself.tabBarController.tabBar setHidden:NO];
        };
        [weakself.tabBarController.tabBar setHidden:YES];
        weakself.searchView.backgroundColor=[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
        [weakself.view addSubview:weakself.searchView];
        
    };
}
#pragma mark ---headerViewDelegate
-(void)headerView:(HeaderView *)header didSelectedButtonWithTag:(NSInteger)tag{
    switch (tag) {
        case 0:
            break;
          case 1:
            break;
            case 2:
            break;
            case 3:
            break;
        default:
            break;
    }
}
@end
