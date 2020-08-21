//
//  CCCameraViewController.m
//  CCBeautifulCamera
//
//  Created by CC老师 on 2019/6/19.
//  Copyright © 2019年 CC老师. All rights reserved.
//

#import "CCCameraViewController+Private.h"

#import "CCCameraViewController.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"

@implementation CCCameraViewController

- (void)dealloc {
    [self removeObserver];
    [self endVideoTimer];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self commonInit];
    
    CCCameraManager *cameraManager = [CCCameraManager shareManager];
    [cameraManager addOutputView:self.cameraView];
    [cameraManager startCapturing];
    
     [self updateDarkOrNormalModeWithRatio:cameraManager.ratio];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[CCCameraManager shareManager] updateFlash];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[CCCameraManager shareManager] closeFlashIfNeed];
}

#pragma mark - Public

#pragma mark - Private

- (void)commonInit {
    [self setupData];
    [self setupUI];
    [self setupTap];
    [self addObserver];
}

- (void)setupTap {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
}

- (void)setupData {
    self.videos = [[NSMutableArray alloc] init];
    self.currentVideoScale = 1.0f;
}

- (void)forwardToPhotoResultWith:(UIImage *)image {
    CCPhotoResultViewController *resultVC = [[CCPhotoResultViewController alloc] init];
    resultVC.resultImage = image;
    [self.navigationController pushViewController:resultVC animated:NO];
}

- (void)forwardToVideoResult {
    CCVideoResultViewController *vc = [[CCVideoResultViewController alloc] init];
    vc.videos = self.videos;
    [self.videos removeAllObjects];
    [self.navigationController pushViewController:vc animated:NO];
}

#pragma mark - Custom Accessor

- (NSArray<CCFilterMaterialModel *> *)defaultFilterMaterials {
    if (!_defaultFilterMaterials) {
        _defaultFilterMaterials = [[CCFilterManager shareManager] defaultFilters];
    }
    return _defaultFilterMaterials;
}

- (NSArray<CCFilterMaterialModel *> *)defineFilterMaterials {
    if (!_defineFilterMaterials) {
        _defineFilterMaterials = [[CCFilterManager shareManager] defineFilters];
    }
    return _defineFilterMaterials;
}

#pragma mark - Action

- (void)filterAction:(id)sender {
    [self setFilterBarViewHidden:NO
                        animated:YES
                      completion:NULL];
    
    [self refreshUIWhenFilterBarShowOrHide];
    
    // 第一次展开的时候，添加数据
    if (!self.filterBarView.defaultFilterMaterials) {
        self.filterBarView.defaultFilterMaterials = self.defaultFilterMaterials;
    }
}

- (void)nextAction:(id)sender {
    [self forwardToVideoResult];
    [self refreshUIWhenRecordVideo];
}

- (void)tapAction:(UITapGestureRecognizer *)gestureRecognizer {
    [self setFilterBarViewHidden:YES
                        animated:YES
                      completion:NULL];
    
    [self refreshUIWhenFilterBarShowOrHide];
}

- (void)cameraViewTapAction:(UITapGestureRecognizer *)tap {
    if (self.filterBarView.showing) {
        [self tapAction:nil];
        return;
    }
    
    CGPoint location = [tap locationInView:self.cameraView];
    [[CCCameraManager shareManager] setFocusPoint:location];
    [self showFocusViewAtLocation:location];
}

- (void)cameraViewPinchAction:(UIPinchGestureRecognizer *)pinch {
    CCCameraManager *manager = [CCCameraManager shareManager];
    CGFloat scale = pinch.scale * self.currentVideoScale;
    scale = [manager availableVideoScaleWithScale:scale];
    [manager setVideoScale:scale];
    
    if (pinch.state == UIGestureRecognizerStateEnded) {
        self.currentVideoScale = scale;
    }
}

#pragma mark - CCCapturingButtonDelegate

- (void)capturingButtonDidClicked:(CCCapturingButton *)button {
    if (self.modeSwitchView.type == SCCapturingModeSwitchTypeImage) {
        [self takePhoto];
    } else if (self.modeSwitchView.type == SCCapturingModeSwitchTypeVideo) {
        if (self.isRecordingVideo) {
            [self stopRecordVideo];
        } else {
            [self startRecordVideo];
        }
    }
}

#pragma mark - CCFilterBarViewDelegate

- (void)filterBarView:(CCFilterBarView *)filterBarView categoryDidScrollToIndex:(NSUInteger)index {
    if (index == 0 && !self.filterBarView.defaultFilterMaterials) {
        self.filterBarView.defaultFilterMaterials = self.defaultFilterMaterials;
    } else if (index == 1 && !self.filterBarView.defineFilterMaterials) {
        self.filterBarView.defineFilterMaterials = self.defineFilterMaterials;
    }
}

- (void)filterBarView:(CCFilterBarView *)filterBarView materialDidScrollToIndex:(NSUInteger)index {
    NSArray<CCFilterMaterialModel *> *models = [self filtersWithCategoryIndex:self.filterBarView.currentCategoryIndex];
    
    CCFilterMaterialModel *model = models[index];
    [[CCCameraManager shareManager].currentFilterHandler setEffectFilter:[[CCFilterManager shareManager] filterWithFilterID:model.filterID]];
}

- (void)filterBarView:(CCFilterBarView *)filterBarView beautifySwitchIsOn:(BOOL)isOn {
    if (isOn) {
        [self addBeautifyFilter];
    } else {
        [self removeBeautifyFilter];
    }
}

- (void)filterBarView:(CCFilterBarView *)filterBarView beautifySliderChangeToValue:(CGFloat)value {
    [CCCameraManager shareManager].currentFilterHandler.beautifyFilterDegree = value;
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
       shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isDescendantOfView:self.filterBarView]) {
        return NO;
    }
    return YES;
}

#pragma mark - CCCameraTopViewDelegate

- (void)cameraTopViewDidClickRotateButton:(CCCameraTopView *)cameraTopView {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[CCCameraManager shareManager] rotateCamera];
        self.currentVideoScale = 1.0f;  // 切换摄像头，重置缩放比例
    });
}

- (void)cameraTopViewDidClickFlashButton:(CCCameraTopView *)cameraTopView {
    SCCameraFlashMode mode = [CCCameraManager shareManager].flashMode;
    mode = (mode + 1) % 4;
    [CCCameraManager shareManager].flashMode = mode;
    [self updateFlashButtonWithFlashMode:mode];
}

- (void)cameraTopViewDidClickRatioButton:(CCCameraTopView *)cameraTopView {
    if (self.isChangingRatio) {
        return;
    }
    self.isChangingRatio = YES;
    
    CCCameraManager *manager =[CCCameraManager shareManager];
    SCCameraRatio ratio = manager.ratio;
    NSInteger ratioCount = [UIDevice is_iPhoneX_Series] ? 4 : 3;
    SCCameraRatio nextRatio = (ratio + 1) % ratioCount;
    
    [self changeViewToRatio:nextRatio animated:YES completion:^{
        manager.ratio = nextRatio;
    }];
    
    [self updateRatioButtonWithRatio:nextRatio];
    [self updateDarkOrNormalModeWithRatio:nextRatio];
}

- (void)cameraTopViewDidClickCloseButton:(CCCameraTopView *)cameraTopView {
    [self.videos removeAllObjects];
    [self refreshUIWhenRecordVideo];
}

#pragma mark - CCCapturingModeSwitchViewDelegate

- (void)capturingModeSwitchView:(CCCapturingModeSwitchView *)view
                didChangeToType:(SCCapturingModeSwitchType)type {
}

@end

#pragma clang diagnostic pop
