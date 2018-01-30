//
//  MeViewController.h
//  weibo
//
//  Created by user on 2018/1/9.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *table;

@property(nonatomic,copy)NSArray *imgArray;
@property(nonatomic,copy)NSArray *textArray;

@end
