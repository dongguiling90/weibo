//
//  TabBarController.h
//  weibo
//
//  Created by user on 2018/1/8.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBar.h"

@interface TabBarController : UITabBarController<TabBarDelegate>
@property(nonatomic,strong)UIView *selectedView;
@property(nonatomic,strong)UIImage *image;
@end
