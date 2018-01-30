//
//  MeViewController.m
//  weibo
//
//  Created by user on 2018/1/9.
//  Copyright © 2018年 user. All rights reserved.
//

#import "MeViewController.h"
#import "AddFriendViewController.h"
#import "TabBarController.h"
#import "ProfileViewCell.h"
@interface MeViewController ()

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.table.dataSource=self;
    self.table.delegate=self;
    self.table.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
    if([self.table respondsToSelector:@selector(setSeparatorInset:)])
        self.table.separatorInset=UIEdgeInsetsZero;
    if([self.table respondsToSelector:@selector(setLayoutMargins:)])
        self.table.layoutMargins=UIEdgeInsetsZero;
    self.imgArray=[[NSArray alloc]initWithObjects:@"new_friend",@"vip",@"album",@"like",@"card",@"collect",@"pay",@"draft" ,nil];
    self.textArray=[[NSArray alloc]initWithObjects:@"新的好友",@"会员",@"我的相册",@"我的赞",@"我的卡券",@"我的收藏",@"微博钱包",@"草稿箱",nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma  mark ----tableviewdatasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     NSInteger row=[indexPath row];
    if(row==0||row==3||row==6||row==9||row==14)
        return 8;
    if(indexPath.row==1)
        return 80;
    
    return 40;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row=[indexPath row];
    
    if(row==0||row==3||row==6||row==9||row==14){
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
        if(!cell){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            
        }
        cell.contentView.backgroundColor=[UIColor lightGrayColor];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        return cell;
    }
     else if(row==1){
      
        ProfileViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"profile"];
        if(!cell){
            cell=[[ProfileViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"profile"];
        }
    
        [cell.imageV setImage:[UIImage imageNamed:@"avatar_default"]];
        [cell.label setText:@"wuye16"];
        return cell;
        
    }
     else if(row==2){
         UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"buttonCell"];
         if(!cell){
             cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"buttonCell"];
         }         cell.contentView.backgroundColor=[UIColor whiteColor];
         
         return cell;
     }
         
       else
       {     UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"selectCell"];
           if(!cell){
               cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"selectCell"];
           }
           if(row>3&&row<6){
           cell.imageView.image=[UIImage imageNamed:[self.imgArray objectAtIndex:indexPath.row-4]];
           cell.textLabel.text=[self.textArray objectAtIndex:indexPath.row-4];
           }
           if(row>6&&row<9){
            cell.imageView.image=[UIImage imageNamed:[self.imgArray objectAtIndex:indexPath.row-5]];
            cell.textLabel.text=[self.textArray objectAtIndex:indexPath.row-5];
           }
           if(row>9&&row<14){
              cell.imageView.image=[UIImage imageNamed:[self.imgArray objectAtIndex:indexPath.row-6]];
              cell.textLabel.text=[self.textArray objectAtIndex:indexPath.row-6];
           }
           cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
           [cell.textLabel setFont:[UIFont systemFontOfSize:14]];
           return cell;
       }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
@end
