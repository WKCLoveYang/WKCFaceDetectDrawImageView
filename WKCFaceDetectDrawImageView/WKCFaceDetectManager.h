//
//  FaceDetectManager.h
//  FaceDetect
//
//  Created by wkcloveYang on 2019/10/9.
//  Copyright © 2019 wkcloveYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WKCFaceDetectModel.h"

@interface WKCFaceDetectManager : NSObject

+ (WKCFaceDetectManager *)shared;

- (void)detectFace:(UIImage *)faceImage
     imageViewSize:(CGSize)size
     imageViewMode:(UIViewContentMode)imageViewMode
  completionHandle:(void(^)(WKCFaceDetectModel * model))handle;

@end
