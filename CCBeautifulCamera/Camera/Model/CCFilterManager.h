//
//  CCFilterManager.h
//  CCBeautifulCamera
//
//  Created by CC老师 on 2019/6/18.
//  Copyright © 2019年 CC老师. All rights reserved.
//

#import <GPUImage.h>

#import <Foundation/Foundation.h>

#import "CCFilterMaterialModel.h"

@interface CCFilterManager : NSObject

/// GPUImage 自带滤镜列表
@property (nonatomic, strong, readonly) NSArray<CCFilterMaterialModel *> *defaultFilters;
/// 自定义滤镜列表
@property (nonatomic, strong, readonly) NSArray<CCFilterMaterialModel *> *defineFilters;

/**
 获取实例
 */
+ (CCFilterManager *)shareManager;

/**
 通过滤镜 ID 返回滤镜对象
 */
- (GPUImageFilter *)filterWithFilterID:(NSString *)filterID;

@end
