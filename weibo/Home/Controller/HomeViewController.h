//
//  HomeViewController.h
//  weibo
//
//  Created by user on 2018/1/8.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleView.h"

@interface HomeViewController : UIViewController<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak)TitleView *titleView;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;
@property (weak, nonatomic) IBOutlet UITableView *guanzhuTable;
@property (weak, nonatomic) IBOutlet UITableView *remenTable;
@property(nonatomic,strong)NSArray *statusArray;
- (IBAction)popAction:(id)sender;
- (IBAction)search:(id)sender;

@end
