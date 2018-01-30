//
//  Status.m
//  weibo
//
//  Created by user on 2018/1/23.
//  Copyright © 2018年 user. All rights reserved.
//

#import "Status.h"
#import "MJExtension.h"
#import "DateTools.h"

@implementation Status

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"createdAt":@"created_at",
             @"retweetedStatus":@"retweeted_status",
             @"repostsCount":@"reposts_count",
             @"attitudesCount":@"attitudes_count",
             @"commentsCount":@"comments_count"
             };
}
-(NSString*)createdAt{
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    format.dateFormat=@"EEE MMM dd HH:mm:ss z yyyy";
    NSDate *created_at=[format dateFromString:_createdAt];
    format.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"en-us"];
    if(created_at.timeIntervalSinceNow>-60){
        return @"刚刚";
    }else {
        return created_at.timeAgoSinceNow;
    }
   
}
-(void)setSource:(NSString *)source{
    long loc=[source rangeOfString:@">"].location;
    if(loc==NSNotFound){
        _source=source;
    }else{
        long locat=loc+1;
        long length=[source rangeOfString:@"</"].location-locat;
        source=[source substringWithRange:NSMakeRange(locat, length)];
        _source=[NSString stringWithFormat:@"来自 %@",source];
        
        
    }
    
}
@end
