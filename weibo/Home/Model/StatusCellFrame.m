//
//  StatusCellFrame.m
//  weibo
//
//  Created by user on 2018/1/25.
//  Copyright © 2018年 user. All rights reserved.
//

#import "StatusCellFrame.h"
#import "HeadIconView.h"
#import "Status.h"
#import "User.h"
@implementation StatusCellFrame
-(void)setStatus:(Status *)status{
    _status=status;
    CGFloat topViewX=0;
    CGFloat topViewY=0;
    CGFloat cellW=[UIScreen mainScreen].bounds.size.width;
    CGFloat padding=10;
    //头像
    CGFloat headIconX=padding;
    CGFloat headIconY=padding;
    CGSize  headIconSize=[HeadIconView headIconSizeWithHeadIconType:HeadIconTypeSmall];
    _headIconFrame=CGRectMake(headIconX, headIconY, headIconSize.width, headIconSize.height);
    //昵称
    CGFloat nameLabelX=CGRectGetMaxX(_headIconFrame)+padding;
    CGFloat nameLabelY=headIconY;
    CGSize nameLabelSize=[status.user.screenName sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    _screenNameFrame=CGRectMake(nameLabelX, nameLabelY, nameLabelSize.width, nameLabelSize.height);
    //会员图标
    if(status.user.isVip){
    CGFloat mbIconX=CGRectGetMaxX(_screenNameFrame)+padding;
    CGFloat mbIconY=nameLabelSize.height-14;;
    CGFloat mbIconW=14;
    CGFloat mbIconH=14;
    _mbIconFrame=CGRectMake(mbIconX, mbIconY, mbIconW, mbIconH);
    }
    //时间
    CGFloat timeX=nameLabelX;
    CGFloat timeY=CGRectGetMaxY(_screenNameFrame)+5;
    CGSize timeSize=[status.createdAt sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:8]}];
    _timeLabelframe=CGRectMake(timeX, timeY, timeSize.width, timeSize.height);
    //微博来源
    CGFloat sourceX=CGRectGetMaxX(_timeLabelframe)+5;
    CGFloat sourceY=CGRectGetMaxY(_screenNameFrame)+5;
    CGSize sourceSize=[status.source sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:8]}];
    _sourceLabelframe=CGRectMake(sourceX, sourceY, sourceSize.width, sourceSize.height);
    //正文
    CGFloat textX=headIconX;
    CGFloat textY=MAX(CGRectGetMaxY(_headIconFrame), CGRectGetMaxY(_sourceLabelframe))+padding;
    CGSize textSize=[status.text boundingRectWithSize:CGSizeMake(cellW-2*padding, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
    _textLabelFrame=CGRectMake(textX, textY, textSize.width, textSize.height);
    //配图
    if(status.picUrls.count){
        CGFloat imageX=textX;
        CGFloat imageY=CGRectGetMaxY(_textLabelFrame)+padding;
        CGSize imageSize=
    }
}
@end
