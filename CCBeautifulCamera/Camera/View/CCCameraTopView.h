//
//  CCCameraTopView.h
//  CCBeautifulCamera
//
//  Created by CC老师 on 2019/6/24.
//  Copyright © 2019年 CC老师. All rights reserved.
//
#import <UIKit/UIKit.h>

@class CCCameraTopView;

@protocol CCCameraTopViewDelegate <NSObject>

- (void)cameraTopViewDidClickRotateButton:(CCCameraTopView *)cameraTopView;
- (void)cameraTopViewDidClickFlashButton:(CCCameraTopView *)cameraTopView;
- (void)cameraTopViewDidClickRatioButton:(CCCameraTopView *)cameraTopView;
- (void)cameraTopViewDidClickCloseButton:(CCCameraTopView *)cameraTopView;

@end

@interface CCCameraTopView : UIView

@property (nonatomic, strong, readonly) UIButton *rotateButton;  // 切换前后置按钮
@property (nonatomic, strong, readonly) UIButton *flashButton;  // 闪光灯按钮
@property (nonatomic, strong, readonly) UIButton *ratioButton;  // 比例按钮
@property (nonatomic, strong, readonly) UIButton *closeButton;  // 关闭按钮

@property (nonatomic, weak) id <CCCameraTopViewDelegate> delegate;

@end
