//
//  SendViewController.m
//  weibo
//
//  Created by user on 2018/1/18.
//  Copyright © 2018年 user. All rights reserved.
//

#import "SendViewController.h"

@interface SendViewController ()

@end

@implementation SendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
  
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)send:(id)sender {
}
@end
