//
//  ViewController.m
//  TestBank
//
//  Created by Taurus on 15/8/7.
//  Copyright (c) 2015年 宋永勇. All rights reserved.
//

#import "ViewController.h"
#import "MyAccount.h"

@interface ViewController ()
{
    //账户
    MyAccount *_account;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //账户
    _account = [[MyAccount alloc]initWithAccountName:@"马云" money:20000000];
    
    //创建两个取钱的线程
    NSThread *t1 = [[NSThread alloc]initWithTarget:self selector:@selector(threadOne) object:nil];
    t1.name = @"萌汪";
    [t1 start];
    
    NSThread *t2 = [[NSThread alloc]initWithTarget:self selector:@selector(threadTwo) object:nil];
    t2.name = @"破喵";
    [t2 start];
}

- (void)threadOne
{
    [_account withdraw:15000000];
}

- (void)threadTwo
{
    [_account withdraw:15000000];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
