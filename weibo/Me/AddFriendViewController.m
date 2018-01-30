//
//  AddFriendViewController.m
//  weibo
//
//  Created by user on 2018/1/9.
//  Copyright © 2018年 user. All rights reserved.
//

#import "AddFriendViewController.h"
#import "TabBarController.h"
#import "MeViewController.h"
@interface AddFriendViewController ()

@end

@implementation AddFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden=YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden=NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)backClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
