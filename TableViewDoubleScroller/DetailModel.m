//
//  DetailModel.m
//  TableViewDoubleScroller
//
//  Created by zml on 15/11/23.
//  Copyright © 2015年 zml@lanmaq.com. All rights reserved.
//

#import "DetailModel.h"
@interface DetailModel()
{
    UIImage  *_headImage;
    NSString *_name;
    NSString *_detail;
}
@end
@implementation DetailModel

-  (instancetype)initHeadImage:(UIImage *)image name:(NSString *)name detail:(NSString *)detail
{
    if (self = [super init]) {
        _headImage = image;
        _name          = name;
        _detail          = detail;
    }
    return self;
}
@end
