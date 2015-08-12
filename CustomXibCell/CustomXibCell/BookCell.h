//
//  BookCell.h
//  CustomXibCell
//
//  Created by gaokunpeng on 15/7/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookModel.h"
/*
 xib控件关联头文件
 选中xib文件里面的控件，按住ctrl功能键，将控件移动到cell的头文件@interface和@end中间，弹出对话框里面填上属性的名字，最后点击connect按钮即可
 */

/*
 取消xib文件和cell的头文件的关联
 先删除cell的头文件里面关联的属性,然后进入xib文件，选中对应的控件,右击会显示cell头文件和xib控件的关联直线，点击中间的叉好就可以了
 */
@interface BookCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bookImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

//显示数据
- (void)configModel:(BookModel *)model;


@end
