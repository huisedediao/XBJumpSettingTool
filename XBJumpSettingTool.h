//
//  XBJumpSettingTool.h
//  XBAppTools
//
//  Created by xxb on 2018/6/15.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    XBJumpSettingType_WIFI,//无线局域网
    XBJumpSettingType_Bluetooth,//蓝牙
    XBJumpSettingType_MOBILE_DATA_SETTINGS_ID,//蜂窝移动网络
    XBJumpSettingType_INTERNET_TETHERING,//个人热点
    XBJumpSettingType_Carrier,//运营商
    XBJumpSettingType_NOTIFICATIONS_ID,//通知
    XBJumpSettingType_General,//通用
    XBJumpSettingType_General_About,//通用-关于本机
    XBJumpSettingType_General_Keyboard,//通用-键盘
    XBJumpSettingType_General_ACCESSIBILITY,//通用-辅助功能
    XBJumpSettingType_General_INTERNATIONAL,//通用-语言和地区
    XBJumpSettingType_General_Reset,//通用-还原
    XBJumpSettingType_Wallpaper,//墙纸
    XBJumpSettingType_SIRI,//Siri
    XBJumpSettingType_Privacy,//隐私
    XBJumpSettingType_SAFARI,//Safari
    XBJumpSettingType_MUSIC,//MUSIC
    XBJumpSettingType_MUSIC_EQ,//音乐-均衡器
    XBJumpSettingType_Photos,//Photos
    XBJumpSettingType_FACETIME,//FACETIME
} XBJumpSettingType;

/*
 无线局域网 App-Prefs:root=WIFI
 蓝牙 App-Prefs:root=Bluetooth
 蜂窝移动网络 App-Prefs:root=MOBILE_DATA_SETTINGS_ID
 个人热点 App-Prefs:root=INTERNET_TETHERING
 运营商 App-Prefs:root=Carrier
 通知 App-Prefs:root=NOTIFICATIONS_ID
 通用 App-Prefs:root=General
 通用-关于本机 App-Prefs:root=General&path=About
 通用-键盘 App-Prefs:root=General&path=Keyboard
 通用-辅助功能 App-Prefs:root=General&path=ACCESSIBILITY
 通用-语言与地区 App-Prefs:root=General&path=INTERNATIONAL
 通用-还原 App-Prefs:root=Reset
 墙纸 App-Prefs:root=Wallpaper
 Siri App-Prefs:root=SIRI
 隐私 App-Prefs:root=Privacy
 Safari App-Prefs:root=SAFARI
 音乐 App-Prefs:root=MUSIC
 音乐-均衡器 App-Prefs:root=MUSIC&path=com.apple.Music:EQ
 照片与相机 App-Prefs:root=Photos
 FaceTime App-Prefs:root=FACETIME
 
 */

@interface XBJumpSettingTool : NSObject
+ (instancetype)shared;
///errorBlcok：无法跳转时的回调
- (void)jumpToSettingWithType:(XBJumpSettingType)type errorBlock:(void(^)(void))errorBlock;
/*
 successBlcok: ios10和ios10以后才起作用
 errorBlcok：无法跳转时的回调
 */
- (void)jumpToSettingWithType:(XBJumpSettingType)type successBlcok:(void(^)(void))successBlcok errorBlock:(void(^)(void))errorBlock;
@end
