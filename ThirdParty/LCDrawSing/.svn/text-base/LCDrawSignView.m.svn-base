//
//  LCDrawSignView.m
//  LCSing
//
//  Created by 刘超 on 16/8/1.
//  Copyright © 2016年 刘超. All rights reserved.
//

#import "LCDrawSignView.h"
#import "LCSign.h"

@implementation LCDrawSignView


-(void)showDrawSignView{
    
    self.transform = CGAffineTransformMakeRotation(M_PI/2);
    self.frame = CGRectMake(0, 0, self.frame.size.height, self.frame.size.width);
    [self setBackgroundColor:[UIColor whiteColor]];
    self.layer.cornerRadius=15;
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
    _lineArray =[[NSMutableArray alloc] init];
    
   _sign = [[LCSign alloc] initWithFrame:CGRectMake(20, 45, self.frame.size.height-40, self.frame.size.width-90)];
    [_sign setBackgroundColor:[UIColor whiteColor]];
    [self sendSubviewToBack:_sign];
    [self addSubview:_sign];
    LCDrawSignView * temp = self;
    _sign.signCallBackBlocks = ^(NSMutableArray * lineArray){
        temp.lineArray = lineArray;
    };
    
    
    
    UILabel * titleLabel= [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.height*1/2-100, 0, 200, 40)];
    [titleLabel setText:@"请在指定区域内签名"];
    [titleLabel setFont:[UIFont italicSystemFontOfSize:20]];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [self addSubview:titleLabel];
    
    UIButton* clearButton = [[UIButton alloc] initWithFrame:CGRectMake(20, self.frame.size.width-42.5, 100, 40)];
    [clearButton addTarget:self action:@selector(clikClear) forControlEvents:UIControlEventTouchUpInside];
    [clearButton setBackgroundImage:[UIImage imageNamed:@"remove"] forState:UIControlStateNormal];
    [self addSubview:clearButton];
    
    UIButton* closeButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.height/2-40, self.frame.size.width-42.5, 100, 40)];
    [closeButton addTarget:self action:@selector(clikClose) forControlEvents:UIControlEventTouchUpInside];
    [closeButton setBackgroundImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
    [self addSubview:closeButton];
    
    UIButton* okButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.height-120, self.frame.size.width-42.5, 100, 40)];
    [okButton addTarget:self action:@selector(clikOk) forControlEvents:UIControlEventTouchUpInside];
    [okButton setBackgroundImage:[UIImage imageNamed:@"confirm"] forState:UIControlStateNormal];
    [self addSubview:okButton];
    
    
    
    
}

- (UIImage *)saveScreen{
    
    UIView *screenView = self.sign;
    
    for (int i=1; i<16;i++) {
        UIView *view=[self viewWithTag:i];
        if ((i>=1&&i<=5)||(i>=10&&i<=15)) {
            if (view.hidden==YES) {
                continue;
            }
        }
        view.hidden=YES;
    }
    UIGraphicsBeginImageContext(screenView.bounds.size);
    [screenView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //    UIImageWriteToSavedPhotosAlbum(image, screenView, nil, nil);
    //    for (int i=1;i<16;i++) {
    //        if ((i>=1&&i<=5)||(i>=11&&i<=14)) {
    //            continue;
    //        }
    //        UIView *view=[self viewWithTag:i];
    //        view.hidden=NO;
    //    }
    NSLog(@"截屏成功");
    image = [LCDrawSignView imageToTransparent:image];
    return image;
}

/** 颜色变化 */
void ProviderReleaseData (void *info, const void *data, size_t size)
{
    free((void*)data);
}

//颜色替换
+ (UIImage*) imageToTransparent:(UIImage*) image
{
    // 分配内存
    const int imageWidth = image.size.width;
    const int imageHeight = image.size.height;
    size_t      bytesPerRow = imageWidth * 4;
    uint32_t* rgbImageBuf = (uint32_t*)malloc(bytesPerRow * imageHeight);
    
    // 创建context
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(rgbImageBuf, imageWidth, imageHeight, 8, bytesPerRow, colorSpace,
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    CGContextDrawImage(context, CGRectMake(0, 0, imageWidth, imageHeight), image.CGImage);
    
    // 遍历像素
    int pixelNum = imageWidth * imageHeight;
    uint32_t* pCurPtr = rgbImageBuf;
    for (int i = 0; i < pixelNum; i++, pCurPtr++)
    {
        
        
        
        //把绿色变成黑色，把背景色变成透明
        if ((*pCurPtr & 0x65815A00) == 0x65815a00)    // 将背景变成透明
        {
            uint8_t* ptr = (uint8_t*)pCurPtr;
            ptr[0] = 0;
        }
        else if ((*pCurPtr & 0x00FF0000) == 0x00ff0000)    // 将绿色变成黑色
        {
            uint8_t* ptr = (uint8_t*)pCurPtr;
            ptr[3] = 0; //0~255
            ptr[2] = 0;
            ptr[1] = 0;
        }
        else if ((*pCurPtr & 0xFFFFFF00) == 0xffffff00)    // 将白色变成透明
        {
            uint8_t* ptr = (uint8_t*)pCurPtr;
            ptr[0] = 0;
        }
        else
        {
            // 改成下面的代码，会将图片转成想要的颜色
            uint8_t* ptr = (uint8_t*)pCurPtr;
            ptr[3] = 0; //0~255
            ptr[2] = 0;
            ptr[1] = 0;
        }
        
    }
    
    // 将内存转成image
    CGDataProviderRef dataProvider = CGDataProviderCreateWithData(NULL, rgbImageBuf, bytesPerRow * imageHeight, ProviderReleaseData);
    CGImageRef imageRef = CGImageCreate(imageWidth, imageHeight, 8, 32, bytesPerRow, colorSpace,
                                        kCGImageAlphaLast | kCGBitmapByteOrder32Little, dataProvider,
                                        NULL, true, kCGRenderingIntentDefault);
    CGDataProviderRelease(dataProvider);
    
    UIImage* resultUIImage = [UIImage imageWithCGImage:imageRef];
    
    // 释放
    CGImageRelease(imageRef);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    // free(rgbImageBuf) 创建dataProvider时已提供释放函数，这里不用free
    
    return resultUIImage;
}



-(void)clikClear{
    [_sign clear];
}
-(void)clikOk{
    _drawSignCallBackBlock(self.frame.size.height-40,self.frame.size.width-90,_lineArray,[self saveScreen]);
    [self dismissDrawSignView];
}
-(void)clikClose{
    [self dismissDrawSignView];
}
-(void)dismissDrawSignView{
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
