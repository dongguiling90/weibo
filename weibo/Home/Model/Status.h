//
//  Status.h
//  weibo
//
//  Created by user on 2018/1/23.
//  Copyright © 2018年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;
@interface Status : NSObject
@property(nonatomic,copy)NSString *idstr;
@property(nonatomic,copy)NSString *createdAt;
@property(nonatomic,copy)User *user;
@property(nonatomic,copy)NSString *text;
@property(nonatomic,copy)NSString *source;
@property(nonatomic,strong)Status *retweetedStatus;
@property(nonatomic,assign) NSInteger repostsCount;
@property(nonatomic,assign)NSInteger attitudesCount;
@property(nonatomic,assign)NSInteger commentsCount;
@property(nonatomic,strong)NSArray *picUrls;

@end
