//
//  TitleView.h
//  weibo
//
//  Created by user on 2018/1/12.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TitleView;
@protocol TitleViewDelegate<NSObject>

@optional
- (void)dropdownMenuWillShow:(TitleView *)menu;    // 当下拉菜单将要显示时调用
- (void)dropdownMenuDidShow:(TitleView *)menu;     // 当下拉菜单已经显示时调用
- (void)dropdownMenuWillHidden:(TitleView *)menu;  // 当下拉菜单将要收起时调用
- (void)dropdownMenuDidHidden:(TitleView *)menu;   // 当下拉菜单收起后调用
@end
@interface TitleView : UIView
@property(nonatomic,weak)id<TitleViewDelegate>delegate;
@property(nonatomic,strong)UIButton *LBtn;
@property(nonatomic,strong)UIButton *RBtn;
@property(nonatomic,copy)NSString *LBtnTitle;
@property(nonatomic,copy)NSString *RBtnTitle;
@property(nonatomic,strong)UIView *slider;
@property(nonatomic,strong)UIButton *selected;
@property(nonatomic,readwrite) BOOL flag;
-(void)showListView;
-(void)hideListView;
@end
