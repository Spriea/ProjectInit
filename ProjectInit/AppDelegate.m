//
//  AppDelegate.m
//  Urgency
//
//  Created by Somer.King on 2019/4/4.
//  Copyright © 2019 Somer.King. All rights reserved.
//

#import "AppDelegate.h"
#import <IQKeyboardManager.h>
#import "SKHomeVC.h"
#import "SKBaseNav.h"
#import "SKMainTabVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 1、创建window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //    SKHomeVC *homeVC = [[SKHomeVC alloc] init];
    //    SKBaseNav *homeNav = [[SKBaseNav alloc] initWithRootViewController:homeVC];
    //    self.window.rootViewController = homeNav;
    //    [WXApi registerApp:WXAppID];
    
    // 1.1.启动配置设置
    [self setupConfig];
    
    // 2.创建根控制器
//    [self setupRootVC];
    SKMainTabVC *mainVC = [[SKMainTabVC alloc] init];
    self.window.rootViewController = mainVC;
    
    //    [self getLocation];
    // 3、查看是否有推送的消息
    //    self.userInfo = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    
    // 4、APP启动登录
    //    [SKLoginVC autoLogin:self.window withMsg:self.userInfo];
//    application.statusBarHidden = YES;
    
    // 5、显示并设置key
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)setupConfig{
    [self initMonitorNetWorking];
    [self configBaseTool];
}

- (void)configBaseTool{
    [SVProgressHUD setMinimumDismissTimeInterval:0.75];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];//设置HUD的Style
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.8]];
    
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO; //不显示键盘上工具条
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;//点击空白地方 隐藏键盘
    [[IQKeyboardManager sharedManager] setEnable:YES]; // 设置是否启用IQKeyboardManager
}

#pragma mark - 监听网络状态
- (void)initMonitorNetWorking{
    AFNetworkReachabilityManager *networkManager = [AFNetworkReachabilityManager sharedManager];
    [networkManager startMonitoring];
    [networkManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusNotReachable) {//失去网络
            [SKCustomFunction alertSheetWithTitle:nil message:@"无法连接到互联网，请检查网络" confTitle:nil confirmHandler:^(UIAlertAction *action) {
                
            } cancleHandler:nil];
        }
    }];
}

@end
