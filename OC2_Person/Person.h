//
//  Person.h
//  OC2_Person
//
//  Created by Taurus on 15/7/16.
//  Copyright (c) 2015年 OC语言. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *_name;
    NSInteger _age;
}
//初始化方法
- (id)initWithName:(NSString *)name andAge:(NSInteger)age;
//getter方法
- (NSString *)name;
- (NSInteger)age;
//setter方法
- (void)setName:(NSString *)name;
- (void)setAge:(NSInteger)age;
- (void)setName:(NSString *)name andAge:(NSInteger)age;
//类方法
+ (void)testPerson;

@end
