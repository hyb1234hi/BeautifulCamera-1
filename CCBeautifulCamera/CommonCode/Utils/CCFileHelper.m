//
//  CCFileHelper.m
//  CCBeautifulCamera
//
//  Created by CC老师 on 2019/6/18.
//  Copyright © 2019年 CC老师. All rights reserved.
//

#import "CCFileHelper.h"

@implementation CCFileHelper

#pragma mark - Public

+ (NSString *)temporaryDirectory {
    return NSTemporaryDirectory();
}

+ (NSString *)filePathInTmpWithName:(NSString *)name {
    return [[self temporaryDirectory] stringByAppendingPathComponent:name];
}

+ (NSString *)randomFilePathInTmpWithSuffix:(NSString *)suffix {
    long random = [[NSDate date] timeIntervalSince1970] * 1000;
    return [[self filePathInTmpWithName:[NSString stringWithFormat:@"%ld", random]] stringByAppendingString:suffix];
}

@end
