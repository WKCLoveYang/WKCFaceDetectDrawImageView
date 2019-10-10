//
//  FaceDetectModel.h
//  FaceDetect
//
//  Created by wkcloveYang on 2019/10/9.
//  Copyright © 2019 wkcloveYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WKCFaceDetectFace : NSObject

// 左眼(9点钟方向开始, 顺时针转)
@property (nonatomic, assign) CGPoint leftEye0;
@property (nonatomic, assign) CGPoint leftEye1;
@property (nonatomic, assign) CGPoint leftEye2;
@property (nonatomic, assign) CGPoint leftEye3;
@property (nonatomic, assign) CGPoint leftEye4;
@property (nonatomic, assign) CGPoint leftEye5;

// 右眼(3点钟方向开始, 逆时针转)
@property (nonatomic, assign) CGPoint rightEye0;
@property (nonatomic, assign) CGPoint rightEye1;
@property (nonatomic, assign) CGPoint rightEye2;
@property (nonatomic, assign) CGPoint rightEye3;
@property (nonatomic, assign) CGPoint rightEye4;
@property (nonatomic, assign) CGPoint rightEye5;

// 左眉毛(同左眼)
@property (nonatomic, assign) CGPoint leftEyebrow0;
@property (nonatomic, assign) CGPoint leftEyebrow1;
@property (nonatomic, assign) CGPoint leftEyebrow2;
@property (nonatomic, assign) CGPoint leftEyebrow3;
@property (nonatomic, assign) CGPoint leftEyebrow4;
@property (nonatomic, assign) CGPoint leftEyebrow5;

// 右眉毛(同左眼)
@property (nonatomic, assign) CGPoint rightEyebrow0;
@property (nonatomic, assign) CGPoint rightEyebrow1;
@property (nonatomic, assign) CGPoint rightEyebrow2;
@property (nonatomic, assign) CGPoint rightEyebrow3;
@property (nonatomic, assign) CGPoint rightEyebrow4;
@property (nonatomic, assign) CGPoint rightEyebrow5;

// 左瞳孔
@property (nonatomic, assign) CGPoint leftPupil;

// 右瞳孔
@property (nonatomic, assign) CGPoint rightPupil;

// 鼻子(从两眼间的鼻梁中间开始, 逆时针转)
@property (nonatomic, assign) CGPoint nose0;
@property (nonatomic, assign) CGPoint nose1;
@property (nonatomic, assign) CGPoint nose2;
@property (nonatomic, assign) CGPoint nose3;
@property (nonatomic, assign) CGPoint nose4;
@property (nonatomic, assign) CGPoint nose5;
@property (nonatomic, assign) CGPoint nose6;
@property (nonatomic, assign) CGPoint nose7;

// 鼻子轮廓(与鼻子差不多)
@property (nonatomic, assign) CGPoint noseCrest0;
@property (nonatomic, assign) CGPoint noseCrest1;
@property (nonatomic, assign) CGPoint noseCrest2;
@property (nonatomic, assign) CGPoint noseCrest3;
@property (nonatomic, assign) CGPoint noseCrest4;
@property (nonatomic, assign) CGPoint noseCrest5;

// 中心线(从两眼间的鼻梁中间开始,向下至下巴)
@property (nonatomic, assign) CGPoint medianLine0;
@property (nonatomic, assign) CGPoint medianLine1;
@property (nonatomic, assign) CGPoint medianLine2;
@property (nonatomic, assign) CGPoint medianLine3;
@property (nonatomic, assign) CGPoint medianLine4;
@property (nonatomic, assign) CGPoint medianLine5;
@property (nonatomic, assign) CGPoint medianLine6;
@property (nonatomic, assign) CGPoint medianLine7;
@property (nonatomic, assign) CGPoint medianLine8;
@property (nonatomic, assign) CGPoint medianLine9;

// 外唇(9点钟方向开始, 顺指针转)
@property (nonatomic, assign) CGPoint outerLips0;
@property (nonatomic, assign) CGPoint outerLips1;
@property (nonatomic, assign) CGPoint outerLips2;
@property (nonatomic, assign) CGPoint outerLips3;
@property (nonatomic, assign) CGPoint outerLips4;
@property (nonatomic, assign) CGPoint outerLips5;
@property (nonatomic, assign) CGPoint outerLips6;
@property (nonatomic, assign) CGPoint outerLips7;
@property (nonatomic, assign) CGPoint outerLips8;
@property (nonatomic, assign) CGPoint outerLips9;
@property (nonatomic, assign) CGPoint outerLips10;
@property (nonatomic, assign) CGPoint outerLips11;
@property (nonatomic, assign) CGPoint outerLips12;
@property (nonatomic, assign) CGPoint outerLips13;

// 内唇(方向同外唇)
@property (nonatomic, assign) CGPoint innerLips0;
@property (nonatomic, assign) CGPoint innerLips1;
@property (nonatomic, assign) CGPoint innerLips2;
@property (nonatomic, assign) CGPoint innerLips3;
@property (nonatomic, assign) CGPoint innerLips4;
@property (nonatomic, assign) CGPoint innerLips5;

// 脸轮廓(3点钟方向开始, 顺指针转)
@property (nonatomic, assign) CGPoint faceContour0;
@property (nonatomic, assign) CGPoint faceContour1;
@property (nonatomic, assign) CGPoint faceContour2;
@property (nonatomic, assign) CGPoint faceContour3;
@property (nonatomic, assign) CGPoint faceContour4;
@property (nonatomic, assign) CGPoint faceContour5;
@property (nonatomic, assign) CGPoint faceContour6;
@property (nonatomic, assign) CGPoint faceContour7;
@property (nonatomic, assign) CGPoint faceContour8;
@property (nonatomic, assign) CGPoint faceContour9;
@property (nonatomic, assign) CGPoint faceContour10;
@property (nonatomic, assign) CGPoint faceContour11;
@property (nonatomic, assign) CGPoint faceContour12;
@property (nonatomic, assign) CGPoint faceContour13;
@property (nonatomic, assign) CGPoint faceContour14;
@property (nonatomic, assign) CGPoint faceContour15;
@property (nonatomic, assign) CGPoint faceContour16;


// 以下都是计算的

// 两眉毛中间
@property (nonatomic, assign) CGPoint eyebrowMiddle;

// 左侧脸中心
@property (nonatomic, assign) CGPoint leftFaceCenter;

// 右侧脸中心
@property (nonatomic, assign) CGPoint rightFaceCenter;

// 左侧鼻子中心
@property (nonatomic, assign) CGPoint leftNoseCenter;

//右侧鼻子中心
@property (nonatomic, assign) CGPoint rightNoseCenter;

@end

@interface WKCFaceDetectModel : NSObject

@property (nonatomic, strong) NSArray <WKCFaceDetectFace *>* faces;

@end
