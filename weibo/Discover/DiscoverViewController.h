//
//  DiscoverViewController.h
//  weibo
//
//  Created by user on 2018/1/9.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderView.h"
#import "SearchBar.h"
#import "LoopView.h"
#import "SearchView.h"
@interface DiscoverViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,HeaderViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *baseTable;
@property(nonatomic,strong)SearchBar *search;
@property(nonatomic,strong)HeaderView *header;
@property(nonatomic,strong)LoopView *loop;
@property(nonatomic,strong) SearchView *searchView;
@end
