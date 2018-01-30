//
//  SearchView.h
//  weibo
//
//  Created by user on 2018/1/18.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^cancelBlock)(void);
@interface SearchView : UIView<UITextFieldDelegate>
@property(nonatomic,copy)cancelBlock cancelBlock;
@property(nonatomic,strong)UIView *tFView;
@property(nonatomic,strong)UITextField *text;
@property(nonatomic,strong)UIButton *cancel;
@property (weak, nonatomic) IBOutlet UITextField *textfield;
- (IBAction)cancelClick:(id)sender;
@end
