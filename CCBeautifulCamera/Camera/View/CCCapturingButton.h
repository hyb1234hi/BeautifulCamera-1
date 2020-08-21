//
//  CCCapturingButton.h
//  CCBeautifulCamera
//
//  Created by CC老师 on 2019/6/24.
//  Copyright © 2019年 CC老师. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 按钮状态

 - CCCapturingButtonStateNormal: 默认
 - CCCapturingButtonStateRecording: 录制中
 */
typedef NS_ENUM(NSUInteger, CCCapturingButtonState) {
    CCCapturingButtonStateNormal,
    CCCapturingButtonStateRecording,
};

@class CCCapturingButton;

@protocol CCCapturingButtonDelegate <NSObject>

/**
 拍照按钮被点击
 */
- (void)capturingButtonDidClicked:(CCCapturingButton *)button;

@end

@interface CCCapturingButton : UIButton

@property (nonatomic, assign) CCCapturingButtonState capturingState;
@property (nonatomic, weak) id <CCCapturingButtonDelegate> delegate;

@end
