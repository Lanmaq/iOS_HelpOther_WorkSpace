//
//  DetailModel.h
//  TableViewDoubleScroller
//
//  Created by zml on 15/11/23.
//  Copyright © 2015年 zml@lanmaq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DetailModel : NSObject

@property (nonatomic,strong) UIImage  *headImage;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *detail;

- (instancetype)initHeadImage:(UIImage *)image name:(NSString *)name detail:(NSString *)detail;

@end
