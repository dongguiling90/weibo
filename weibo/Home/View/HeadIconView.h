//
//  HeadIconView.h
//  weibo
//
//  Created by user on 2018/1/23.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,HeadIconType){
    HeadIconTypeSmall,
    HeadIconTypeDefault,
    HeadIconTypeBig,
};
@class User;
@interface HeadIconView : UIView

@property(nonatomic,strong)User *user;
@property(nonatomic,assign)HeadIconType headIconType;
-(void)setUser:(User *)user type:(HeadIconType)type;
+(CGSize)headIconSizeWithHeadIconType:(HeadIconType)type;
@end
