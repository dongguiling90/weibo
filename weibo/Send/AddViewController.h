//
//  SendViewController.h
//  weibo
//
//  Created by user on 2018/1/9.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface AddViewController : UIViewController<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
//@property (weak, nonatomic) IBOutlet UIScrollView *scroll;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *sendButtonCollection;

@end
