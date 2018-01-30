//
//  TabBarController.m
//  weibo
//
//  Created by user on 2018/1/8.
//  Copyright © 2018年 user. All rights reserved.
//

#import "TabBarController.h"
#import "TabBar.h"

@interface TabBarController ()
@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpTabBar];
    [self addViewController];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark ----tabBarDelegate
-(void)tabBarDidClickAddButton:(TabBar*)tabBar{
    
     UIStoryboard *addStory=[UIStoryboard storyboardWithName:@"Add" bundle:nil];
     UIViewController *vc=[addStory instantiateViewControllerWithIdentifier:@"Add"];
     [self presentViewController:vc animated:YES completion:nil];
    
}
-(void)setUpTabBar{
    TabBar *tab=[[TabBar alloc]initWithFrame:self.tabBar.bounds];
   __weak typeof(self)  weakSelf=self;
    tab.tabBarDelegate=weakSelf;
    [self setValue:tab forKey:@"tabBar"];
    
}
-(void)addViewController{
    //添加首页导航,设置标签栏字体颜色
    UIStoryboard *homeStory=[UIStoryboard storyboardWithName:@"Home" bundle:nil];
    UINavigationController *homeNav=[homeStory instantiateViewControllerWithIdentifier:@"homeNav"];
    [self addChildViewController:homeNav];
    [homeNav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    [homeNav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateSelected];
    //添加消息导航，设置标签栏字体颜色
    UIStoryboard *messageStory=[UIStoryboard storyboardWithName:@"Message" bundle:nil];
    UINavigationController *messageNav=[messageStory instantiateViewControllerWithIdentifier:@"messageNav"];
    [self addChildViewController:messageNav];
    [messageNav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    [messageNav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateSelected];
    
    //添加发现导航，设置标签栏字体颜色
    UIStoryboard *discoverStory=[UIStoryboard storyboardWithName:@"Discover" bundle:nil];
    UINavigationController *disNav=[discoverStory instantiateViewControllerWithIdentifier:@"Discover"];
    [self addChildViewController:disNav];
    [disNav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    [disNav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateSelected];
    //添加我导航，设置标签栏字体颜色
    UIStoryboard *meStory=[UIStoryboard storyboardWithName:@"Me" bundle:nil];
    UINavigationController *meNav=[meStory instantiateViewControllerWithIdentifier:@"Me"];
    [self addChildViewController:meNav];
    [meNav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    [meNav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateSelected];
    //添加send导航，设置标签栏字体颜色
   /**
    UIStoryboard *addStory=[UIStoryboard storyboardWithName:@"Add" bundle:nil];
    UIViewController *vc=[addStory instantiateViewControllerWithIdentifier:@"Add"];
    [self addChildViewController:vc];
    */
    }

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
