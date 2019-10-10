//
//  FaceDetectDrawImageView.m
//  FaceDetect
//
//  Created by wkcloveYang on 2019/10/9.
//  Copyright © 2019 wkcloveYang. All rights reserved.
//

#import "WKCFaceDetectDrawImageView.h"
#import "WKCFaceDetectManager.h"

@interface WKCFaceDetectDrawImageView()

@property (nonatomic, strong) NSMutableArray <NSArray <CAShapeLayer *>*>* lineLayers;

@end

@implementation WKCFaceDetectDrawImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.contentMode = UIViewContentModeScaleAspectFit;
        self.drawAnimationDuration = 2.0;
        self.drawColor = UIColor.whiteColor;
        self.drawWidth = 3.0;
        self.shouldDrawedRemove = YES;
    }
    
    return self;
}

- (void)setImage:(UIImage *)image
{
    [super setImage:image];
    
    __weak typeof(self)ws = self;
    
    [WKCFaceDetectManager.shared detectFace:image imageViewSize:self.bounds.size imageViewMode:self.contentMode completionHandle:^(WKCFaceDetectModel *model) {
        if (!model || model.faces.count == 0) {
            if (ws.completionBlock) {
                ws.completionBlock(WKCFaceDetectDrawStateNoFace);
            }
        } else {
            
            self.lineLayers = [NSMutableArray array];
            
            for (WKCFaceDetectFace * face in model.faces) {
                
                NSMutableArray * lines = [NSMutableArray array];
                
                // 右半边脸
                UIBezierPath * line1 = [UIBezierPath bezierPath];
                [line1 moveToPoint:face.eyebrowMiddle];
                [line1 addLineToPoint:face.rightEye3];
                [line1 addLineToPoint:face.rightEye2];
                [line1 addLineToPoint:face.rightEye1];
                [line1 addLineToPoint:face.rightEye0];
                [line1 addLineToPoint:face.rightEye5];
                [line1 addLineToPoint:face.rightEye4];
                [line1 addLineToPoint:face.rightEye3];
                
                UIBezierPath * line2 = [UIBezierPath bezierPath];
                [line2 moveToPoint:face.eyebrowMiddle];
                [line2 addLineToPoint:face.rightEyebrow2];
                [line2 addLineToPoint:face.rightEye2];
                
                UIBezierPath * line3 = [UIBezierPath bezierPath];
                [line3 moveToPoint:face.eyebrowMiddle];
                [line3 addLineToPoint:face.rightEyebrow2];
                [line3 addLineToPoint:face.rightEyebrow1];
                [line3 addLineToPoint:face.rightEye1];
                
                UIBezierPath * line4 = [UIBezierPath bezierPath];
                [line4 moveToPoint:face.eyebrowMiddle];
                [line4 addLineToPoint:face.rightEyebrow2];
                [line4 addLineToPoint:face.rightEyebrow1];
                [line4 addLineToPoint:face.rightEyebrow0];
                [line4 addLineToPoint:face.rightEye0];
                [line4 addLineToPoint:face.faceContour1];
                
                UIBezierPath * line5 = [UIBezierPath bezierPath];
                [line5 moveToPoint:face.eyebrowMiddle];
                [line5 addLineToPoint:face.rightEyebrow2];
                [line5 addLineToPoint:face.rightEyebrow1];
                [line5 addLineToPoint:face.rightEyebrow0];
                [line5 addLineToPoint:face.rightEye0];
                [line5 addLineToPoint:face.rightEye5];
                [line5 addLineToPoint:face.rightFaceCenter];
                [line5 addLineToPoint:face.faceContour1];
                
                UIBezierPath * line6 = [UIBezierPath bezierPath];
                [line6 moveToPoint:face.eyebrowMiddle];
                [line6 addLineToPoint:face.rightEyebrow2];
                [line6 addLineToPoint:face.rightEyebrow1];
                [line6 addLineToPoint:face.rightEyebrow0];
                [line6 addLineToPoint:face.rightEye0];
                [line6 addLineToPoint:face.rightEye5];
                [line6 addLineToPoint:face.rightFaceCenter];
                [line6 addLineToPoint:face.faceContour3];
                
                UIBezierPath * line7 = [UIBezierPath bezierPath];
                [line7 moveToPoint:face.eyebrowMiddle];
                [line7 addLineToPoint:face.rightEyebrow2];
                [line7 addLineToPoint:face.rightEyebrow1];
                [line7 addLineToPoint:face.rightEyebrow0];
                [line7 addLineToPoint:face.rightEye0];
                [line7 addLineToPoint:face.rightEye5];
                [line7 addLineToPoint:face.rightFaceCenter];
                [line7 addLineToPoint:face.faceContour5];
                
                UIBezierPath * line8 = [UIBezierPath bezierPath];
                [line8 moveToPoint:face.eyebrowMiddle];
                [line8 addLineToPoint:face.rightEyebrow2];
                [line8 addLineToPoint:face.rightEyebrow1];
                [line8 addLineToPoint:face.rightEyebrow0];
                [line8 addLineToPoint:face.rightEye0];
                [line8 addLineToPoint:face.rightEye5];
                [line8 addLineToPoint:face.rightFaceCenter];
                [line8 addLineToPoint:face.outerLips7];
                [line8 addLineToPoint:face.faceContour7];
                
                UIBezierPath * line9 = [UIBezierPath bezierPath];
                [line9 moveToPoint:face.eyebrowMiddle];
                [line9 addLineToPoint:face.rightEyebrow2];
                [line9 addLineToPoint:face.rightEyebrow1];
                [line9 addLineToPoint:face.rightEyebrow0];
                [line9 addLineToPoint:face.rightEye0];
                [line9 addLineToPoint:face.rightEye5];
                [line9 addLineToPoint:face.rightFaceCenter];
                [line9 addLineToPoint:face.outerLips7];
                [line9 addLineToPoint:face.faceContour8];
                
                UIBezierPath * line10 = [UIBezierPath bezierPath];
                [line10 moveToPoint:face.eyebrowMiddle];
                [line10 addLineToPoint:face.rightEyebrow2];
                [line10 addLineToPoint:face.rightEyebrow1];
                [line10 addLineToPoint:face.rightEyebrow0];
                [line10 addLineToPoint:face.rightEye0];
                [line10 addLineToPoint:face.rightEye5];
                [line10 addLineToPoint:face.nose6];
                [line10 addLineToPoint:face.outerLips7];
                
                UIBezierPath * line11 = [UIBezierPath bezierPath];
                [line11 moveToPoint:face.eyebrowMiddle];
                [line11 addLineToPoint:face.rightEyebrow2];
                [line11 addLineToPoint:face.rightEyebrow1];
                [line11 addLineToPoint:face.rightEyebrow0];
                [line11 addLineToPoint:face.rightEye0];
                [line11 addLineToPoint:face.rightEye5];
                [line11 addLineToPoint:face.rightFaceCenter];
                [line11 addLineToPoint:face.nose6];
                
                UIBezierPath * line12 = [UIBezierPath bezierPath];
                [line12 moveToPoint:face.eyebrowMiddle];
                [line12 addLineToPoint:face.rightNoseCenter];
                [line12 addLineToPoint:face.nose6];
                [line12 addLineToPoint:face.outerLips7];
                [line12 addLineToPoint:face.faceContour5];
                
                UIBezierPath * line13 = [UIBezierPath bezierPath];
                [line13 moveToPoint:face.eyebrowMiddle];
                [line13 addLineToPoint:face.rightEye3];
                [line13 addLineToPoint:face.rightNoseCenter];
                [line13 addLineToPoint:face.leftNoseCenter];

                UIBezierPath * line14 = [UIBezierPath bezierPath];
                [line14 moveToPoint:face.eyebrowMiddle];
                [line14 addLineToPoint:face.rightNoseCenter];
                [line14 addLineToPoint:face.nose6];
                [line14 addLineToPoint:face.nose5];
                [line14 addLineToPoint:face.nose4];
                
                UIBezierPath * line15 = [UIBezierPath bezierPath];
                [line15 moveToPoint:face.eyebrowMiddle];
                [line15 addLineToPoint:face.rightNoseCenter];
                [line15 addLineToPoint:face.nose6];
                [line15 addLineToPoint:face.outerLips7];
                [line15 addLineToPoint:face.outerLips5];
                [line15 addLineToPoint:face.outerLips3];
                
                UIBezierPath * line16 = [UIBezierPath bezierPath];
                [line16 moveToPoint:face.eyebrowMiddle];
                [line16 addLineToPoint:face.rightNoseCenter];
                [line16 addLineToPoint:face.nose6];
                [line16 addLineToPoint:face.outerLips7];
                [line16 addLineToPoint:face.outerLips9];
                [line16 addLineToPoint:face.outerLips11];
                
                UIBezierPath * line17 = [UIBezierPath bezierPath];
                [line17 moveToPoint:face.eyebrowMiddle];
                [line17 addLineToPoint:face.rightNoseCenter];
                [line17 addLineToPoint:face.nose6];
                [line17 addLineToPoint:face.outerLips7];
                [line17 addLineToPoint:face.outerLips9];
                [line17 addLineToPoint:face.faceContour8];
                
                
                // 左半边脸
                UIBezierPath * line18 = [UIBezierPath bezierPath];
                [line18 moveToPoint:face.eyebrowMiddle];
                [line18 addLineToPoint:face.leftEye3];
                [line18 addLineToPoint:face.leftEye2];
                [line18 addLineToPoint:face.leftEye1];
                [line18 addLineToPoint:face.leftEye0];
                [line18 addLineToPoint:face.leftEye5];
                [line18 addLineToPoint:face.leftEye4];
                [line18 addLineToPoint:face.leftEye3];
                
                UIBezierPath * line19 = [UIBezierPath bezierPath];
                [line19 moveToPoint:face.eyebrowMiddle];
                [line19 addLineToPoint:face.leftEyebrow2];
                [line19 addLineToPoint:face.leftEye2];
                
                UIBezierPath * line20 = [UIBezierPath bezierPath];
                [line20 moveToPoint:face.eyebrowMiddle];
                [line20 addLineToPoint:face.leftEyebrow2];
                [line20 addLineToPoint:face.leftEyebrow1];
                [line20 addLineToPoint:face.leftEye1];
                
                UIBezierPath * line21 = [UIBezierPath bezierPath];
                [line21 moveToPoint:face.eyebrowMiddle];
                [line21 addLineToPoint:face.leftEyebrow2];
                [line21 addLineToPoint:face.leftEyebrow1];
                [line21 addLineToPoint:face.leftEyebrow0];
                [line21 addLineToPoint:face.leftEye0];
                [line21 addLineToPoint:face.faceContour15];
                
                UIBezierPath * line22 = [UIBezierPath bezierPath];
                [line22 moveToPoint:face.eyebrowMiddle];
                [line22 addLineToPoint:face.leftEyebrow2];
                [line22 addLineToPoint:face.leftEyebrow1];
                [line22 addLineToPoint:face.leftEyebrow0];
                [line22 addLineToPoint:face.leftEye0];
                [line22 addLineToPoint:face.leftEye5];
                [line22 addLineToPoint:face.leftFaceCenter];
                [line22 addLineToPoint:face.faceContour15];
                
                UIBezierPath * line23 = [UIBezierPath bezierPath];
                [line23 moveToPoint:face.eyebrowMiddle];
                [line23 addLineToPoint:face.leftEyebrow2];
                [line23 addLineToPoint:face.leftEyebrow1];
                [line23 addLineToPoint:face.leftEyebrow0];
                [line23 addLineToPoint:face.leftEye0];
                [line23 addLineToPoint:face.leftEye5];
                [line23 addLineToPoint:face.leftFaceCenter];
                [line23 addLineToPoint:face.faceContour13];
                
                UIBezierPath * line24 = [UIBezierPath bezierPath];
                [line24 moveToPoint:face.eyebrowMiddle];
                [line24 addLineToPoint:face.leftEyebrow2];
                [line24 addLineToPoint:face.leftEyebrow1];
                [line24 addLineToPoint:face.leftEyebrow0];
                [line24 addLineToPoint:face.leftEye0];
                [line24 addLineToPoint:face.leftEye5];
                [line24 addLineToPoint:face.leftFaceCenter];
                [line24 addLineToPoint:face.faceContour11];
                
                UIBezierPath * line25 = [UIBezierPath bezierPath];
                [line25 moveToPoint:face.eyebrowMiddle];
                [line25 addLineToPoint:face.leftEyebrow2];
                [line25 addLineToPoint:face.leftEyebrow1];
                [line25 addLineToPoint:face.leftEyebrow0];
                [line25 addLineToPoint:face.leftEye0];
                [line25 addLineToPoint:face.leftEye5];
                [line25 addLineToPoint:face.leftFaceCenter];
                [line25 addLineToPoint:face.outerLips13];
                [line25 addLineToPoint:face.faceContour9];
                
                UIBezierPath * line26 = [UIBezierPath bezierPath];
                [line26 moveToPoint:face.eyebrowMiddle];
                [line26 addLineToPoint:face.leftEyebrow2];
                [line26 addLineToPoint:face.leftEyebrow1];
                [line26 addLineToPoint:face.leftEyebrow0];
                [line26 addLineToPoint:face.leftEye0];
                [line26 addLineToPoint:face.leftEye5];
                [line26 addLineToPoint:face.leftFaceCenter];
                [line26 addLineToPoint:face.outerLips13];
                [line26 addLineToPoint:face.faceContour8];
                
                UIBezierPath * line27 = [UIBezierPath bezierPath];
                [line27 moveToPoint:face.eyebrowMiddle];
                [line27 addLineToPoint:face.leftEyebrow2];
                [line27 addLineToPoint:face.leftEyebrow1];
                [line27 addLineToPoint:face.leftEyebrow0];
                [line27 addLineToPoint:face.leftEye0];
                [line27 addLineToPoint:face.leftEye5];
                [line27 addLineToPoint:face.nose2];
                [line27 addLineToPoint:face.outerLips13];
                
                UIBezierPath * line28 = [UIBezierPath bezierPath];
                [line28 moveToPoint:face.eyebrowMiddle];
                [line28 addLineToPoint:face.leftEyebrow2];
                [line28 addLineToPoint:face.leftEyebrow1];
                [line28 addLineToPoint:face.leftEyebrow0];
                [line28 addLineToPoint:face.leftEye0];
                [line28 addLineToPoint:face.leftEye5];
                [line28 addLineToPoint:face.leftFaceCenter];
                [line28 addLineToPoint:face.nose2];
                
                UIBezierPath * line29 = [UIBezierPath bezierPath];
                [line29 moveToPoint:face.eyebrowMiddle];
                [line29 addLineToPoint:face.leftNoseCenter];
                [line29 addLineToPoint:face.nose2];
                [line29 addLineToPoint:face.outerLips13];
                [line29 addLineToPoint:face.faceContour11];
                
                UIBezierPath * line30 = [UIBezierPath bezierPath];
                [line30 moveToPoint:face.eyebrowMiddle];
                [line30 addLineToPoint:face.leftEye3];
                [line30 addLineToPoint:face.leftNoseCenter];
                
                UIBezierPath * line31 = [UIBezierPath bezierPath];
                [line31 moveToPoint:face.eyebrowMiddle];
                [line31 addLineToPoint:face.leftNoseCenter];
                [line31 addLineToPoint:face.nose2];
                [line31 addLineToPoint:face.nose3];
                [line31 addLineToPoint:face.nose4];
                [line31 addLineToPoint:face.nose5];
                
                UIBezierPath * line32 = [UIBezierPath bezierPath];
                [line32 moveToPoint:face.eyebrowMiddle];
                [line32 addLineToPoint:face.leftNoseCenter];
                [line32 addLineToPoint:face.nose2];
                [line32 addLineToPoint:face.outerLips13];
                [line32 addLineToPoint:face.outerLips1];
                [line32 addLineToPoint:face.outerLips3];
                [line32 addLineToPoint:face.outerLips5];
                
                UIBezierPath * line33 = [UIBezierPath bezierPath];
                [line33 moveToPoint:face.eyebrowMiddle];
                [line33 addLineToPoint:face.leftNoseCenter];
                [line33 addLineToPoint:face.nose2];
                [line33 addLineToPoint:face.outerLips13];
                [line33 addLineToPoint:face.outerLips11];
                [line33 addLineToPoint:face.outerLips9];
                [line33 addLineToPoint:face.outerLips7];
                
                UIBezierPath * line34 = [UIBezierPath bezierPath];
                [line34 moveToPoint:face.eyebrowMiddle];
                [line34 addLineToPoint:face.leftNoseCenter];
                [line34 addLineToPoint:face.nose2];
                [line34 addLineToPoint:face.outerLips13];
                [line34 addLineToPoint:face.outerLips11];
                [line34 addLineToPoint:face.faceContour8];
                
                
                // 左右轮廓
                UIBezierPath * line35 = [UIBezierPath bezierPath];
                [line35 moveToPoint:face.eyebrowMiddle];
                [line35 addLineToPoint:face.rightEyebrow2];
                [line35 addLineToPoint:face.rightEyebrow1];
                [line35 addLineToPoint:face.rightEyebrow0];
                [line35 addLineToPoint:face.faceContour1];
                [line35 addLineToPoint:face.faceContour3];
                [line35 addLineToPoint:face.faceContour5];
                [line35 addLineToPoint:face.faceContour7];
                [line35 addLineToPoint:face.faceContour8];
                
                UIBezierPath * line36 = [UIBezierPath bezierPath];
                [line36 moveToPoint:face.eyebrowMiddle];
                [line36 addLineToPoint:face.leftEyebrow2];
                [line36 addLineToPoint:face.leftEyebrow1];
                [line36 addLineToPoint:face.leftEyebrow0];
                [line36 addLineToPoint:face.faceContour15];
                [line36 addLineToPoint:face.faceContour13];
                [line36 addLineToPoint:face.faceContour11];
                [line36 addLineToPoint:face.faceContour9];
                [line36 addLineToPoint:face.faceContour8];
                
                CAShapeLayer * layer1 = [self createLineWithPath:line1];
                [self.layer addSublayer:layer1];
                
                CAShapeLayer * layer2 = [self createLineWithPath:line2];
                [self.layer addSublayer:layer2];
                
                CAShapeLayer * layer3 = [self createLineWithPath:line3];
                [self.layer addSublayer:layer3];
                
                CAShapeLayer * layer4 = [self createLineWithPath:line4];
                [self.layer addSublayer:layer4];
                
                CAShapeLayer * layer5 = [self createLineWithPath:line5];
                [self.layer addSublayer:layer5];
                
                CAShapeLayer * layer6 = [self createLineWithPath:line6];
                [self.layer addSublayer:layer6];
                
                CAShapeLayer * layer7 = [self createLineWithPath:line7];
                [self.layer addSublayer:layer7];
                
                CAShapeLayer * layer8 = [self createLineWithPath:line8];
                [self.layer addSublayer:layer8];
                
                CAShapeLayer * layer9 = [self createLineWithPath:line9];
                [self.layer addSublayer:layer9];
                
                CAShapeLayer * layer10 = [self createLineWithPath:line10];
                [self.layer addSublayer:layer10];
                
                CAShapeLayer * layer11 = [self createLineWithPath:line11];
                [self.layer addSublayer:layer11];

                CAShapeLayer * layer12 = [self createLineWithPath:line12];
                [self.layer addSublayer:layer12];
                
                CAShapeLayer * layer13 = [self createLineWithPath:line13];
                [self.layer addSublayer:layer13];
                
                CAShapeLayer * layer14 = [self createLineWithPath:line14];
                [self.layer addSublayer:layer14];
                
                CAShapeLayer * layer15 = [self createLineWithPath:line15];
                [self.layer addSublayer:layer15];
                
                CAShapeLayer * layer16 = [self createLineWithPath:line16];
                [self.layer addSublayer:layer16];
                
                CAShapeLayer * layer17 = [self createLineWithPath:line17];
                [self.layer addSublayer:layer17];
                
                
                
                CAShapeLayer * layer18 = [self createLineWithPath:line18];
                [self.layer addSublayer:layer18];
                
                CAShapeLayer * layer19 = [self createLineWithPath:line19];
                [self.layer addSublayer:layer19];
                
                CAShapeLayer * layer20 = [self createLineWithPath:line20];
                [self.layer addSublayer:layer20];
                
                CAShapeLayer * layer21 = [self createLineWithPath:line21];
                [self.layer addSublayer:layer21];
                
                CAShapeLayer * layer22 = [self createLineWithPath:line22];
                [self.layer addSublayer:layer22];
                
                CAShapeLayer * layer23 = [self createLineWithPath:line23];
                [self.layer addSublayer:layer23];
                
                CAShapeLayer * layer24 = [self createLineWithPath:line24];
                [self.layer addSublayer:layer24];
                
                CAShapeLayer * layer25 = [self createLineWithPath:line25];
                [self.layer addSublayer:layer25];
                
                CAShapeLayer * layer26 = [self createLineWithPath:line26];
                [self.layer addSublayer:layer26];
                
                CAShapeLayer * layer27 = [self createLineWithPath:line27];
                [self.layer addSublayer:layer27];
                
                CAShapeLayer * layer28 = [self createLineWithPath:line28];
                [self.layer addSublayer:layer28];
                
                CAShapeLayer * layer29 = [self createLineWithPath:line29];
                [self.layer addSublayer:layer29];
                
                CAShapeLayer * layer30 = [self createLineWithPath:line30];
                [self.layer addSublayer:layer30];
                
                CAShapeLayer * layer31 = [self createLineWithPath:line31];
                [self.layer addSublayer:layer31];
                
                CAShapeLayer * layer32 = [self createLineWithPath:line32];
                [self.layer addSublayer:layer32];
                
                CAShapeLayer * layer33 = [self createLineWithPath:line33];
                [self.layer addSublayer:layer33];
                
                CAShapeLayer * layer34 = [self createLineWithPath:line34];
                [self.layer addSublayer:layer34];
                
                
                
                CAShapeLayer * layer35 = [self createLineWithPath:line35];
                [self.layer addSublayer:layer35];
                
                CAShapeLayer * layer36 = [self createLineWithPath:line36];
                [self.layer addSublayer:layer36];
                
                
                [lines addObject:layer1];
                [lines addObject:layer2];
                [lines addObject:layer3];
                [lines addObject:layer4];
                [lines addObject:layer5];
                [lines addObject:layer6];
                [lines addObject:layer7];
                [lines addObject:layer8];
                [lines addObject:layer9];
                [lines addObject:layer10];
                [lines addObject:layer11];
                [lines addObject:layer12];
                [lines addObject:layer13];
                [lines addObject:layer14];
                [lines addObject:layer15];
                [lines addObject:layer16];
                [lines addObject:layer17];
                
                [lines addObject:layer18];
                [lines addObject:layer19];
                [lines addObject:layer20];
                [lines addObject:layer21];
                [lines addObject:layer22];
                [lines addObject:layer23];
                [lines addObject:layer24];
                [lines addObject:layer25];
                [lines addObject:layer26];
                [lines addObject:layer27];
                [lines addObject:layer28];
                [lines addObject:layer29];
                [lines addObject:layer30];
                [lines addObject:layer31];
                [lines addObject:layer32];
                [lines addObject:layer33];
                [lines addObject:layer34];
                
                [lines addObject:layer35];
                [lines addObject:layer36];

                
                [self.lineLayers addObject:lines];
                
                if (self.shouldDrawedRemove) {
                    [self performSelector:@selector(removeAllLines) withObject:nil afterDelay:self.drawAnimationDuration + 0.4];
                }
                
            }
        }
    }];
}

- (void)removeAllLines
{
    if (self.completionBlock) {
        self.completionBlock(WKCFaceDetectDrawStateSuccess);
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for (NSArray * arr in self.lineLayers) {
            for (CAShapeLayer * layerLine in arr) {
                [layerLine removeAllAnimations];
                [layerLine removeFromSuperlayer];
            }
        }
    });
}


- (CAShapeLayer *)createLineWithPath:(UIBezierPath *)path
{
    CAShapeLayer * layer1 = [CAShapeLayer layer];
    layer1.lineWidth = self.drawWidth;
    layer1.strokeColor = self.drawColor.CGColor;
    layer1.fillColor = UIColor.clearColor.CGColor;
    layer1.strokeStart = 0.0;
    layer1.strokeEnd = 0.0;
    layer1.path = path.CGPath;
    
    CABasicAnimation * animation1 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation1.duration = self.drawAnimationDuration;
    animation1.fromValue = @(0.0);
    animation1.toValue = @(1.0);
    animation1.removedOnCompletion = NO;
    animation1.fillMode = kCAFillModeForwards;
    animation1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [layer1 addAnimation:animation1 forKey:nil];
    
    return layer1;
}


@end
