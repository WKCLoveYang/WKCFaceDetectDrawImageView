//
//  FaceDetectDrawImageView.h
//  FaceDetect
//
//  Created by wkcloveYang on 2019/10/9.
//  Copyright © 2019 wkcloveYang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, WKCFaceDetectDrawState) {
    WKCFaceDetectDrawStateNoFace  = 0,
    WKCFaceDetectDrawStateSuccess = 1
};

@interface WKCFaceDetectDrawImageView : UIImageView

/// 画线动画时间
@property (nonatomic, assign) CGFloat drawAnimationDuration;

/// 画线颜色
@property (nonatomic, strong) UIColor * drawColor;

/// 画线宽度
@property (nonatomic, assign) CGFloat drawWidth;

/// 画完是否去掉线 -> 默认YES
@property (nonatomic, assign) BOOL shouldDrawedRemove;

/// 画线完成回调
@property (nonatomic, copy) void(^completionBlock)(WKCFaceDetectDrawState state);

/// 注: setImage时自动开始画线


@end

