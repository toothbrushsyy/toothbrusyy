//
//  BookCell.m
//  CustomXibCell
//
//  Created by gaokunpeng on 15/7/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "BookCell.h"

@implementation BookCell

-(void)configModel:(BookModel *)model
{
    //图片
    self.bookImageView.image = [UIImage imageNamed:model.icon];
    //标题
    
    self.titleLabel.text = model.title;
    //价格
    self.priceLabel.text = model.price;
    //描述
    self.descLabel.text = model.detail;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
