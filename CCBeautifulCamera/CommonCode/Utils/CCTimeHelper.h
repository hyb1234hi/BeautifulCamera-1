//
//  CCTimeHelper.h
//  CCBeautifulCamera
//
//  Created by CC老师 on 2019/6/18.
//  Copyright © 2019年 CC老师. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCTimeHelper : NSObject

/// 将时间戳转化为 12:59:59 格式
+ (NSString *)timeStringWithTimestamp:(NSInteger)timestamp;

@end
