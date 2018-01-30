//
//  HeaderView.h
//  weibo
//
//  Created by user on 2018/1/17.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeaderView;
@protocol HeaderViewDelegate<NSObject>
@optional

-(void)headerView:(HeaderView *)header didSelectedButtonWithTag:(NSInteger)tag;
@end
@interface HeaderView : UIView
@property(nonatomic,weak)id<HeaderViewDelegate>delegate;
@property(nonatomic,strong)UIButton *btn1;
@property(nonatomic,strong)UIButton *btn2;
@property(nonatomic,strong)UIButton *btn3;
@property(nonatomic,strong)UIButton *btn4;
@property(nonatomic,strong)UIButton *selected;
@property(nonatomic,strong)UIView *slider;
@end
