//
//  LCPdfView.h
//  Pre-sale_Guangxi_iPhone
//
//  Created by 刘超 on 16/8/18.
//  Copyright © 2016年 Eric_Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface LCPdfView : UIView<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView * webView;
-(void)showPdfView:(NSURLRequest *)request;
-(void)dismissPdfView;

@end
