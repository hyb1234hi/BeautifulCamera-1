//
//  CCCameraViewController+TakePhoto.m
//  CCBeautifulCamera
//
//  Created by CC老师 on 2019/6/20.
//  Copyright © 2019年 CC老师. All rights reserved.
//

#import "CCCameraViewController+Private.h"

#import "CCCameraViewController+TakePhoto.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

@implementation CCCameraViewController (TakePhoto)

- (void)takePhoto {
    @weakify(self);
    [[CCCameraManager shareManager] takePhotoWtihCompletion:^(UIImage *resultImage,
                                                              NSError *error) {
        @strongify(self);
        [self forwardToPhotoResultWith:resultImage];
    }];
}

@end

#pragma clang diagnostic pop
