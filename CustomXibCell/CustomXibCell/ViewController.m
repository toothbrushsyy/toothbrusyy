//
//  ViewController.m
//  CustomXibCell
//
//  Created by gaokunpeng on 15/7/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ViewController.h"
#import "BookModel.h"
#import "BookCell.h"
#import "AdModel.h"
#import "AdCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    //书籍列表
    NSArray *_bookArray;
    //广告数据
    NSMutableArray *_adArray;
    
    //表格
    UITableView *_tbView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //数据列表数据
    [self createBookData];
    
    //广告数据
    [self createAdvertisementData];
    
    //表格
    [self createTableView];
    
    
}

//创建广告的数据源
- (void)createAdvertisementData
{
    _adArray = [NSMutableArray array];
    for (int i=0; i<4; i++) {
        //广告的模型对象
        AdModel *model = [[AdModel alloc] init];
        model.imageName = [NSString stringWithFormat:@"image%d",i];
        model.title = [NSString stringWithFormat:@"第%d个标题",i];
        
        [_adArray addObject:model];
    }
    
}

//创建表格视图
- (void)createTableView
{
    //设置属性，让tableView不会改变四周距离
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //表格
    _tbView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 375, 667-64) style:UITableViewStylePlain];
    _tbView.delegate = self;
    _tbView.dataSource = self;
    
    [self.view addSubview:_tbView];
    
}

//书籍列表的数据
- (void)createBookData
{
    //文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"bookData" ofType:@"plist"];
    
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    //字典数据转化成模型对象
    NSMutableArray *modelArray = [NSMutableArray array];
    for (NSDictionary *bookDict in array) {
        //创建模型对象
        BookModel *model = [[BookModel alloc] init];
        [model setValuesForKeysWithDictionary:bookDict];
        [modelArray addObject:model];
    }
    _bookArray = [NSArray arrayWithArray:modelArray];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView代理
//返回多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _bookArray.count+1;
}

//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        //广告
        return 160;
    }
    return 80;
}

//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        //广告
        static NSString *cellId = @"adCellId";

        AdCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (nil == cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"AdCell" owner:nil options:nil] lastObject];
        }
        //显示数据
        cell.dataArray = _adArray;
        return cell;
        
    }else{
        //书籍
        static NSString *bookCellId = @"bookCellId";
        
        BookCell *cell = [tableView dequeueReusableCellWithIdentifier:bookCellId];
        if (nil == cell) {
            /*
             第一个参数:xib文件的名字
             第二个参数:cell的所有者(可以传self，也可以传nil)
             第三个参数:cell初始化的时候传递的附加参数(一般传nil)
             */
            NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"BookCell" owner:nil options:nil];
            cell = [array lastObject];
            //
            //
            //        NSArray *array1 = @[@"1",@"2",@"3"];
            //        [array1 lastObject];
            
        }
        //显示数据
        BookModel *model = _bookArray[indexPath.row-1];
        [cell configModel:model];
        
        //修改选中状态
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
        
    }
    
    return nil;
}




@end
