//
//  MyAccount.m
//  TestBank
//
//  Created by Taurus on 15/8/7.
//  Copyright (c) 2015年 宋永勇. All rights reserved.
//

#import "MyAccount.h"

@implementation MyAccount
{
    //名字
    NSString *_name;
    //余额
    float _money;
}

- (instancetype)initWithAccountName:(NSString *)name money:(float)money
{
    if (self = [super init])
    {
        _name = name;
        _money = money;
    }
    return self;
}

- (void)withdraw:(float)money
{
    //加锁
    @synchronized(self)
    {
        if (_money >= money)
        {
            //取钱
            
            //线程睡眠
            [NSThread sleepForTimeInterval:0.01];
            
            _money -= money;
            NSLog(@"%@取了%0.2f",[NSThread currentThread].name,money);
        }
        else
        {
            NSLog(@"余额不足");
        }
    }
}

@end
