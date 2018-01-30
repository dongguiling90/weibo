//
//  ImageItemView.h
//  weibo
//
//  Created by user on 2018/1/30.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@class GLPhoto;
@interface ImageItemView : UIImageView
@property(nonatomic,strong)GLPhoto *photo;
@property(nonatomic,weak)UIImageView *gifView;
@end
