//
//  ViewController.m
//  SearchBar
//
//  Created by zml on 15/11/25.
//  Copyright © 2015年 zml@lanmaq.com. All rights reserved.

//  https://github.com/Lanmaq/iOS_HelpOther_WorkSpace

#import "ViewController.h"
#import "MLSearchBar.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MLSearchBar *searchBar = [[MLSearchBar alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 300, self.view.frame.size.width, 44) boardColor:[UIColor lightGrayColor] placeholderString:nil];
   // searchBar.boardLineWidth = 3.0;
    [self.view addSubview:searchBar];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
