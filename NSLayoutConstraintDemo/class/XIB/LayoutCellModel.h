//
//  LayoutCellModel.h
//  NSLayoutConstraintDemo
//
//  Created by dome on 2017/12/13.
//  Copyright © 2017年 Tsunami. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LayoutCellModel : NSObject
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy, readonly) NSString *identifier;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *content;
@property (nonatomic, copy, readonly) NSString *username;
@property (nonatomic, copy, readonly) NSString *time;
@property (nonatomic, copy, readonly) NSString *imageName;
@end
