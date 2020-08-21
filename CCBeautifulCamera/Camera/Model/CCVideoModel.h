//
//  CCVideoModel.h
//  CCBeautifulCamera
//
//  Created by CC老师 on 2019/6/18.
//  Copyright © 2019年 CC老师. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface CCVideoModel : NSObject

@property (nonatomic, copy) NSString *filePath;
@property (nonatomic, strong) AVURLAsset *asset;

@end
