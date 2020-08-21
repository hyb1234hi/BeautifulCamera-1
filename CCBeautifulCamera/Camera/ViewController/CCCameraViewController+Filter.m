//
//  CCCameraViewController+Filter.m
//  CCBeautifulCamera
//
//  Created by CC老师 on 2019/6/19.
//  Copyright © 2019年 CC老师. All rights reserved.
//

#import "CCCameraViewController+Private.h"

#import "CCCameraViewController+Filter.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

@implementation CCCameraViewController (Filter)

#pragma mark - Public

- (void)addBeautifyFilter {
    [CCCameraManager shareManager].currentFilterHandler.beautifyFilterEnable = YES;
}

- (void)removeBeautifyFilter {
    [CCCameraManager shareManager].currentFilterHandler.beautifyFilterEnable = NO;
}

- (NSArray<CCFilterMaterialModel *> *)filtersWithCategoryIndex:(NSInteger)index {
    if (index == 0) {
        return self.defaultFilterMaterials;
    } else if (index == 1) {
        return self.defineFilterMaterials;
    }
    return nil;
}

@end

#pragma clang diagnostic pop
