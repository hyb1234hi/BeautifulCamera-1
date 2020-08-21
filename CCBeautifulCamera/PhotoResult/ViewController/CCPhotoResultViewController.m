//
//  CCPhotoResultViewController.m
//  CCBeautifulCamera
//
//  Created by CC老师 on 2019/6/23.
//  Copyright © 2019年 CC老师. All rights reserved.
//

#import <Photos/Photos.h>

#import "CCPhotoResultViewController+Private.h"

#import "CCPhotoResultViewController.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"

@implementation CCPhotoResultViewController

- (void)dealloc {
    [[GPUImageContext sharedImageProcessingContext].framebufferCache purgeAllUnassignedFramebuffers];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self commonInit];
    
    self.contentImageView.image = self.resultImage;
}

#pragma mark - Private

- (void)commonInit {
    [self setupUI];
}

- (void)backToCamera {
    [self.navigationController popViewControllerAnimated:NO];
}

// 保存图片到相册
- (void)writeImageToSavedPhotosAlbum:(UIImage *)image
                          completion:(void (^)(BOOL success))completion {
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        [PHAssetChangeRequest creationRequestForAssetFromImage:image];
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        if (completion) {
            completion(success);
        }
    }];
}

#pragma mark - Action

- (void)confirmAction:(id)sender {
    @weakify(self);
    [self writeImageToSavedPhotosAlbum:self.resultImage completion:^(BOOL success) {
        @strongify(self);
        if (success) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self backToCamera];
                [self.view.window makeToast:@"保存成功"];
            });
        }
    }];
}

- (void)backAction:(id)sender {
    [self backToCamera];
}

@end

#pragma clang diagnostic pop
