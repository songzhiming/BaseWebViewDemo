//
//  TestXibAddBaseWebViewController.m
//  BaseWebViewDemo
//
//  Created by 宋志明 on 15/11/25.
//  Copyright © 2015年 宋志明. All rights reserved.
//


//测试  xib里面添加 basewebview
#import "TestXibAddBaseWebViewController.h"
#import "BaseWebView.h"

@interface TestXibAddBaseWebViewController ()
@property (weak, nonatomic) IBOutlet BaseWebView *baseWebView;

@end

@implementation TestXibAddBaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.baseWebView loadRequestWithUrl:@"https://www.baidu.com"];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
