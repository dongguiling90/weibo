//
//  SendViewController.m
//  weibo
//
//  Created by user on 2018/1/9.
//  Copyright © 2018年 user. All rights reserved.
//

#import "AddViewController.h"
#import "TabBarController.h"
#import "SendViewController.h"
#import "CloseBar.h"
#define WIDTH  [UIScreen mainScreen].bounds.size.width;
@interface AddViewController ()
@property(nonatomic,strong)UIImage *image;
@property(nonatomic,strong)UITabBarController *tab;
@property(nonatomic,strong)CloseBar *bar;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buttonCollectionAction];
    [self showFromView];
    self.scroll.delegate=self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)showFromView
{    [self.imageView setImage:[UIImage imageNamed:@"backgroundImage"]];
    UIBlurEffect *effect=[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    UIVisualEffectView *effectView=[[UIVisualEffectView alloc]initWithEffect:effect];
    effectView.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
   /**
    UIVibrancyEffect *veffect=[UIVibrancyEffect effectForBlurEffect:effect];
    UIVisualEffectView  *veffectview=[[UIVisualEffectView alloc]initWithEffect:veffect];
    [veffectview setFrame:self.view.bounds];
    [effectView.contentView addSubview:veffectview];
    */
    [self.imageView addSubview:effectView];
    
    CloseBar *bar=[[CloseBar alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height-49, self.view.bounds.size.width, 49)];
    bar.close = ^{
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    self.bar=bar;
   // self.bar.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.bar];
 
}
-(void)buttonCollectionAction{
    for(UIButton *button in _sendButtonCollection){
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}
-(void)buttonClick:(UIButton *)button{
    
    switch (button.tag) {
        case 100:
            [self dismissViewControllerAnimated:YES completion:^{
                NSLog(@"发微博");
                UIStoryboard *sendStory=[UIStoryboard storyboardWithName:@"Send" bundle:nil];
               UINavigationController  *nav=[sendStory instantiateInitialViewController];
                UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
                if([viewController isKindOfClass:[UITabBarController class]]){
                    UITabBarController *tab=(UITabBarController*)viewController;
                  
                    [tab presentViewController:nav animated:YES completion:nil];
                    }
            }];
             break;
         case 101:
                
            break;
         case 102:
            break;
        case 103:
            break;
        case 104:
            break;
        default:
            break;
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark ---uiScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    self.pageControl.currentPage=(int)scrollView.contentOffset.x/WIDTH;
}
    



@end
