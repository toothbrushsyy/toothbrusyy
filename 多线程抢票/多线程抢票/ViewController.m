//
//  ViewController.m
//  多线程抢票
//
//  Created by Taurus on 15/8/12.
//  Copyright (c) 2015年 宋永勇. All rights reserved.
//

#import "ViewController.h"
#import "Ticket.h"

@interface ViewController ()
{
    dispatch_queue_t globalQueue;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Ticket shareTicket].tickets = 100;
    globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    [self createUI];
}

- (void)createUI
{
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 30, 175, 50)];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.text = @"剩余票数";
    self.titleLabel.font = [UIFont systemFontOfSize:28];
    self.titleLabel.textColor = [UIColor blackColor];
    [self.view addSubview:self.titleLabel];
    
    self.numLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 80, 75, 120)];
    self.numLabel.textAlignment = NSTextAlignmentCenter;
    self.numLabel.text = [NSString stringWithFormat:@"%ld",[Ticket shareTicket].tickets];
    self.numLabel.textColor = [UIColor blackColor];
    self.numLabel.font = [UIFont systemFontOfSize:45];
    [self.view addSubview:self.numLabel];
    
    self.label1 = [[UILabel alloc]initWithFrame:CGRectMake(260, 250, 47, 30)];
    self.label1.textAlignment = NSTextAlignmentCenter;
    self.label1.text = [NSString stringWithFormat:@"%ld",self.label1Num];
    self.label1.textColor = [UIColor blackColor];
    self.label1.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:self.label1];
    
    self.label2 = [[UILabel alloc]initWithFrame:CGRectMake(260, 300, 47, 30)];
    self.label2.textAlignment = NSTextAlignmentCenter;
    self.label2.text = [NSString stringWithFormat:@"%ld",self.label2Num];
    self.label2.textColor = [UIColor blackColor];
    self.label2.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:self.label2];
    
    self.label3 = [[UILabel alloc]initWithFrame:CGRectMake(260, 350, 47, 30)];
    self.label3.textAlignment = NSTextAlignmentCenter;
    self.label3.text = [NSString stringWithFormat:@"%ld",self.label3Num];
    self.label3.textColor = [UIColor blackColor];
    self.label3.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:self.label3];
    
    
    self.btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn1.frame = CGRectMake(40, 250, 200, 30);
    [self.btn1 setTitle:@"孙悟空:俺老孙来帮你抢票了" forState:UIControlStateNormal];
    [self.btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.btn1 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.btn1.tag = 100;
    [self.view addSubview:self.btn1];
    
    self.btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn2.frame = CGRectMake(40, 300, 200, 30);
    [self.btn2 setTitle:@"杨二郎:看票能逃哪里去" forState:UIControlStateNormal];
    [self.btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.btn2 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.btn2.tag = 101;
    [self.view addSubview:self.btn2];
    
    self.btn3 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn3.frame = CGRectMake(40, 350, 200, 30);
    [self.btn3 setTitle:@"哪吒:有谁能快过我的风火轮" forState:UIControlStateNormal];
    [self.btn3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.btn3 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.btn3.tag = 102;
    [self.view addSubview:self.btn3];
    
    self.btn4 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn4.frame = CGRectMake(90, 440, 200, 30);
    [self.btn4 setTitle:@"玉皇大帝:都休息会吧" forState:UIControlStateNormal];
    [self.btn4 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.btn4 addTarget:self action:@selector(stopClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn4];
    
    self.btn5 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn5.frame = CGRectMake(60, 500, 250, 30);
    [self.btn5 setTitle:@"玉皇大帝:休息够了吧,那就开工吧" forState:UIControlStateNormal];
    [self.btn5 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.btn5 addTarget:self action:@selector(starClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn5];

}

- (void)createAThreadWithName:(NSString *)name
{
    dispatch_async(globalQueue, ^{
        [self snatchStampWithName:name];
    });
}

- (void)snatchStampWithName:name
{
    while (YES)
    {
        if (self.isCancel)
        {
            [[NSThread currentThread] cancel];
            break;
        }
        @synchronized(self)
        {
            if ([Ticket shareTicket].tickets > 0)
            {
                [Ticket shareTicket].tickets --;
                dispatch_sync(dispatch_get_main_queue(), ^{
                    if ([name isEqualToString:@"孙悟空:俺老孙来帮你抢票了"])
                    {
                        self.label1Num += 1;
                        self.label1.text = [NSString stringWithFormat:@"%ld",self.label1Num];
                    }
                    else if ([name isEqualToString:@"杨二郎:看票能逃哪里去"])
                    {
                        self.label2Num += 1;
                        self.label2.text = [NSString stringWithFormat:@"%ld",self.label2Num];
                    }
                    else if ([name isEqualToString:@"哪吒:有谁能快过我的风火轮"])
                    {
                        self.label3Num += 1;
                        self.label3.text = [NSString stringWithFormat:@"%ld",self.label3Num];
                    }
                    self.numLabel.text = [NSString stringWithFormat:@"%ld",[Ticket shareTicket].tickets];
                });
            }
            else
            {
                break;
            }
            [NSThread sleepForTimeInterval:0.1];
        }
    }
}

- (void)btnClicked:(UIButton *)btn
{
    self.isCancel = NO;
    btn.enabled = NO;
    if (btn.tag == 100)
    {
        [self createAThreadWithName:@"孙悟空:俺老孙来帮你抢票了"];
    }
    if (btn.tag == 101)
    {
        [self createAThreadWithName:@"杨二郎:看票能逃哪里去"];
    }
    if (btn.tag == 102)
    {
        [self createAThreadWithName:@"哪吒:有谁能快过我的风火轮"];
    }
}

- (void)starClicked
{
    self.isCancel = NO;
    if (!self.btn1.enabled)
    {
        [self createAThreadWithName:@"孙悟空:俺老孙来帮你抢票了"];
    }
    if (!self.btn2.enabled)
    {
        [self createAThreadWithName:@"杨二郎:看票能逃哪里去"];
    }
    if (!self.btn3.enabled)
    {
        [self createAThreadWithName:@"哪吒:有谁能快过我的风火轮"];
    }
}

- (void)stopClicked
{
    self.isCancel = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
