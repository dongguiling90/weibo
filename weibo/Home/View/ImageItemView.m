//
//  ImageItemView.m
//  weibo
//
//  Created by user on 2018/1/30.
//  Copyright © 2018年 user. All rights reserved.
//

#import "ImageItemView.h"
#import "GLPhoto.h"
#import "UIImageView+WebCache.h"
@implementation ImageItemView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        self.userInteractionEnabled=YES;
        UIImageView *gifView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"timeline_image_gif"]];
        [self addSubview:gifView];
        self.gifView=gifView;
        self.contentMode=UIViewContentModeScaleAspectFill;
        self.clipsToBounds=YES;
}
    return self;
}
-(void)setPhoto:(GLPhoto *)photo{
    [self sd_setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    self.gifView.hidden=![photo.thumbnail_pic.lowercaseString hasSuffix:@"gif"];
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    for(int i=0;i<self.subviews.count;i++){
        UIImageView *gifView=self.subviews[i];
        gifView.layer.anchorPoint=CGPointMake(1, 1);
        gifView.layer.position=CGPointMake(self.frame.size.width, self.frame.size.height);
    }
}

@end
