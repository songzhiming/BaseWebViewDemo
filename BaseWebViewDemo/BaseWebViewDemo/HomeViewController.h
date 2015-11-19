//
//  HomeViewController.h
//  BaseWebViewDemo
//
//  Created by 宋志明 on 15/9/21.
//  Copyright (c) 2015年 宋志明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface HomeViewController : UIViewController
{
    __weak IBOutlet UIProgressView *homeProgressView;
    WKWebView *webView;
}

@end
