//
//  MacroDefinition.h
//  NSLayoutConstraintDemo
//
//  Created by dome on 2017/11/20.
//  Copyright © 2017年 Tsuanmi. All rights reserved.
//

#ifndef MacroDefinition_h
#define MacroDefinition_h

#define T_WeakSelf(type)  __weak typeof(type) weak##type = type;
#define T_StrongSelf(type)  __strong typeof(type) type = weak##type;

#define T_COLOR_10(R,G,B) [UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:1.f]

#define T_COLOR_16(RGB) [UIColor colorWithRed:((float)((RGB & 0xFF0000) >> 16))/255.0 green:((float)((RGB & 0xFF00) >> 8))/255.0 blue:((float)(RGB & 0xFF))/255.0 alpha:1.0]

#define T_RandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000 // 当前Xcode支持iOS8及以上

#define T_SCREEN_WIDTH ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.width)
#define T_SCREENH_HEIGHT ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.height)
#define T_SCREEN_SIZE ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?CGSizeMake([UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale,[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale):[UIScreen mainScreen].bounds.size)
#else
#define T_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define T_SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height
#define T_SCREEN_SIZE [UIScreen mainScreen].bounds.size
#endif

#define T_NotificationCenter [NSNotificationCenter defaultCenter]


#ifdef DEBUG
#define TSLog(...) NSLog(@"%s 第%d行 \n %@\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define TSLog(...)

#endif

#endif /* MacroDefinition_h */
