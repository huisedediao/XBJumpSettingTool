//
//  XBJumpSettingTool.m
//  XBAppTools
//
//  Created by xxb on 2018/6/15.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import "XBJumpSettingTool.h"
#import <UIKit/UIKit.h>

@interface XBJumpSettingTool ()
@property (nonatomic,strong) NSArray *arr_settingName;
@end

@implementation XBJumpSettingTool

+ (instancetype)shared
{
    return [self new];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static XBJumpSettingTool *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [super allocWithZone:zone];
    });
    return tool;
}


///errorBlcok：无法跳转时的回调
- (void)jumpToSettingWithType:(XBJumpSettingType)type errorBlock:(void(^)(void))errorBlock
{
//    NSString * urlString = self.arr_settingName[type];
    NSString * urlString = UIApplicationOpenSettingsURLString;
    NSString * urlStringOld = [urlString stringByReplacingOccurrencesOfString:@"App-P" withString:@"p"];
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlString]])
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:^(BOOL success) {
            
        }];
    }
    else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlStringOld]])
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStringOld]];
    }
    else
    {
        if (errorBlock)
        {
            errorBlock();
        }
    }
}
/*
 successBlcok: ios10和ios10以后才起作用
 errorBlcok：无法跳转时的回调
 */
- (void)jumpToSettingWithType:(XBJumpSettingType)type successBlcok:(void(^)(void))successBlcok errorBlock:(void(^)(void))errorBlock
{
//    NSString * urlString = self.arr_settingName[type];
    NSString * urlString = UIApplicationOpenSettingsURLString;
    NSString * urlStringOld = [urlString stringByReplacingOccurrencesOfString:@"App-P" withString:@"p"];
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlString]])
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:^(BOOL success) {
            if (success)
            {
                if (successBlcok)
                {
                    successBlcok();
                }
            }
        }];
    }
    else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlStringOld]])
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStringOld]];
    }
    else
    {
        if (errorBlock)
        {
            errorBlock();
        }
    }
}

//- (NSArray *)arr_settingName
//{
//    if (_arr_settingName == nil)
//    {
//        _arr_settingName = @[@"App-Prefs:root=WIFI",
//                             @"App-Prefs:root=Bluetooth",
//                             @"App-Prefs:root=MOBILE_DATA_SETTINGS_ID",
//                             @"App-Prefs:root=INTERNET_TETHERING",
//                             @"App-Prefs:root=Carrier",
//                             @"App-Prefs:root=NOTIFICATIONS_ID",
//                             @"App-Prefs:root=General",
//                             @"App-Prefs:root=General&path=About",
//                             @"App-Prefs:root=General&path=Keyboard",
//                             @"App-Prefs:root=General&path=ACCESSIBILITY",
//                             @"App-Prefs:root=General&path=INTERNATIONAL",
//                             @"App-Prefs:root=Reset",
//                             @"App-Prefs:root=Wallpaper",
//                             @"App-Prefs:root=SIRI",
//                             @"App-Prefs:root=Privacy",
//                             @"App-Prefs:root=SAFARI",
//                             @"App-Prefs:root=MUSIC",
//                             @"App-Prefs:root=MUSIC&path=com.apple.Music:EQ",
//                             @"App-Prefs:root=Photos",
//                             @"App-Prefs:root=FACETIME"];
//    }
//    return _arr_settingName;
//}

@end
