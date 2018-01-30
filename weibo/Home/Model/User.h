//
//  User.h
//  weibo
//
//  Created by user on 2018/1/23.
//  Copyright © 2018年 user. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger,UserVerifiedType){
    UserVerifiedTypeNone=-1,
    UserVerifiedTypePersonal=0,
    UserVerifiedTypeEnterprise=2,
    UserVerifiedTypeMedia=3,
    UserVerifiedTypeWebsite=5,
    UserVerifiedTypeDaren=220,
    
};
@interface User : NSObject
@property(nonatomic,copy)NSString *screenName;
@property(nonatomic,copy)NSString* profileImageUrl;
@property(nonatomic,assign) int mbtype;
@property(nonatomic,assign)int mbrank;
@property(nonatomic,assign,getter=isVip) BOOL vip;
@property(nonatomic, assign) UserVerifiedType verifiedType;

@end
