//
//  SearchBar.h
//  weibo
//
//  Created by user on 2018/1/16.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^searchBarEditingBlock)(void);
@interface SearchBar : UITextField<UITextFieldDelegate>
@property(nonatomic,copy)searchBarEditingBlock editBlock;
@end
