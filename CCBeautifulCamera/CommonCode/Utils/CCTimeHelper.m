//
//  CCTimeHelper.m
//  CCBeautifulCamera
//
//  Created by CC老师 on 2019/6/18.
//  Copyright © 2019年 CC老师. All rights reserved.
//

#import "CCTimeHelper.h"

@implementation CCTimeHelper

+ (NSString *)timeStringWithTimestamp:(NSInteger)timestamp {
    NSInteger second = timestamp % 60;
    NSInteger minute = (timestamp / 60) % 60;
    NSInteger hour = timestamp / 60 / 60;
    
    NSString *result = [NSString stringWithFormat:@"%02ld:%02ld", minute, second];
    if (hour > 0) {
        result = [NSString stringWithFormat:@"%02ld:%@", hour, result];
    }
    return result;
}

@end
