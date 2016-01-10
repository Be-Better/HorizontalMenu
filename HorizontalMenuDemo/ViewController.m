//
//  ViewController.m
//  HorizontalMenuDemo
//
//  Created by chen on 16/1/9.
//  Copyright © 2016年 chen. All rights reserved.
//

#import "ViewController.h"
#import "HorizontalMenuView.h"

@interface ViewController ()<HorizontalMenuDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    HorizontalMenuView * menuView = [[HorizontalMenuView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 45)];
    menuView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:menuView];
    [menuView setNameWithArray:@[@"最新", @"推荐", @"全部"]];
    menuView.delegate = self;
}

- (void)getTag:(NSInteger)tag {
    NSLog(@"%ld", tag);
}

@end
