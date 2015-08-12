//
//  ViewController.m
//  UI1_UITouch
//
//  Created by qianfeng on 15/7/9.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
@interface ViewController ()
{
    UIView *_touchView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _touchView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    _touchView.backgroundColor = [UIColor redColor];
    //打开用户交互使能
    _touchView.userInteractionEnabled = YES;
    [self.view addSubview:_touchView];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"开始触摸");
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"开始移动");
    //获取一个触摸点
    UITouch *touch = [touches anyObject];
    //获取触摸点在view中的坐标
    CGPoint point = [touch locationInView:self.view];
    _touchView.center = point;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸结束");
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸取消");
}


- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"开始摇动");
    SystemSoundID soundID;
    //创建soundID
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"音效"ofType:@"caf"]],&soundID);
    //播放soundID
    AudioServicesPlaySystemSound(soundID);
    //伴随震动
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    //伴随动画
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = self.view.frame;
        frame.origin.x+=100;
        self.view.frame = frame;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = self.view.frame;
            frame.origin.x-=200;
            self.view.frame = frame;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3 animations:^{
                CGRect frame = self.view.frame;
                frame.origin.x+=100;
                self.view.frame =frame;
            }];
        }];
    }];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"摇动结束");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
