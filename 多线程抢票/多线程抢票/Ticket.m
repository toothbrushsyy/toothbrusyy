//
//  Ticket.m
//  多线程抢票
//
//  Created by Taurus on 15/8/12.
//  Copyright (c) 2015年 宋永勇. All rights reserved.
//

#import "Ticket.h"

@implementation Ticket

+ (instancetype)shareTicket
{
    static Ticket *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        if (nil == instance)
        {
            instance = [[Ticket alloc]init];
        }
    });
    return instance;
}

@end
