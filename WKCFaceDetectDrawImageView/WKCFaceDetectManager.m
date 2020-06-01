//
//  FaceDetectManager.m
//  FaceDetect
//
//  Created by wkcloveYang on 2019/10/9.
//  Copyright © 2019 wkcloveYang. All rights reserved.
//

#import "WKCFaceDetectManager.h"
#import <Vision/Vision.h>

@interface WKCFaceDetectManager()

@property (nonatomic, strong) UIImage * image;
@property (nonatomic, assign) CGSize imageViewSize;
@property (nonatomic, assign) UIViewContentMode imageViewMode;

@end


@implementation WKCFaceDetectManager

+ (WKCFaceDetectManager *)shared
{
    static WKCFaceDetectManager * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[WKCFaceDetectManager alloc] init];
    });
    
    return instance;
}

- (void)detectFace:(UIImage *)faceImage
     imageViewSize:(CGSize)size
     imageViewMode:(UIViewContentMode)imageViewMode
  completionHandle:(void(^)(WKCFaceDetectModel * model))handle
{
    _image = faceImage;
    _imageViewSize = size;
    _imageViewMode = imageViewMode;
    
    CIImage * convertImage = [[CIImage alloc] initWithImage:faceImage];
    
    VNImageRequestHandler * detectRequestHandle = [[VNImageRequestHandler alloc] initWithCIImage:convertImage options:@{}];
    
    VNDetectFaceLandmarksRequest * detectRequest = [[VNDetectFaceLandmarksRequest alloc] initWithCompletionHandler:^(VNRequest * _Nonnull request, NSError * _Nullable error) {
        if (error) {
            if (handle) {
                handle(nil);
            }
        } else {
           WKCFaceDetectModel * model = [self handleLandmarksWithRequest:request];
            if (handle) {
                handle(model);
            }
        }
    }];

    [detectRequestHandle performRequests:@[detectRequest] error:nil];
}

