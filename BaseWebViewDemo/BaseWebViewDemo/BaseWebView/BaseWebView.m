//
//  BaseWebView.m
//  BaseWebViewDemo
//
//  Created by 宋志明 on 15/11/19.
//  Copyright © 2015年 宋志明. All rights reserved.
//

#import "BaseWebView.h"
#define IOS7 ([UIDevice currentDevice].systemVersion.doubleValue < 8.0)
static CGFloat const kProgressViewHeight = 2.0f;
@implementation BaseWebView

- (id)init
{
    if (self = [super init]) {
        [self setUpView];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setUpView];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpView];
    }
    return self;
}
- (void)awakeFromNib{
}

- (void)setUpView
{
    if (IOS7) {//ios7
        uiwebView = [[UIWebView alloc]init];
        self.njkWebViewProgress = [[NJKWebViewProgress alloc] init];
        uiwebView.delegate = self.njkWebViewProgress;
        self.njkWebViewProgress.webViewProxyDelegate = self;
        self.njkWebViewProgress.progressDelegate = self;
        [self addSubview:uiwebView];
    }else{//
        wkwebView = [[WKWebView alloc]init];
        wkwebView.allowsBackForwardNavigationGestures = YES;

        [self addSubview:wkwebView];
        wkwebView.navigationDelegate = self;
        [wkwebView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:NULL];
    }
    progressBar = [[UIProgressView alloc]init];
    [self addSubview:progressBar];
}


- (void)layoutSubviews{
    NSLog(@"======%@",self);
    progressBar.frame = CGRectMake(0, 0, self.frame.size.width, kProgressViewHeight);
    if (IOS7) {//ios7
        uiwebView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height );
    }else{//
        wkwebView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height );
    }
}


- (void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void*)context
{
    if([keyPath isEqualToString:@"estimatedProgress"]){
        progressBar.hidden = wkwebView.estimatedProgress == 1;
        [progressBar setProgress:wkwebView.estimatedProgress animated:YES];
    }
}
#pragma mark - NJKWebViewProgressDelegate
- (void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    progressBar.hidden = progress == 1;
    [progressBar setProgress:progress animated:YES];
}



- (void)loadRequestWithUrl:(NSString *)url
{
    if (IOS7) {
        [uiwebView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]]];
    }else{
        [wkwebView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]]];
    }
}
-(NSInteger)countOfHistory
{
    if(IOS7){
        int count = [[uiwebView stringByEvaluatingJavaScriptFromString:@"window.history.length"] intValue];
        if (count){
            return count;
        }else{
            return 1;
        }
    }else
    {
        return wkwebView.backForwardList.backList.count;
    }
}



-(void)gobackWithStep
{
    NSLog(@"count===%ld",(long)self.countOfHistory);
    
    if (IOS7) {
        
        //
        [uiwebView goBack];
        
//        
//        [uiwebView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"window.history.go(-%d)",self.countOfHistory - 1]];
    }else{
        [wkwebView goBack];
//        WKBackForwardListItem *backItem = wkwebView.backForwardList.backList[self.countOfHistory - 1];
//        [wkwebView goToBackForwardListItem:backItem];
    }
}


- (BOOL)canGoBack
{
    if (IOS7) {
        return [uiwebView canGoBack];
    }else{
        return [wkwebView canGoBack];
    }
}



#pragma mark - wkwebdelegate
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
    [progressBar setProgress:0.0 animated:NO];
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"didFailProvisionalNavigation");
}


- (void)dealloc
{
    if (IOS7) {
        
    }else{
        [wkwebView removeObserver:self forKeyPath:@"estimatedProgress"];
    }
}

@end
