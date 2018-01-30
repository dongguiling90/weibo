//
//  TabBar.h
//  weibo
//
//  Created by user on 2018/1/10.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TabBar;
@protocol TabBarDelegate<UITabBarDelegate>

@optional
-(void)tabBarDidClickAddButton:(TabBar*)tabBar;
@end

@interface TabBar : UITabBar
@property(nonatomic,strong)UIButton *add;
@property(nonatomic,weak)id<TabBarDelegate> tabBarDelegate;
@end
