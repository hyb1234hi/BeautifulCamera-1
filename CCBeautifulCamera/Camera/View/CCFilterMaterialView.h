//
//  CCFilterMaterialView.h
//  CCBeautifulCamera
//
//  Created by CC老师 on 2019/6/18.
//  Copyright © 2019年 CC老师. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CCFilterMaterialModel.h"

@class CCFilterMaterialView;

@protocol CCFilterMaterialViewDelegate <NSObject>

- (void)filterMaterialView:(CCFilterMaterialView *)filterMaterialView didScrollToIndex:(NSUInteger)index;

@end

@interface CCFilterMaterialView : UIView

@property (nonatomic, copy) NSArray<CCFilterMaterialModel *> *itemList;
@property (nonatomic, weak) id <CCFilterMaterialViewDelegate> delegate;

@end