- (WKCFaceDetectModel *)handleLandmarksWithRequest:(VNRequest *)request
{
    
    NSMutableArray <WKCFaceDetectFace *>* facesArray = [NSMutableArray array];
    NSArray * observations = request.results;
    WKCFaceDetectModel * model = [[WKCFaceDetectModel alloc] init];
    
    for (VNFaceObservation * observation in observations) {
        
        VNFaceLandmarks2D * landmarks = observation.landmarks;
        
        WKCFaceDetectFace * face = [[WKCFaceDetectFace alloc] init];
        
        VNFaceLandmarkRegion2D * leftEye = landmarks.leftEye;
        NSArray <NSValue *>* leftEyeValues = [self pointsWithLanmarks:leftEye image:_image observation:observation size:_imageViewSize mode:_imageViewMode];
        face.leftEye0 = leftEyeValues[0].CGPointValue;
        face.leftEye1 = leftEyeValues[1].CGPointValue;
        face.leftEye2 = leftEyeValues[2].CGPointValue;
        face.leftEye3 = leftEyeValues[3].CGPointValue;
        face.leftEye4 = leftEyeValues[4].CGPointValue;
        face.leftEye5 = leftEyeValues[5].CGPointValue;
        
        
        VNFaceLandmarkRegion2D * rightEye = landmarks.rightEye;
        NSArray <NSValue *>* rightEyeValues = [self pointsWithLanmarks:rightEye image:_image observation:observation size:_imageViewSize mode:_imageViewMode];
        face.rightEye0 = rightEyeValues[0].CGPointValue;
        face.rightEye1 = rightEyeValues[1].CGPointValue;
        face.rightEye2 = rightEyeValues[2].CGPointValue;
        face.rightEye3 = rightEyeValues[3].CGPointValue;
        face.rightEye4 = rightEyeValues[4].CGPointValue;
        face.rightEye5 = rightEyeValues[5].CGPointValue;
        
        VNFaceLandmarkRegion2D *leftEyebrow = landmarks.leftEyebrow;
        NSArray <NSValue *>* leftEyebrowValues = [self pointsWithLanmarks:leftEyebrow image:_image observation:observation size:_imageViewSize mode:_imageViewMode];
        face.leftEyebrow0 = leftEyebrowValues[0].CGPointValue;
        face.leftEyebrow1 = leftEyebrowValues[1].CGPointValue;
        face.leftEyebrow2 = leftEyebrowValues[2].CGPointValue;
        face.leftEyebrow3 = leftEyebrowValues[3].CGPointValue;
        face.leftEyebrow4 = leftEyebrowValues[4].CGPointValue;
        face.leftEyebrow5 = leftEyebrowValues[5].CGPointValue;

        
        VNFaceLandmarkRegion2D *rightEyebrow = landmarks.rightEyebrow;
        NSArray <NSValue *>* rightEyebrowValues = [self pointsWithLanmarks:rightEyebrow image:_image observation:observation size:_imageViewSize mode:_imageViewMode];
        face.rightEyebrow0 = rightEyebrowValues[0].CGPointValue;
        face.rightEyebrow1 = rightEyebrowValues[1].CGPointValue;
        face.rightEyebrow2 = rightEyebrowValues[2].CGPointValue;
        face.rightEyebrow3 = rightEyebrowValues[3].CGPointValue;
        face.rightEyebrow4 = rightEyebrowValues[4].CGPointValue;
        face.rightEyebrow5 = rightEyebrowValues[5].CGPointValue;
        
        
        VNFaceLandmarkRegion2D *leftPupil = landmarks.leftPupil;
        NSArray <NSValue *>* leftPupilValues = [self pointsWithLanmarks:leftPupil image:_image observation:observation size:_imageViewSize mode:_imageViewMode];
        face.leftPupil = leftPupilValues[0].CGPointValue;
        
        
        VNFaceLandmarkRegion2D *rightPupil = landmarks.rightPupil;
        NSArray <NSValue *>* rightPupilValues = [self pointsWithLanmarks:rightPupil image:_image observation:observation size:_imageViewSize mode:_imageViewMode];
        face.rightPupil = rightPupilValues[0].CGPointValue;
        
        
        VNFaceLandmarkRegion2D *nose = landmarks.nose;
        NSArray <NSValue *>* noseValues = [self pointsWithLanmarks:nose image:_image observation:observation size:_imageViewSize mode:_imageViewMode];
        face.nose0 = noseValues[0].CGPointValue;
        face.nose1 = noseValues[1].CGPointValue;
        face.nose2 = noseValues[2].CGPointValue;
        face.nose3 = noseValues[3].CGPointValue;
        face.nose4 = noseValues[4].CGPointValue;
        face.nose5 = noseValues[5].CGPointValue;
        face.nose6 = noseValues[6].CGPointValue;
        face.nose7 = noseValues[7].CGPointValue;

        
        VNFaceLandmarkRegion2D *noseCrest = landmarks.noseCrest;
        NSArray <NSValue *>* noseCrestValues = [self pointsWithLanmarks:noseCrest image:_image observation:observation size:_imageViewSize mode:_imageViewMode];
        face.noseCrest0 = noseCrestValues[0].CGPointValue;
        face.noseCrest1 = noseCrestValues[1].CGPointValue;
        face.noseCrest2 = noseCrestValues[2].CGPointValue;
        face.noseCrest3 = noseCrestValues[3].CGPointValue;
        face.noseCrest4 = noseCrestValues[4].CGPointValue;
        face.noseCrest5 = noseCrestValues[5].CGPointValue;
        
        
        VNFaceLandmarkRegion2D * medianLine = landmarks.medianLine;
        NSArray <NSValue *>* medianLineValues = [self pointsWithLanmarks:medianLine image:_image observation:observation size:_imageViewSize mode:_imageViewMode];
        face.medianLine0 = medianLineValues[0].CGPointValue;
        face.medianLine1 = medianLineValues[1].CGPointValue;
        face.medianLine2 = medianLineValues[2].CGPointValue;
        face.medianLine3 = medianLineValues[3].CGPointValue;
        face.medianLine4 = medianLineValues[4].CGPointValue;
        face.medianLine5 = medianLineValues[5].CGPointValue;
        face.medianLine6 = medianLineValues[6].CGPointValue;
        face.medianLine7 = medianLineValues[7].CGPointValue;
        face.medianLine8 = medianLineValues[8].CGPointValue;
        face.medianLine9 = medianLineValues[9].CGPointValue;
        
        
        VNFaceLandmarkRegion2D * outerLips = landmarks.outerLips;
        NSArray <NSValue *>* outerLipsValues = [self pointsWithLanmarks:outerLips image:_image observation:observation size:_imageViewSize mode:_imageViewMode];
        face.outerLips0 = outerLipsValues[0].CGPointValue;
        face.outerLips1 = outerLipsValues[1].CGPointValue;
        face.outerLips2 = outerLipsValues[2].CGPointValue;
        face.outerLips3 = outerLipsValues[3].CGPointValue;
        face.outerLips4 = outerLipsValues[4].CGPointValue;
        face.outerLips5 = outerLipsValues[5].CGPointValue;
        face.outerLips6 = outerLipsValues[6].CGPointValue;
        face.outerLips7 = outerLipsValues[7].CGPointValue;
        face.outerLips8 = outerLipsValues[8].CGPointValue;
        face.outerLips9 = outerLipsValues[9].CGPointValue;
        face.outerLips10 = outerLipsValues[10].CGPointValue;
        face.outerLips11 = outerLipsValues[11].CGPointValue;
        face.outerLips12 = outerLipsValues[12].CGPointValue;
        face.outerLips13 = outerLipsValues[13].CGPointValue;
        
        
        
        VNFaceLandmarkRegion2D * innerLips = landmarks.innerLips;
        NSArray <NSValue *>* innerLipsValues = [self pointsWithLanmarks:innerLips image:_image observation:observation size:_imageViewSize mode:_imageViewMode];
        face.innerLips0 = innerLipsValues[0].CGPointValue;
        face.innerLips1 = innerLipsValues[1].CGPointValue;
        face.innerLips2 = innerLipsValues[2].CGPointValue;
        face.innerLips3 = innerLipsValues[3].CGPointValue;
        face.innerLips4 = innerLipsValues[4].CGPointValue;
        face.innerLips5 = innerLipsValues[5].CGPointValue;
        
        
        VNFaceLandmarkRegion2D * faceContour = landmarks.faceContour;
        NSArray <NSValue *>* faceContourValues = [self pointsWithLanmarks:faceContour image:_image observation:observation size:_imageViewSize mode:_imageViewMode];
        face.faceContour0 = faceContourValues[0].CGPointValue;
        face.faceContour1 = faceContourValues[1].CGPointValue;
        face.faceContour2 = faceContourValues[2].CGPointValue;
        face.faceContour3 = faceContourValues[3].CGPointValue;
        face.faceContour4 = faceContourValues[4].CGPointValue;
        face.faceContour5 = faceContourValues[5].CGPointValue;
        face.faceContour6 = faceContourValues[6].CGPointValue;
        face.faceContour7 = faceContourValues[7].CGPointValue;
        face.faceContour8 = faceContourValues[8].CGPointValue;
        face.faceContour9 = faceContourValues[9].CGPointValue;
        face.faceContour10 = faceContourValues[10].CGPointValue;
        face.faceContour11 = faceContourValues[11].CGPointValue;
        face.faceContour12 = faceContourValues[12].CGPointValue;
        face.faceContour13 = faceContourValues[13].CGPointValue;
        face.faceContour14 = faceContourValues[14].CGPointValue;
        face.faceContour15 = faceContourValues[15].CGPointValue;
        face.faceContour16 = faceContourValues[16].CGPointValue;
    
        [facesArray addObject:face];
    }
    
    model.faces = facesArray;
    
    return model;
}

