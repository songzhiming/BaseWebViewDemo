//
//  TestWebViewController.m
//  BaseWebViewDemo
//
//  Created by 宋志明 on 15/11/19.
//  Copyright © 2015年 宋志明. All rights reserved.
//

#import "TestWebViewController.h"
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@interface TestWebViewController ()

@end

@implementation TestWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    webView = [[BaseWebView alloc]initWithFrame:CGRectMake(0, 70, kScreenWidth, kScreenHeight - 70)];
    [webView loadRequestWithUrl:@"https://www.baidu.com/"];
    [self.view addSubview:webView];
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(comeback)];
    UIBarButtonItem *closeBtn = [[UIBarButtonItem alloc]initWithTitle:@"close" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:backBtn,closeBtn, nil];
    // Do any additional setup after loading the view from its nib.
}

- (void)comeback
{
    if (![webView canGoBack]) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [webView gobackWithStep];
    }
}
- (void)close
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
