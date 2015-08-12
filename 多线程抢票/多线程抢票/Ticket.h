//
//  Ticket.h
//  多线程抢票
//
//  Created by Taurus on 15/8/12.
//  Copyright (c) 2015年 宋永勇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ticket : NSObject
@property(nonatomic,assign)NSInteger tickets;

+ (instancetype)shareTicket;
@end
