//
//  CCFilterMaterialViewCell.h
//  CCBeautifulCamera
//
//  Created by CC老师 on 2019/6/18.
//  Copyright © 2019年 CC老师. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CCFilterMaterialModel.h"

@interface CCFilterMaterialViewCell : UICollectionViewCell

@property (nonatomic, strong) CCFilterMaterialModel *filterMaterialModel;
@property (nonatomic, assign) BOOL isSelect;  

@end
