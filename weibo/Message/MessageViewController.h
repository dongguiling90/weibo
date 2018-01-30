//
//  MessageViewController.h
//  weibo
//
//  Created by user on 2018/1/8.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleView.h"
@interface MessageViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property(nonatomic,weak)TitleView *titleView;;
@property (weak, nonatomic) IBOutlet UIButton *disbutton;
@property (weak, nonatomic) IBOutlet UIButton *tongzhi;
@property (weak, nonatomic) IBOutlet UIButton *liaotian;
@property (weak, nonatomic) IBOutlet UIButton *chat;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;
@property (weak, nonatomic) IBOutlet UITableView *table1;
@property (weak, nonatomic) IBOutlet UITableView *table2;

@end
