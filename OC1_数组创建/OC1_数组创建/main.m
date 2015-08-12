//
//  main.m
//  OC1_数组创建
//
//  Created by qianfeng on 15/7/17.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
//NSArray
//创建不可变数组对象
//NSMutableArray
//创建可变数组对象

//数组中的元素都是对象可以为任意类型的对象
//数组中存储的是对象的引用(对象的地址)

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //xcode4.0
        NSArray *array1 = @[@"one", @"two", @"three"];
        NSLog(@"array1 = %@", array1);
        
        //构造方法
        //用给定对象创建数组对象
        NSArray *array2 = [[NSArray alloc] initWithObjects:@"helloworld",[NSNumber numberWithInt:123],[NSDate date], [NSNumber numberWithFloat:3.14], nil];
        NSLog(@"array2 = %@", array2);
        
        //用其它数组创建数组对象
        NSArray *array3 = [[NSArray alloc] initWithArray:array1];
        NSLog(@"array3 = %@", array3);
        
        //NSArray *array4 = [[NSArray alloc] initWithArray:array2 copyItems:YES];//retain copy
        
        //类方法
        //创建一个空的数组对象
        NSArray *array5 = [NSArray array];
        NSLog(@"array5 = %@", array5);
        
        NSArray *array6 = [NSArray arrayWithObjects:@"one",@"two",@"three", nil];
        NSLog(@"array6 = %@", array6);
        
        NSArray *array7 = [NSArray arrayWithArray:array6];
        NSLog(@"array7 = %@", array7);
        
    }
    return 0;
}
