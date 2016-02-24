//
//  DetailTableViewCell.m
//  TableViewDoubleScroller
//
//  Created by zml on 15/11/23.
//  Copyright © 2015年 zml@lanmaq.com. All rights reserved.
//

#import "DetailTableViewCell.h"
@interface DetailTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation DetailTableViewCell

- (void)configure:(DetailModel *)detailModel
{
    _headImageView.image = detailModel.headImage;
    _nameLabel.text             = detailModel.name;
    _detailLabel.text              = detailModel.detail;
}

@end
