//
//  MLSearchBar.h
//  SearchBar
//
//  Created by zml on 15/11/25.
//  Copyright © 2015年 zml@lanmaq.com. All rights reserved.
//  https://github.com/Lanmaq/iOS_HelpOther_WorkSpace

#import <UIKit/UIKit.h>

@interface MLSearchBar : UISearchBar

//defulat #06c1ae
@property (nonatomic,strong) UIColor* boardColor;

//defuat lanmaq searchbar
@property (nonatomic,copy)    NSString *placeholderString;

//default 1.0 max 5.0 min 1.0
@property (nonatomic,assign) CGFloat boardLineWidth;

// use defulat set color nil , placehoderString nil
- (instancetype) initWithFrame:(CGRect)frame boardColor:(UIColor *)color placeholderString:(NSString *)placehoderString;

@end
