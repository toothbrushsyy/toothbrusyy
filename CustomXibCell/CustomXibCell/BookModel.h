//
//  BookModel.h
//  CustomXibCell
//
//  Created by gaokunpeng on 15/7/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookModel : NSObject

//标题
@property (nonatomic,copy)NSString *title;
//描述
@property (nonatomic,copy)NSString *detail;
//图片
@property (nonatomic,copy)NSString *icon;
//价格
@property (nonatomic,copy)NSString *price;



@end
