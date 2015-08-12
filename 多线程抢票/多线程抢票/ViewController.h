//
//  ViewController.h
//  多线程抢票
//
//  Created by Taurus on 15/8/12.
//  Copyright (c) 2015年 宋永勇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic,strong) UILabel *titleLabel;
@property(nonatomic,strong) UILabel *numLabel;
@property(nonatomic,strong) UILabel *label1;
@property(nonatomic,strong) UILabel *label2;
@property(nonatomic,strong) UILabel *label3;

@property(nonatomic,assign) NSInteger label1Num;
@property(nonatomic,assign) NSInteger label2Num;
@property(nonatomic,assign) NSInteger label3Num;

@property(nonatomic,strong) UIButton *btn1;
@property(nonatomic,strong) UIButton *btn2;
@property(nonatomic,strong) UIButton *btn3;
@property(nonatomic,strong) UIButton *btn4;
@property(nonatomic,strong) UIButton *btn5;

@property(nonatomic,assign) BOOL isCancel;

@end

