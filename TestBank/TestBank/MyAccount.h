//
//  MyAccount.h
//  TestBank
//
//  Created by Taurus on 15/8/7.
//  Copyright (c) 2015年 宋永勇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyAccount : NSObject

//初始化方法
/*
 @param name:账户名字
 @param moeny:余额
 */
- (instancetype)initWithAccountName:(NSString *)name money:(float)money;

//取钱
- (void)withdraw:(float)money;

@end
