//
//  AdCell.m
//  CustomXibCell
//
//  Created by gaokunpeng on 15/7/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "AdCell.h"
#import "AdModel.h"

@interface AdCell ()<UIScrollViewDelegate>

@end

@implementation AdCell

-(void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    
    //显示图片和文字
    for (int i=0; i<dataArray.count; i++) {
        //获取模型对象
        AdModel *model = dataArray[i];
        
        //图片
        CGRect frame = CGRectMake(375*i, 0, 375, 160);
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.image = [UIImage imageNamed:model.imageName];
        [self.myScrollView addSubview:imageView];
    }
    //设置滚动范围
    self.myScrollView.contentSize = CGSizeMake(375*dataArray.count, 160);
    
    //背景视图
    self.bgView.backgroundColor = [UIColor grayColor];
    self.bgView.alpha = 0.5;
    
    //显示第一个标题
    if (dataArray.count > 0) {
        AdModel *model = dataArray[0];
        self.titleLabel.text = model.title;
        self.titleLabel.textColor = [UIColor whiteColor];
    }
    
    //pageCtrl
    self.pageCtrl.numberOfPages = dataArray.count;
    self.pageCtrl.currentPage = 0;
    
    //设置滚动视图的代理
    self.myScrollView.delegate = self;
    //按滚动视图的宽度滚动
    self.myScrollView.pagingEnabled = YES;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - UIScrollView代理
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //获取当前在第几页
    NSInteger index = scrollView.contentOffset.x/scrollView.bounds.size.width;
    
    //修改文字
    if (self.dataArray.count > index) {
        AdModel *model = self.dataArray[index];
        self.titleLabel.text = model.title;
    }
    
    //pageCtrl
    self.pageCtrl.currentPage = index;
    
}

@end
