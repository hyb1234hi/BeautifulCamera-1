//
//  CCFilterHelper.h
//  CCBeautifulCamera
//
//  Created by CC老师 on 2019/6/18.
//  Copyright © 2019年 CC老师. All rights reserved.
//

#import <GPUImage.h>
#import <Foundation/Foundation.h>

@interface CCFilterHelper : NSObject

/**
 给图片上滤镜效果

 @param filter 滤镜
 @param originImage 原图
 @return 效果图
 */
+ (UIImage *)imageWithFilter:(GPUImageFilter *)filter
                 originImage:(UIImage *)originImage;

@end
