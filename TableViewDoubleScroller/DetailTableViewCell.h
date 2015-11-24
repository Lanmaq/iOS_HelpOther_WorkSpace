//
//  DetailTableViewCell.h
//  TableViewDoubleScroller
//
//  Created by zml on 15/11/23.
//  Copyright © 2015年 zml@lanmaq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailModel.h"

@interface DetailTableViewCell : UITableViewCell

- (void)configure:(DetailModel *)detailModel;

@end
