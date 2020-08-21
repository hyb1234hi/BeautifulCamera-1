//
//  CCAssetHelper.h
//  CCBeautifulCamera
//
//  Created by CC老师 on 2019/6/18.
//  Copyright © 2019年 CC老师. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCAssetHelper : NSObject

/// 获取视频的第一帧
+ (UIImage *)videoPreviewImageWithURL:(NSURL *)url;

/// 合并视频
+ (void)mergeVideos:(NSArray *)videoPaths toExportPath:(NSString *)exportPath completion:(void (^)(void))completion;

@end
