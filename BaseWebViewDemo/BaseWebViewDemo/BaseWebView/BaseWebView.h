//
//  BaseWebView.h
//  BaseWebViewDemo
//
//  Created by 宋志明 on 15/11/19.
//  Copyright © 2015年 宋志明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

#import "NJKWebViewProgress.h"

@interface BaseWebView : UIView<UIWebViewDelegate,WKNavigationDelegate,NJKWebViewProgressDelegate>
{
    UIProgressView *progressBar;
    UIWebView *uiwebView;
    WKWebView *wkwebView;
    
}
//UIwebview的 进度条
@property (nonatomic, strong) NJKWebViewProgress *njkWebViewProgress;
- (void)loadRequestWithUrl:(NSString *)url;
- (BOOL)canGoBack;
///back 层数
- (NSInteger)countOfHistory;
- (void)gobackWithStep;
@end
