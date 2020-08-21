//
//  CCFilterHelper.m
//  CCBeautifulCamera
//
//  Created by CC老师 on 2019/6/18.
//  Copyright © 2019年 CC老师. All rights reserved.
//

#import "CCFilterHelper.h"

@implementation CCFilterHelper

+ (UIImage *)imageWithFilter:(GPUImageFilter *)filter
                 originImage:(UIImage *)originImage {
    [filter forceProcessingAtSize:originImage.size];
    GPUImagePicture *picture = [[GPUImagePicture alloc] initWithImage:originImage];
    [picture addTarget:filter];
    
    [picture processImage];
    [filter useNextFrameForImageCapture];
    
    return [filter imageFromCurrentFramebuffer];
}


@end
