//
//  HomeViewController.m
//  BaseWebViewDemo
//
//  Created by 宋志明 on 15/9/21.
//  Copyright (c) 2015年 宋志明. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screenBounds=[UIScreen mainScreen].bounds;
    webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 64, screenBounds.size.width, screenBounds.size.height-64)];
    //    [webView initWithFrame:CGRectMake(0, 70, screenBounds.size.width, screenBounds.size.height-70)];
    [self.view addSubview:webView];
    webView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *topLayout = [NSLayoutConstraint
                                     constraintWithItem:webView
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                     attribute:NSLayoutAttributeTop
                                     multiplier:1.0
                                     constant:0];
    NSLayoutConstraint *buttomLayout = [NSLayoutConstraint
                                        constraintWithItem:webView
                                        attribute:NSLayoutAttributeBottom
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                        attribute:NSLayoutAttributeBottom
                                        multiplier:1.0
                                        constant:0];
    NSLayoutConstraint *leftLayout = [NSLayoutConstraint
                                      constraintWithItem:webView
                                      attribute:NSLayoutAttributeLeading
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:self.view
                                      attribute:NSLayoutAttributeLeading
                                      multiplier:1.0
                                      constant:0];
    NSLayoutConstraint *rightLayout = [NSLayoutConstraint
                                       constraintWithItem:webView
                                       attribute:NSLayoutAttributeTrailing
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.view
                                       attribute:NSLayoutAttributeTrailing
                                       multiplier:1.0
                                       constant:0];
    [self.view addConstraints:[NSArray arrayWithObjects:topLayout,buttomLayout,leftLayout,rightLayout, nil]];
    
    [webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:NULL];
    NSURL *url = [[NSURL alloc]initWithString:@"https://www.baidu.com/"];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    //    webView.backgroundColor = [UIColor redColor];
    NSLog(@"6666%@",self.view.subviews);
    // Do any additional setup after loading the view from its nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void*)context
{
    if([keyPath isEqualToString:@"estimatedProgress"]){
        homeProgressView.hidden = webView.estimatedProgress == 1;
        NSLog(@"webView===%f",webView.estimatedProgress);
        [homeProgressView setProgress:webView.estimatedProgress animated:YES];
    }
}







// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@"didStartProvisionalNavigation");
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    NSLog(@"didCommitNavigation");
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"didFinishNavigation");
    [homeProgressView setProgress:0.0 animated:NO];
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"didFailProvisionalNavigation");
}


- (void)dealloc{
    [webView removeObserver:self forKeyPath:@"estimatedProgress"];
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
