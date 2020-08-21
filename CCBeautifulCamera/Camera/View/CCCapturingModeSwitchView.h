//
//  CCCapturingModeSwitchView.h
//  CCBeautifulCamera
//
//  Created by CC老师 on 2019/6/24.
//  Copyright © 2019年 CC老师. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SCCapturingModeSwitchType) {
    SCCapturingModeSwitchTypeImage,
    SCCapturingModeSwitchTypeVideo
};

@class CCCapturingModeSwitchView;

@protocol CCCapturingModeSwitchViewDelegate <NSObject>

- (void)capturingModeSwitchView:(CCCapturingModeSwitchView *)view
                didChangeToType:(SCCapturingModeSwitchType)type;

@end

@interface CCCapturingModeSwitchView : UIView

@property (nonatomic, assign, readonly) SCCapturingModeSwitchType type;

@property (nonatomic, assign) BOOL isDarkMode;

@property (nonatomic, weak) id <CCCapturingModeSwitchViewDelegate> delegate;

@end
