//
//  ViewController.m
//  drawRect
//
//  Created by dengyonghao on 15/8/26.
//  Copyright (c) 2015年 dengyonghao. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"
#import "UIView+DrawCategory.h"
@interface ViewController ()

@property (nonatomic, strong) DrawView *drawView;
@property (nonatomic, strong) UIButton *bnt;
@property (nonatomic, strong) UIView *vi;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _bnt = [[UIButton alloc] initWithFrame:CGRectMake(45, 155, 90, 90)];
    _bnt.backgroundColor = [UIColor grayColor];
    UIButton *bnt2 = [[UIButton alloc] initWithFrame:CGRectMake(45, 255, 110, 90)];
    bnt2.backgroundColor = [UIColor grayColor];
    
    UIButton *bnt3 = [[UIButton alloc] initWithFrame:CGRectMake(45, 355, 90, 90)];
    bnt3.backgroundColor = [UIColor grayColor];


    [_bnt addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [bnt2 addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [bnt3 addTarget:self action:@selector(addButtonClick3:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:_bnt];
    [self.view addSubview:bnt2];
    [self.view addSubview:bnt3];

}

- (void)addButtonClick:(UIButton *)button
{
    [button drawFocus];
}

- (void)addButtonClick3:(UIButton *)button
{
    [button cancelFocus];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
