//
//  ViewController.h
//  RestTest
//
//  Created by 刘超 on 2016/10/10.
//  Copyright © 2016年 刘超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCPdfView.h"
@interface ViewController : UIViewController

@property(nonatomic,strong)LCPdfView * pdfView;
@property(nonatomic,strong)NSData * pdfData;

@end

