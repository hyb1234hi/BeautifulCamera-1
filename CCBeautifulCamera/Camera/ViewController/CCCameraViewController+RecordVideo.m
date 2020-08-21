//
//  CCCameraViewController+RecordVideo.m
//  CCBeautifulCamera
//
//  Created by CC老师 on 2019/6/20.
//  Copyright © 2019年 CC老师. All rights reserved.
//
#import "CCCameraViewController+Private.h"
#import "CCCameraViewController+RecordVideo.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

@implementation CCCameraViewController (RecordVideo)

#pragma mark - Public

- (void)startRecordVideo {
    if (self.isRecordingVideo) {
        return;
    }
    self.capturingButton.capturingState = CCCapturingButtonStateRecording;
    self.isRecordingVideo = YES;
    
    [[CCCameraManager shareManager] recordVideo];
    [self startVideoTimer];
    
    [self refreshUIWhenRecordVideo];
}

- (void)stopRecordVideo {
    if (!self.isRecordingVideo) {
        return;
    }
    self.capturingButton.capturingState = CCCapturingButtonStateNormal;
    @weakify(self);
    [[CCCameraManager shareManager] stopRecordVideoWithCompletion:^(NSString *videoPath) {
        @strongify(self);
        
        self.isRecordingVideo = NO;
        
        AVURLAsset *asset = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:videoPath]];
        CCVideoModel *videoModel = [[CCVideoModel alloc] init];
        videoModel.filePath = videoPath;
        videoModel.asset = asset;
        [self.videos addObject:videoModel];
        
        [self endVideoTimer];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self refreshUIWhenRecordVideo];
        });
    }];
}

- (void)startVideoTimer {
    self.videoTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(videoTimerAction) userInfo:nil repeats:YES];
    [self.videoTimer fire];
}

- (void)endVideoTimer {
    [self.videoTimer invalidate];
    self.videoTimer = nil;
}

#pragma mark - Action

- (void)videoTimerAction {
    CMTime savedTime = kCMTimeZero;
    for (CCVideoModel *model in self.videos) {
        savedTime = CMTimeAdd(savedTime, model.asset.duration);
    }
    NSInteger timestamp = round(CMTimeGetSeconds(savedTime) + [CCCameraManager shareManager].currentDuration);
    self.videoTimeLabel.timestamp = timestamp;
}

@end

#pragma clang diagnostic pop
