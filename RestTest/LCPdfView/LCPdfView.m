//
//  LCPdfView.m
//  Pre-sale_Guangxi_iPhone
//
//  Created by 刘超 on 16/8/18.
//  Copyright © 2016年 Eric_Liu. All rights reserved.
//

#import "LCPdfView.h"

@implementation LCPdfView

-(void)showPdfView:(NSURLRequest *)request{
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.bounds];
    webView.delegate = self;
    webView.scalesPageToFit = YES;
    webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [webView setAllowsInlineMediaPlayback:YES];
    [self addSubview:webView];
    
    
    
    [webView loadRequest:request];
    UIButton * closeButton = [[UIButton alloc] initWithFrame:CGRectMake(10, self.frame.size.height-50, self.frame.size.width-20, 40)];
    [closeButton setTitle:@"关闭" forState:UIControlStateNormal];
    [closeButton setBackgroundColor:[UIColor redColor]];
    [closeButton addTarget:self action:@selector(closePdf) forControlEvents:UIControlEventTouchUpInside];
    [webView addSubview:closeButton];
    
    
    
}

-(void)closePdf{
    [self dismissPdfView];
}


-(void)dismissPdfView{
    id<UIApplicationDelegate> appDelegate = [[UIApplication sharedApplication] delegate];
    CGSize screenSize = [appDelegate.window.rootViewController.view bounds].size;
    [CATransaction begin];
    [UIView animateWithDuration:0.25f animations:^{
        self.frame = CGRectMake(screenSize.width, 0, screenSize.width, screenSize.height);
    } completion:^(BOOL finished) {
        //都关闭啊都关闭
        [self removeFromSuperview];
    }];
    [CATransaction commit];
}

@end
