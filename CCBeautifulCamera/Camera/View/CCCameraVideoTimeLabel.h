//
//  CCCameraVideoTimeLabel.h
//  CCBeautifulCamera
//
//  Created by CC老师 on 2019/6/24.
//  Copyright © 2019年 CC老师. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCCameraVideoTimeLabel : UIView

@property (nonatomic, assign) NSInteger timestamp;
@property (nonatomic, assign) BOOL isDarkMode;

// 重置时间
- (void)resetTime;

@end

