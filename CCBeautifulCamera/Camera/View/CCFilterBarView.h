//
//  CCFilterBarView.h
//  CCBeautifulCamera
//
//  Created by CC老师 on 2019/6/18.
//  Copyright © 2019年 CC老师. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CCFilterMaterialModel.h"

@class CCFilterBarView;

@protocol CCFilterBarViewDelegate <NSObject>

- (void)filterBarView:(CCFilterBarView *)filterBarView categoryDidScrollToIndex:(NSUInteger)index;
- (void)filterBarView:(CCFilterBarView *)filterBarView materialDidScrollToIndex:(NSUInteger)index;
- (void)filterBarView:(CCFilterBarView *)filterBarView beautifySwitchIsOn:(BOOL)isOn;
- (void)filterBarView:(CCFilterBarView *)filterBarView beautifySliderChangeToValue:(CGFloat)value;

@end

@interface CCFilterBarView : UIView

@property (nonatomic, assign) BOOL showing;
@property (nonatomic, weak) id <CCFilterBarViewDelegate> delegate;

// GPUImage内置滤镜
@property (nonatomic, copy) NSArray<CCFilterMaterialModel *> *defaultFilterMaterials;

// 自定义滤镜
@property (nonatomic, copy) NSArray<CCFilterMaterialModel *> *defineFilterMaterials;

- (NSInteger)currentCategoryIndex;

@end
