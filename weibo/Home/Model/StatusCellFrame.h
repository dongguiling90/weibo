//
//  StatusCellFrame.h
//  weibo
//
//  Created by user on 2018/1/25.
//  Copyright © 2018年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class Status;
@interface StatusCellFrame : NSObject
@property(nonatomic,strong) Status *status;
@property(nonatomic,readonly) CGRect headIconFrame;
@property(nonatomic,readonly) CGRect  screenNameFrame;
@property(nonatomic,readonly) CGRect  mbIconFrame;
@property(nonatomic,assign,readonly)   CGRect topViewFrame;
@property(nonatomic,assign,readonly)CGRect timeLabelframe;
@property(nonatomic,assign,readonly)CGRect sourceLabelframe;
@property(nonatomic,assign,readonly)CGRect textLabelFrame;
@property(nonatomic,assign,readonly)CGRect imageviewsFrame;
@property(nonatomic,assign,readonly)CGRect retweetViewFrame;
@property(nonatomic,assign,readonly)CGRect retweetTextLabelFrame;
@property(nonatomic,assign,readonly)CGRect retweetImageViewsFrame;
@property(nonatomic,assign,readonly)CGRect retweetToolBarFrame;
@property(nonatomic,assign,readonly)CGRect statusToolFrame;
@property(nonatomic,assign,readonly)CGFloat cellHeight;
@end
