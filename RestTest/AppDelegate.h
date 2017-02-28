//
//  AppDelegate.h
//  RestTest
//
//  Created by 刘超 on 2016/10/10.
//  Copyright © 2016年 刘超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

