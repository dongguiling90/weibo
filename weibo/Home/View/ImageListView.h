//
//  ImageListView.h
//  weibo
//
//  Created by user on 2018/1/30.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageListView : UIImageView
@property(nonatomic,copy)NSArray *photos;

+(CGSize)sizeWithCount:(int)count;
@end
