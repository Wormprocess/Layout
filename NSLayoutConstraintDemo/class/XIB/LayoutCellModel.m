//
//  LayoutCellModel.m
//  NSLayoutConstraintDemo
//
//  Created by dome on 2017/12/13.
//  Copyright © 2017年 Tsunami. All rights reserved.
//

#import "LayoutCellModel.h"

@implementation LayoutCellModel
- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = super.init;
    if (self) {
        _identifier = [self uniqueIdentifier];
        _title = dictionary[@"title"];
        _content = dictionary[@"content"];
        _username = dictionary[@"username"];
        _time = dictionary[@"time"];
        _imageName = dictionary[@"imageName"];
    }
    return self;
}

- (NSString *)uniqueIdentifier
{
    static NSInteger counter = 0;
    return [NSString stringWithFormat:@"unique-id-%@", @(counter++)];
}

@end
