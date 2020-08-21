//
//  CCCameraViewController+Notification.m
//  CCBeautifulCamera
//
//  Created by CC老师 on 2019/6/19.
//  Copyright © 2019年 CC老师. All rights reserved.
//

#import "CCCameraViewController+Private.h"

#import "CCCameraViewController+Notification.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

@implementation CCCameraViewController (Notification)

- (void)addObserver {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(didEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [center addObserver:self selector:@selector(willResignActive:) name:UIApplicationWillResignActiveNotification object:nil];
}

- (void)removeObserver {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - notification

- (void)didEnterBackground:(NSNotification *)notification {
    [self stopRecordVideo];
}

- (void)willResignActive:(NSNotification *)notification {
    [self stopRecordVideo];
}

@end

#pragma clang diagnostic pop
