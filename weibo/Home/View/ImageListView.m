//
//  ImageListView.m
//  weibo
//
//  Created by user on 2018/1/30.
//  Copyright © 2018年 user. All rights reserved.
//

#import "ImageListView.h"
#import "ImageItemView.h"
#import "MJPhoto.h"
#import "MJPhotoBrowser.h"
#import "GLPhoto.h"
#define PhotosMaxColumns(count) (count==4?2:3)
@implementation ImageListView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        self.userInteractionEnabled=YES;
        
    }
    return self;
}
-(void)setPhotos:(NSArray *)photos{
    _photos=photos;
    while (self.subviews.count<photos.count) {
        ImageItemView *itemView=[[ImageItemView alloc]init];
        itemView.tag=self.subviews.count;
        [itemView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTap:)]];
        [self addSubview:itemView];
    }
    for(int i=0;i<self.subviews.count;i++){
        ImageItemView *item=self.subviews[i];
        if(i<photos.count){
            item.hidden=NO;
            item.photo=photos[i];
        }else{
            item.hidden=YES;
        }
    }
    
}
-(void)imageTap:(UITapGestureRecognizer*)recognizer{
    NSUInteger count=self.photos.count;
    NSMutableArray *photos=[NSMutableArray arrayWithCapacity:count];
    for(int i=0;i<count;i++){
    MJPhoto *mjphoto=[[MJPhoto alloc]init];
    mjphoto.srcImageView=self.subviews[i];
        GLPhoto *photo=self.photos[i];
        mjphoto.url=[NSURL URLWithString:[photo.thumbnail_pic stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"]];
        [photos addObject:mjphoto];
        
    }
    MJPhotoBrowser *browser=[[MJPhotoBrowser alloc]init];
    browser.currentPhotoIndex=recognizer.view.tag;
    browser.photos=photos;
    [browser show];
}
+(CGSize)sizeWithCount:(int)count{
    // 最大的列数
    if (count == 1) {
        return CGSizeMake(140, 140);
    }
    
    int maxColumns = PhotosMaxColumns(count);
    
    // 列数
    int cols = count >= maxColumns ? maxColumns : count;
   CGFloat  w=([UIScreen mainScreen].bounds.size.width-2*10-2*5)/3;
    CGFloat W = (cols - 1) * 5 + cols * w;
    
    //  行数
    int rows = 0;
    
    if (count % maxColumns == 0) { // 3/6/9
        rows = count / maxColumns;
    }else { // 1/2/4/5/7/8
        rows = count / maxColumns + 1;
    }
    CGFloat H = (rows - 1) * 5 + rows * w;
    
    return CGSizeMake(W, H);
    
}
-(void)layoutSubviews{
    int maxColumns = PhotosMaxColumns(self.photos.count);
    
    CGFloat W = 0;
    CGFloat H = 0;
    CGFloat  w=([UIScreen mainScreen].bounds.size.width-2*10-2*5)/3;
    for (int i = 0; i < self.subviews.count; i++) {
        
       ImageItemView *imageView = self.subviews[i];
        
        W = self.photos.count > 1 ? w : 140;
        H = self.photos.count > 1 ? w : 140;
        
        int col = i % maxColumns;
        int row = i / maxColumns;
        CGFloat X = col * (w + 5);
        CGFloat Y = row * (w + 5);
        
        imageView.frame = CGRectMake(X, Y, W, H);
    }
    
}
@end
