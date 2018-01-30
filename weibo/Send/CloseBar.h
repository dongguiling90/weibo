//
//  CloseBar.h
//  weibo
//
//  Created by user on 2018/1/11.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^CloseClick)(void);
@interface CloseBar : UIView
@property(nonatomic,copy)CloseClick close;
@end
