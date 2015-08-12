//
//  AdCell.h
//  CustomXibCell
//
//  Created by gaokunpeng on 15/7/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIPageControl *pageCtrl;

//显示数据
@property (nonatomic,strong)NSArray *dataArray;

@end
