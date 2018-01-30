//
//  LoopView.h
//  weibo
//
//  Created by user on 2018/1/16.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoopView : UIView<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate>
@property(nonatomic,strong)UICollectionView *collection;
@property(nonatomic,strong)UIPageControl *page;
@property(nonatomic,strong)NSTimer *timer;

@end
