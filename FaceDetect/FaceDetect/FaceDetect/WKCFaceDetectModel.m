//
//  FaceDetectModel.m
//  FaceDetect
//
//  Created by wkcloveYang on 2019/10/9.
//  Copyright © 2019 wkcloveYang. All rights reserved.
//

#import "WKCFaceDetectModel.h"

@implementation WKCFaceDetectFace

- (CGPoint)eyebrowMiddle
{
    return CGPointMake((self.leftEyebrow3.x + self.rightEyebrow3.x) / 2.0, (self.leftEyebrow3.y + self.rightEyebrow3.y) / 2.0);
}

- (CGPoint)leftFaceCenter
{
    return CGPointMake((self.leftEye0.x + self.outerLips0.x) / 2.0, (self.leftEye0.y + self.outerLips0.y) / 2.0);
}

- (CGPoint)rightFaceCenter
{
    return CGPointMake((self.rightEye0.x + self.outerLips7.x) / 2.0, (self.rightEye0.y + self.outerLips7.y) / 2.0);
}

- (CGPoint)rightNoseCenter
{
    return CGPointMake((self.eyebrowMiddle.x + self.nose6.x) / 2.0, (self.eyebrowMiddle.y + self.nose6.y) / 2.0);
}

- (CGPoint)leftNoseCenter
{
  return CGPointMake((self.eyebrowMiddle.x + self.nose2.x) / 2.0, (self.eyebrowMiddle.y + self.nose2.y) / 2.0);
}

@end

@implementation WKCFaceDetectModel

@end
