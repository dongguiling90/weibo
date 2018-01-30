//
//  User.m
//  weibo
//
//  Created by user on 2018/1/23.
//  Copyright © 2018年 user. All rights reserved.
//

#import "User.h"
#import "MJExtension.h"

@implementation User
-(void)setMbtype:(int)mbtype{
    _mbtype=mbtype;
    self.vip=mbtype>2;
}
+(NSDictionary*)mj_replacedKeyFromPropertyName{
    return @{
             @"screenName":@"screen_name",
             @"profileImageUrl":@"profile_image_url",
             @"verifiedType":@"verified_type"
             };
    
}
@end
