//
//  CCPhotoResultViewController+Private.h
//  CCBeautifulCamera
//
//  Created by CC老师 on 2019/6/23.
//  Copyright © 2019年 CC老师. All rights reserved.
//

#import <GPUImage.h>

#import "CCCameraManager.h"
#import "CCPhotoResultViewController.h"

@interface CCPhotoResultViewController ()

@property (nonatomic, strong) UIImageView *contentImageView;
@property (nonatomic, strong) UIButton *confirmButton;
@property (nonatomic, strong) UIButton *backButton;

#pragma mark - Action

- (void)confirmAction:(id)sender;

- (void)backAction:(id)sender;

#pragma mark - UI

- (void)setupUI;

/// 刷新黑暗模式或正常模式
- (void)updateDarkOrNormalMode;

@end
