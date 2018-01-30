//
//  LoopView.m
//  weibo
//
//  Created by user on 2018/1/16.
//  Copyright © 2018年 user. All rights reserved.
//

#import "LoopView.h"

@implementation LoopView
-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        [self setUpSubviews];
        
    }
    return self;
}
-(UICollectionView*)collection{
    if(!_collection){
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
        layout.itemSize=CGSizeMake(self.frame.size.width, self.frame.size.height);
        layout.minimumLineSpacing=0;
        layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        UICollectionView *collection=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:layout];
        collection.pagingEnabled=YES;
        collection.dataSource=self;
        collection.delegate=self;
        [collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CELL"];
        [self addSubview:collection];
        self.collection=collection;
        self.collection.backgroundColor=[UIColor clearColor];
        //[self.collection scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:50] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    }
    return _collection;
}
-(void)setUpSubviews{
    UIPageControl *page=[[UIPageControl alloc]initWithFrame:CGRectMake(self.frame.size.width-50, self.frame.size.height-15, 50, 10)];
    page.numberOfPages=3;
    page.pageIndicatorTintColor=[UIColor grayColor];
    page.currentPageIndicatorTintColor=[UIColor redColor];
    page.currentPage=0;
    self.page=page;
    [self.collection reloadData];
    [self addSubview:self.page];
    
}
-(void)addTimer{
    NSTimer *timer=[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    self.timer=timer;
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
-(void)removeTimer{
    [self.timer invalidate];
    self.timer=nil;
}
-(void)nextPage{
    NSIndexPath *current=[[self.collection indexPathsForVisibleItems] lastObject];
    NSIndexPath *currentReset=[NSIndexPath indexPathForItem:current.item inSection:50];
    [self.collection scrollToItemAtIndexPath:currentReset atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    NSInteger nextItem=currentReset.item+1;
    NSInteger nextsection=currentReset.section;
    if(nextItem==3){
        nextItem=0;
        nextsection++;
    }
    NSIndexPath *nextIndexPath=[NSIndexPath indexPathForItem:nextItem inSection:nextsection];
    [self.collection scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
}
#pragma mark --uicollectionviewdatasource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 100;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    UIImageView *imageV=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [imageV setImage:[UIImage imageNamed:@"square_ad"]];
    [imageV setContentMode:UIViewContentModeScaleToFill];
    [cell.contentView addSubview:imageV];
    return cell;
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self removeTimer];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self addTimer];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int currentpage=(int)(scrollView.contentOffset.x/self.frame.size.width+0.5)%3;
    self.page.currentPage=currentpage;
    
}
@end
