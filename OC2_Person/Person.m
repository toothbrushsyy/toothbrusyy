//
//  Person.m
//  OC2_Person
//
//  Created by Taurus on 15/7/16.
//  Copyright (c) 2015年 OC语言. All rights reserved.
//

#import "Person.h"

@implementation Person

//初始化方法
- (id)initWithName:(NSString *)name andAge:(NSInteger)age
{
    self = [super init];
    if (self) {//只有用父类的方法成功初始化后才初始化自定义的实例变量
        //        _name = name;
        //        _age = age;
        self->_name = name;
        self->_age = age;
    }
    return self;
}

- (NSString *)name
{
    return self->_name;
}

- (NSInteger)age
{
    return self->_age;
}

- (void)setName:(NSString *)name
{
    _name = name;
}

- (void)setAge:(NSInteger)age
{
    _age = age;
}

- (void)setName:(NSString *)name andAge:(NSInteger)age
{
    self->_name = name;
    _age = age;
}

//类方法
+ (void)testPerson
{
    Person *xiaoFei = [[self alloc] initWithName:@"小飞" andAge:20];
    //xiaoFei  对象指针变量  对象指针指向的内存块叫着对象
    // * 表示对象的引用
    
    NSLog(@"xiaoFei = %p", &xiaoFei);
    NSLog(@"xiaoFei = %p", xiaoFei);
    
    //self 指针在类方法里面代表调用该类方法的类
    
    NSLog(@"name = %@ , age = %ld", [xiaoFei name], [xiaoFei age]);
    //%@ : 打印一个对象 NSLog 打印字符串对象, 自动换行
    [xiaoFei setName:@"小飞飞" andAge:22];
    NSLog(@"name = %@ , age = %li", [xiaoFei name], [xiaoFei age]);
}

@end
