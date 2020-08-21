//
//  CCFilterCategoryView.h
//  CCBeautifulCamera
//
//  Created by CC老师 on 2019/6/18.
//  Copyright © 2019年 CC老师. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CCFilterCategoryView;

@protocol CCFilterCategoryViewDelegate <NSObject>

- (void)filterCategoryView:(CCFilterCategoryView *)filterCategoryView
          didScrollToIndex:(NSUInteger)index;

@end

@interface CCFilterCategoryView : UIView

@property (nonatomic, assign) CGFloat itemWidth;
@property (nonatomic, strong) UIFont *itemFont;
@property (nonatomic, strong) UIColor *itemNormalColor;
@property (nonatomic, strong) UIColor *itemSelectColor;
@property (nonatomic, assign) CGFloat bottomLineWidth;
@property (nonatomic, assign) CGFloat bottomLineHeight;

@property (nonatomic, assign, readonly) NSInteger currentIndex;

@property (nonatomic, strong) NSArray <NSString *> *itemList;

@property (nonatomic, weak) id<CCFilterCategoryViewDelegate> delegate;

- (void)scrollToIndex:(NSUInteger)index;

@end
