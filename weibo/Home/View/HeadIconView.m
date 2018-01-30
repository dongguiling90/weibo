//
//  HeadIconView.m
//  weibo
//
//  Created by user on 2018/1/23.
//  Copyright © 2018年 user. All rights reserved.
//
#import <UIImageView+WebCache.h>
#import "HeadIconView.h"
#import "User.h"

@interface HeadIconView(){
    UIImageView *_headIcon;
    UIImageView *_verifiedIcon;
    NSString *_placeHolder;
}
@end
@implementation HeadIconView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        _headIcon=[[UIImageView alloc]init];
        [self addSubview:_headIcon];
        _verifiedIcon=[[UIImageView alloc]init];
        [self addSubview:_verifiedIcon];
    }
    return self;
}
-(void)setUser:(User *)user{
    _user=user;
    [_headIcon sd_setImageWithURL:[NSURL URLWithString:user.profileImageUrl] placeholderImage:[UIImage imageNamed:_placeHolder]];
    NSString *verifiedIcon=nil;
    switch (user.verifiedType) {
        
        case UserVerifiedTypePersonal:
            _verifiedIcon.hidden=NO;
            verifiedIcon=@"avatar_vip";
            break;
        case UserVerifiedTypeMedia:
        case UserVerifiedTypeWebsite:
        case UserVerifiedTypeEnterprise:
            _verifiedIcon.hidden=NO;
            verifiedIcon=@"avatar_enterprise_vip";
            break;
        case UserVerifiedTypeDaren:
            _verifiedIcon.hidden=NO;
            verifiedIcon=@"avatar_grassroot";
        default:
            _verifiedIcon.hidden=YES;
            break;
    }
    if(verifiedIcon){
        _verifiedIcon.image=[UIImage imageNamed:verifiedIcon];
    }
}
-(void)setUser:(User *)user type:(HeadIconType)type{
    self.headIconType=type;
    self.user=user;
}
-(void)setHeadIconType:(HeadIconType)headIconType{
    _headIconType=headIconType;
    CGSize headIconSize;
    switch (headIconType) {
        case HeadIconTypeSmall:
            headIconSize=CGSizeMake(34, 34);
            _placeHolder=@"avatar_default_small";
            break;
          case HeadIconTypeDefault:
            headIconSize=CGSizeMake(50, 50);
            _placeHolder=@"avatar_default";
            break;
        case HeadIconTypeBig:
            headIconSize=CGSizeMake(85, 85);
            _placeHolder=@"avatar_default_big";
            break;
    }
    _headIcon.frame=(CGRect){CGPointZero,headIconSize};
    _verifiedIcon.bounds=CGRectMake(0, 0, 17, 17);
    _verifiedIcon.center=CGPointMake(headIconSize.width, headIconSize.height);
    CGFloat width=headIconSize.width+17*0.5;
    CGFloat height=headIconSize.height+17*0.5;
    self.bounds=CGRectMake(0, 0, width, height);
}
+(CGSize)headIconSizeWithHeadIconType:(HeadIconType)type{
    CGSize headIconSize;
    switch (type) {
        case HeadIconTypeSmall:
            headIconSize=CGSizeMake(34, 34);
            break;
         case HeadIconTypeDefault:
            headIconSize=CGSizeMake(50, 50);
            break;
        case HeadIconTypeBig:
            headIconSize=CGSizeMake(85, 85);
            break;
       
    }
    CGFloat width=headIconSize.width+17*0.5;
    CGFloat height=headIconSize.height+17*0.5;
    return CGSizeMake(width, height);
}
@end
