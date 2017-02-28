//
//  ViewController.m
//  RestTest
//
//  Created by 刘超 on 2016/10/10.
//  Copyright © 2016年 刘超. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPSessionManager.h"
#import "GTMBase64.h"
#import "LFCGzipUtillity.h"




@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
   gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:0/255.0 green:165/255.0 blue:187/255.0 alpha:1.0].CGColor,(__bridge id) [UIColor colorWithRed:48/255.0 green:140/255.0 blue:192/255.0 alpha:1.0].CGColor];
    gradientLayer.locations = @[@0.3, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = CGRectMake(0, 100, 300, 100);
    [self.view.layer addSublayer:gradientLayer];
    
    UIView * theView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width, 50)];

    [self.view addSubview:theView];
    
    CAGradientLayer *gradientLayers = [CAGradientLayer layer];
    gradientLayers.colors = @[(__bridge id)[UIColor colorWithRed:0/255.0 green:165/255.0 blue:187/255.0 alpha:1.0].CGColor,(__bridge id) [UIColor colorWithRed:48/255.0 green:140/255.0 blue:192/255.0 alpha:1.0].CGColor];
    gradientLayers.locations = @[@0.0, @1.0];
    gradientLayers.startPoint = CGPointMake(0, 0);
    gradientLayers.endPoint = CGPointMake(1.0, 0);
    gradientLayers.frame = CGRectMake(0, 0, theView.frame.size.width, theView.frame.size.height);
    [theView.layer addSublayer:gradientLayers];
    
    
    
    
    
//
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width*1/2 -100,self.view.frame.size.height*1/2 -25 , 200, 50)];
    [button setTitle:@"显示PDF" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)clickButton:(id)sender{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    
    NSString *urlString = [NSString stringWithFormat:@"%@paperless/getPdfForCQ",@"http://10.77.45.168:8080/uss_web/rest/"];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"20170116200000013078"  forKey:@"order_id"];
    [dict setObject:@"C14C91B03324AB82EB71564E48A4BCEA"  forKey:@"jsessionid"];
    
//    [dict setObject:@""  forKey:@"resolution_x"];
//    [dict setObject:@"100"  forKey:@"resolution_x"];
//    [dict setObject:@"200"  forKey:@"sign_data"];
    
//    [dict setObject:@"83b10da" forKey:@"agent_id"];
//    [dict setObject:@"83b10da" forKey:@"user_name"];
//    [dict setObject:@"831"  forKey:@"area_no"];
//    [dict setObject:@"02"  forKey:@"business_type"];
    [manager POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"上传的进度");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"post请求失败:%@", error);
    }];

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