- (NSArray <NSValue *>*)pointsWithLanmarks:(VNFaceLandmarkRegion2D *)lanmarks
                                     image:(UIImage *)image
                               observation:(VNFaceObservation *)observation
                                      size:(CGSize)size
                                      mode:(UIViewContentMode)mode
{
    NSMutableArray <NSValue *>* array = [NSMutableArray array];
    for (int i = 0; i < lanmarks.pointCount; i ++) {
        CGPoint point = lanmarks.normalizedPoints[i];
        CGPoint newPoint = [self pointTranslateWithImage:image observation:observation landmarkPoint:point];
        CGPoint imagePoint = [self imagePointToImageViewSize:size mode:mode originImage:image originPoint:newPoint];
        NSValue * value = [NSValue valueWithCGPoint:imagePoint];
        [array addObject:value];
    }
    return array;
}

- (CGPoint)pointTranslateWithImage:(UIImage *)image
                       observation:(VNFaceObservation *)observation
                     landmarkPoint:(CGPoint)landmarkPoint
{
    CGFloat width = image.size.width * observation.boundingBox.size.width;
    CGFloat height = image.size.height * observation.boundingBox.size.height;
    CGFloat x = landmarkPoint.x * width + observation.boundingBox.origin.x * image.size.width;
    CGFloat y = image.size.height - (landmarkPoint.y * height + observation.boundingBox.origin.y * image.size.height);
    CGPoint newPoint = CGPointMake(x, y);
    return newPoint;
}

- (CGPoint)imagePointToImageViewSize:(CGSize)size
                                mode:(UIViewContentMode)mode
                         originImage:(UIImage *)originImage
                         originPoint:(CGPoint)originPoint
{
    CGFloat imageViewWidth = size.width;
    CGFloat imageViewHeight = size.height;
    CGFloat imageWidth = originImage.size.width;
    CGFloat imageHeight = originImage.size.height;
    
    CGFloat x = 0, y = 0;
    
    if (mode == UIViewContentModeScaleAspectFit) {
        if (imageHeight / imageWidth < imageViewHeight / imageViewWidth) {
            x = originPoint.x / imageWidth * imageViewWidth;
            CGFloat imageNewHeight = imageHeight / imageWidth * imageViewWidth;
            y = (imageViewHeight - imageNewHeight) / 2.0 + originPoint.y / imageHeight * imageNewHeight;
        } else {
            y = originPoint.y / imageHeight * imageViewHeight;
            CGFloat imageNewWidth = imageWidth / imageHeight * imageViewHeight;
            x = (imageViewWidth - imageNewWidth) / 2.0 + originPoint.x / imageWidth * imageNewWidth;
        }
    } else {
        if (imageHeight / imageWidth < imageViewHeight / imageViewWidth) {
            y = originPoint.y / imageHeight * imageViewHeight;
            CGFloat imageNewWidth = imageWidth / imageHeight * imageViewHeight;
            x = (imageViewWidth - imageNewWidth) / 2.0 + originPoint.x / imageWidth * imageNewWidth;
        } else {
            x = originPoint.x / imageWidth * imageViewWidth;
            CGFloat imageNewHeight = imageHeight / imageWidth * imageViewWidth;
            y = (imageViewHeight - imageNewHeight) / 2.0 + originPoint.y / imageHeight * imageNewHeight;
        }
    }
    
    CGPoint translatePoint = CGPointMake(x, y);
    return translatePoint;
}

@end
